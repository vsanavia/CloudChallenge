#terraform {
#  required_providers {
#    aws = {
#      source = "hashicorp/aws"
#      version = "~> 3.70.0"
#    }
#  }
#}
provider "aws" {
  region = var.aws_region
  profile = "tf_user"
}
provider "google" {
  credentials = "/Volumes/Data/Users/victor/Documents/GCP/terraform-sa-cloudrescha.json"
  project = var.gcp_project_id
}
provider "google-beta" {
  credentials = "/Volumes/Data/Users/victor/Documents/GCP/terraform-sa-cloudrescha.json"
  project     = var.gcp_project_id
}
#Section that manages dns entries for bucket (pdf resume) and html site
resource "aws_route53_record" "web-resume2"{
  zone_id = var.dns_zone
  name = "web-resume2.sanavia.xyz"
  ttl = "300"
  type = "A"
  records = [module.lb-http.external_ip]
  depends_on = [
    module.lb-http,
  ]
}
#Section that manages dns entries for bucket (pdf resume) and html site
resource "aws_route53_record" "cv2"{
  zone_id = var.dns_zone
  name = "cv2.sanavia.xyz"
  ttl = "300"
  type = "CNAME"
  records = [aws_s3_bucket.s3_bucket_resume.bucket_domain_name]
  depends_on = [
    aws_s3_bucket.s3_bucket_resume,
  ]
}
#Section that manages google bucket to maintain external tf state
#gcp bucket was chosen as it natively supports state locking
data "terraform_remote_state" "cloudrescha_jan2022" {
backend  = "gcs" 
config = {  
    bucket = "tf-state-crc-17jan2022"
    prefix = "terraform/state"
    credentials = "/Volumes/Data/Users/victor/Documents/GCP/terraform-sa-cloudrescha.json"
  }
}
#Section that manages access policy for resume bucket
#pdf resume has to be uploaded manually to bucket
data "aws_iam_policy_document" "s3_policy_document" {
  statement {
    sid = "1"

    actions = [
      "s3:GetObject",
    ]
    principals {
      type = "*"
      identifiers = ["*"]
    }

    resources = [
      "arn:aws:s3:::s3-bucket-resume-17jan2022/*",
    ]
  }
}
#Section that manages creation of resume bucket
#policy is read from a data clause in order to make code more legible
resource "aws_s3_bucket" "s3_bucket_resume" {
  bucket = "s3-bucket-resume-17jan2022"
  acl    = "public-read"
  policy = data.aws_iam_policy_document.s3_policy_document.json 

  versioning{
    enabled = true
  
  }

  tags = {
    Name = "Terraform Bucket"
  }
}
