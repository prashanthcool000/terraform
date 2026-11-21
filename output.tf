output "instance_details" {
    value = module.my_instance_module.instance_output
}

output "sg_details" {
    value = module.sg_module.sg_output
}

output "profile_details" {
    value = module.iam_role_module.profile_output 
}

output "iam_details" {
    value = module.iam_role_module.iam_output
}

output "bucket_details" {
    value = module.bucket_module.bucket_output
}

