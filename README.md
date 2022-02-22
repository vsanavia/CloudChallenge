<p align="center">
  <img
    width="600"
    src="https://raw.githubusercontent.com/vsanavia/CloudChallenge/main/media/diagram-tf.png"
    />
</p>
This is a project to automate a webserver deployment for the cloud resume challenge. The scope is:

- Use a lighweight webserver container (thttpd and alpine linux) for displaying the resume in html format.
- Deploy the container on GCP Cloud Run.
- Enable https access using GCP Cloud CDN.
- Create entry on Route53 for resume.sanavia.xyz.

All of these tasks are executed using terraform, to highlight multicloud capabilities ~~(TODO)~~. 
