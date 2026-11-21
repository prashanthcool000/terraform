module "my_instance_module" {
    source = "./instance"

    iname = "kops"
    ami = "ami-04b0b8ee9ce90920a"
    instance_type = "c7i-flex.large"
    key = "Putty"
    availability_zone = "ap-south-1a"
    volume = 20

    #attach dg to instance
    security_groups = [module.sg_module.sg_output[0]]

    #attach role to ec2
    iam_profile = module.iam_role_module.profile_output[0]

    # Wait until IAM policy is attached
    depends_on = [ module.iam_role_module.profile_name ]

}

module "bucket_module" {
    source = "./buckets"

    bucket_name = "prashanth.statefile-backup"
}

module "sg_module" {
    source = "./security_groups"

    sg_name = "terraform-dynamic-sg"
}

module "iam_role_module" {
    source = "./iam"

    role_name = "kops-management-role"  #role with policies
    profile_name = "kops-management-profile" #profile with role
  
}