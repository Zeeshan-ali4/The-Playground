package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformModule(t *testing.T) {
	// Define Terraform options
	terraformOptions := &terraform.Options{
		TerraformDir: "../terraform/modules/example", // Path to the Terraform module

		// Variables passed to Terraform
		Vars: map[string]interface{}{
			"region": "europe-west4",
		},

		// Disable colors in Terraform logs (useful for CI logs)
		NoColor: true,
	}

	// Deploy resources and ensure cleanup after test
	defer terraform.Destroy(t, terraformOptions) // Cleanup after test completion
	terraform.InitAndApply(t, terraformOptions)

	// Validate Terraform output
	output := terraform.Output(t, terraformOptions, "example_output_variable")
	assert.Equal(t, "expected-value", output, "Output did not match expected value")
}
