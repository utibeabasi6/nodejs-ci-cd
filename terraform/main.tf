provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "Ci_Cd_instance_profile"
  role = "Chefio-server-role"
}

resource "aws_elastic_beanstalk_environment" "github_actions_app_env" {
  name                = "github-actions-app-env"
  application         = aws_elastic_beanstalk_application.github_actions_app.name
  solution_stack_name = "64bit Amazon Linux 2 v5.4.4 running Node.js 14"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "${aws_iam_instance_profile.instance_profile.name}"
  }
}

resource "aws_elastic_beanstalk_application" "github_actions_app" {
  name = "github-actions-app"

}