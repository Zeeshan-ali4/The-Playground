package test

import (
	"encoding/json" // Import for JSON parsing
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require" // Useful for error handling
)

func TestTerraformModule(t *testing.T) {
	// Get the Terraform directory from an environment variable
	terraformDir := os.Getenv("TERRAFORM_DIR")
	if terraformDir == "" {
		t.Fatal("TERRAFORM_DIR environment variable not set")
	}

	// Define Terraform options
	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir, // Path to the Terraform module

		// Variables passed to Terraform
		Vars: map[string]interface{}{
			"region": "europe-west4",
		},

		// Disable colors in Terraform logs (useful for CI logs)
		NoColor: true,
	}

	// Deploy resources and ensure cleanup after test
	defer terraform.Destroy(t, terraformOptions) // Cleanup resources after test completion
	terraform.InitAndApply(t, terraformOptions)

	// Fetch Terraform output
	output := terraform.Output(t, terraformOptions, "example_output_variable")

	// Parse the JSON output
	var parsedOutput map[string]string
	err := json.Unmarshal([]byte(output), &parsedOutput)
	require.NoError(t, err, "Failed to parse Terraform output")

	// Validate specific fields
	assert.Equal(t, "test-instance-1", parsedOutput["instance_name"], "Instance name mismatch")
	assert.NotEmpty(t, parsedOutput["instance_ip"], "Instance IP should not be empty")
	assert.Equal(t, "europe-west4-a", parsedOutput["instance_zone"], "Instance zone mismatch")
}