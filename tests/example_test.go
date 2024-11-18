package test

import (
	"encoding/json"
	"fmt"
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
			"instance_name": "test-instance-1",
			"instance_zone": "europe-west4-a",
			// IP is left empty because it's dynamically assigned
		},
		"feature2": {
			"instance_name": "test-instance-2",
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
			terraform.InitAndApply(t, terraformOptions)

			// Get the `example_output_variable` output
			output := terraform.Output(t, terraformOptions, "example_output_variable")

			// Parse the output as JSON
			var outputData map[string]string
			err := json.Unmarshal([]byte(output), &outputData)
			assert.NoError(t, err, "Failed to parse output JSON for module %s", module)

			// Compare the output with the expected values for the module
			expected := expectedOutputs[module]

			assert.Equal(t, expected["instance_name"], outputData["instance_name"], "Instance name mismatch for module %s", module)
			assert.Equal(t, expected["instance_zone"], outputData["instance_zone"], "Instance zone mismatch for module %s", module)
			assert.NotEmpty(t, outputData["instance_ip"], "Instance IP should not be empty for module %s", module)

			// Optional: You can log the dynamically generated instance IP for reference
			t.Logf("Module %s: Instance IP is %s", module, outputData["instance_ip"])
		})
	}
}