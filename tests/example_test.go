package test

import (
	"encoding/json"
	"fmt"
	"regexp"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformModules(t *testing.T) {
	// List of modules to test
	modules := []string{"feature1", "feature2"}

	// Expected outputs for each module
	expectedOutputs := map[string]map[string]string{
		"feature1": {
			"instance_zone": "europe-west4-a",
			// Leave "instance_name" blank for dynamic names
		},
		"feature2": {
			"instance_zone": "europe-west4-b",
		},
	}

	// Iterate over each module
	for _, module := range modules {
		t.Run(fmt.Sprintf("Testing module: %s", module), func(t *testing.T) {
			// Define Terraform options for the current module
			terraformOptions := &terraform.Options{
				TerraformDir: fmt.Sprintf("../terraform/modules/%s", module),
				Vars: map[string]interface{}{
					"region": "europe-west4",
				},
				NoColor: true,
			}

			// Ensure resources are cleaned up at the end of the test
			defer terraform.Destroy(t, terraformOptions)

			// Run Terraform Init and Apply
			t.Logf("Initializing and applying Terraform configuration for module: %s", module)
			terraform.InitAndApply(t, terraformOptions)

			// Get the `example_output_variable` output
			t.Logf("Fetching output variable 'example_output_variable' for module: %s", module)
			output := terraform.Output(t, terraformOptions, "example_output_variable")

			// Parse the output as JSON
			var outputData map[string]string
			err := json.Unmarshal([]byte(output), &outputData)
			assert.NoError(t, err, "Failed to parse output JSON for module %s", module)

			// Compare the output with the expected values for the module
			expected := expectedOutputs[module]

			// Validate instance zone
			assert.Equal(t, expected["instance_zone"], outputData["instance_zone"], "Instance zone mismatch for module %s", module)

			// Validate instance name starts with "test-instance-" and ends with random_pet
			instanceName := outputData["instance_name"]
			assert.NotEmpty(t, instanceName, "Instance name should not be empty for module %s", module)
			nameRegex := `^test-instance-[a-z]+-[a-z]+$`
			match, _ := regexp.MatchString(nameRegex, instanceName)
			assert.True(t, match, "Instance name '%s' does not match expected pattern for module %s", instanceName, module)

			// Validate instance IP is not empty and has a valid format
			instanceIP := outputData["instance_ip"]
			assert.NotEmpty(t, instanceIP, "Instance IP should not be empty for module %s", module)
			ipRegex := `^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$`
			match, _ = regexp.MatchString(ipRegex, instanceIP)
			assert.True(t, match, "Instance IP '%s' is not a valid IPv4 address for module %s", instanceIP, module)

			// Log instance details
			t.Logf("Module %s: Instance Name: %s, Zone: %s, IP: %s", module, instanceName, outputData["instance_zone"], instanceIP)
		})
	}
}