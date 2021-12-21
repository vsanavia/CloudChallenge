This is a project to automate a webserver deployment for the cloud resume challenge. The scope is:

- Use a lighweight webserver container (thttpd and alpine linux) for displaying the resume in html format.
- Deploy the container on GCP Cloud Run.
- Enable https access using GCP Cloud CDN.
- Create entry on Route53 for resume.sanavia.xyz.

All of these tasks are executed uisng terraform, to highlight multicloud capabilities. 
