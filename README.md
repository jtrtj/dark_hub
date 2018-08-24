# README

This repository represents a spike where I explored consuming an API into a rails app.
The goal was to attemp recreating a GitHub user profile.
I used:

* [GitHub Oauth] (https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/) to log users in and receive a token granting my app access to the user's profile info, repositories, commits and gists through the [GitHub API] (https://developer.github.com/v3/).
* [Faraday] (https://github.com/lostisland/faraday) to make API requests
* [VCR] (https://github.com/vcr/vcr) to record API requests made by tests
* [Postman] (https://www.getpostman.com/) to send API requests and investigate the resulting JSON.
