![GitHub](https://img.shields.io/github/license/vsanavia/CloudChallenge)
![GitHub last commit](https://img.shields.io/github/last-commit/vsanavia/CloudChallenge)
![GitHub followers](https://img.shields.io/github/followers/vsanavia?style=social)
[![Medium vsanavia](https://img.shields.io/badge/medium.com%2F@vsanavia-subscribe-blueviolet)](https://medium.com/@vsanavia)
![Twitter Follow](https://img.shields.io/twitter/follow/vsanavia?style=social)
# Cloud Resume Challenge Implementation

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
