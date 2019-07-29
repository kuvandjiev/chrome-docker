# Chrome-docker
Run a Chrome browser in a Docker container and connect to it using a VNC client

To run it execute:
------------------
`docker-compose up`

To change the current date (for the Chrome process only) change the `FAKETIME` environment variable in `docker-compose.yml`

Connecting to the VNC server
----------------------------

Use `localhost:5900`

The default password is `secret`

The default port and password can be configured in the `docker-compose.yml`
