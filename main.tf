# Create the AWS IAM role. 
resource "aws_iam_role" "example" {
  name = var.ec2_iam_role_name
  path = "/"

  assume_role_policy = var.assume_role_policy
}

# Create AWS IAM instance profile
# Attach the role to the instance profile
resource "aws_iam_instance_profile" "example" {
  name = var.ec2_iam_role_name
  role = aws_iam_role.example.name
}

# Create a policy for the role
resource "aws_iam_policy" "example" {
  name        = var.ec2_iam_role_name
  path        = "/"
  description = var.policy_description
  policy      = var.policy
}

# Attaches the policy to the IAM role
resource "aws_iam_policy_attachment" "example" {
  name       = var.ec2_iam_role_name
  roles      = [aws_iam_role.example.name]
  policy_arn = aws_iam_policy.example.arn
}
