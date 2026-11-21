output "iam_output" {
    value = [aws_iam_role.kops_role.id]
}

output "profile_output" {
    value = [aws_iam_instance_profile.kops_profile.name]
  
}