<p align="center">
  <img
    width="600"
    src="https://raw.githubusercontent.com/vsanavia/CloudChallenge/main/media/diagram-tf.png"
    />
</p>

# **Cloud Resume Challenge entry implemented in terraform**

In this directory, you'll find the following files:

1. **aws_components.tf**: Instructions to provision the components of the architecture that are run on AWS, namely, Route53 DNS A entry and S3 bucket with the proper access control policy.

2. **gcp_components.tf**: Instructions to provision the components of the architecture that are run on GCP, namely, Network Load Balancer, SSL certificate and Cloud Run backend, where the container with the http server is run on demand.

The files make extensive use of variables, to permit the customization of the service on your own AWS/GCP account. The **variables.tf** file, that was used to run the service is **not** provided as it has my own credentials. Nonetheless, it should be easy to customize the service if you provide a **variables.tf** file with parameters such as Route53 DNS Zone ID, AWS region, GCP Project ID, etc. I've found the variable docs https://www.terraform.io/language/values/variables very useful!

I've made the decision to store the state https://www.terraform.io/language/settings/backends on a remote "backend" hosted on GCP. This should be more similar to terraform implementations in production as this would prevent multiple terraform actions that are run simultaneously to corrupt the state of the infrastructure. Furthermore, storing the state on a GCP bucket permits terraform to use the state locking feature (Not all available backends support this).

Terraform leverages Service Accounts (SA) on AWS and GCP, as a best practice to limit its scope and to truly exploit the granularity of the permissions on both of these providers. I found GCP to be more friendly (and cost effective, as Cloud Trail on AWS is **not** free!) to troubleshoot access permissions. It's very tempting to assign broad permissions to the SA, but its very useful to know the security footprint of terraform in production environments.

There are several improvements that I'll work on as time permits:

1. The service is not 100% automated, as resources such as the pdf files for the bucket and the container image have been uploaded "manually" to the AWS S3 bucket and the GCP Artifact Registry respectively.

2. The provisioning for the GCP Load Balacer submits a new SSL certificate request from scratch everytime you create the service. GCP has an SSL certificate provisioning process that takes about 40 minutes to enable traffic if everything is configured properly. This is something unacceptable for a production environment so I'll address it on a future update.

