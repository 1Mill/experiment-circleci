terraform {
	required_version = "~> 0.12.24"

	backend "s3" {
		bucket = "experiment-terraform-state"
		dynamodb_table = "experiment-terraform-state-locks"
		encrypt = true
		key = "global/s3/terraform.tfstate"
		profile = "terraform"
		region = "us-east-1"
		shared_credentials_file = "/root/.aws"
	}
}


resource "aws_elastic_beanstalk_application" "default" {
	description = "Exmaple node application launched by Circleci"
	name = "Terraform & Circlici"
}
resource "aws_elastic_beanstalk_environment" "default" {
	application = aws_elastic_beanstalk_application.default.name
	name = "production"
	solution_stack_name = "64bit Amazon Linux 2 v5.0.1 running Node.js 12"
}

