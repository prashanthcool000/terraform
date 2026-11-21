# 1. IAM ROLE
resource "aws_iam_role" "kops_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

#SEC23 Full Access Policy
resource "aws_iam_role_policy_attachment" "EC2_policy" {
  role = aws_iam_role.kops_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

#S3 Full Access Policy
resource "aws_iam_role_policy_attachment" "s3_policy" {
  role = aws_iam_role.kops_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

#IAM Full Access Policy
resource "aws_iam_role_policy_attachment" "iam_policy" {
  role       = aws_iam_role.kops_role.name

  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

#Admin Full Access Policy
resource "aws_iam_role_policy_attachment" "kops_admin" {
  role       = aws_iam_role.kops_role.name
  
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# 3. INSTANCE PROFILE - This connects Role to EC2
resource "aws_iam_instance_profile" "kops_profile" {
  name = var.profile_name
  role = aws_iam_role.kops_role.name
}