# S3 and DynamoDB State-Locking Configuration

terraform {
  backend "s3" {
    bucket         = "terraform-state-903bdb0b-77d7-459a-8112-d893f2696205"
    key            = "env/dev/terraform.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "StateLockTable"
    encrypt        = true
  }
}
# NOTE: The bucket must have Versioning enabled via AWS console or CLI for safety.
