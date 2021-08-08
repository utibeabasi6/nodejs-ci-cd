output "Elastic_beanstalk_environment_name" {
  value = aws_elastic_beanstalk_environment.github_actions_app_env.name
}

output "Elastic_beanstalk_url" {
  value = aws_elastic_beanstalk_environment.github_actions_app_env.cname
}