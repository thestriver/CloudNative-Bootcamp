package test

import (
	"fmt"
	"time"
	"testing"
	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)
func TestTerraformAwsExamplePlan(t *testing.T) {

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/webserver",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"region": "us-west-2",
			"servername": "testwebserver", 
		},
	})

	terraform.initApply(t, terraformOptions)

	defer terraform.Destroy(t, terraformOptions)

	publicIp := terraform.Output(t, terraformOptions, "public_ip")

	url := fmt.Sprintf("http://%s:8080", publicIp)

	http_helper.HttpGetWithRetry(t, url, nil, 200, "I made a terraform module", 30, 5*time.Second)

	module, diags := tfconfig.LoadModule(dir)
}
