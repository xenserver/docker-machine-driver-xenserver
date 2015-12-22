[![Build Status](https://travis-ci.org/xenserver/docker-machine-driver-xenserver.svg?branch=master)](https://travis-ci.org/xenserver/docker-machine-driver-xenserver)

# docker-machine-driver-xenserver
This is the XenServer driver plugin for Docker Machine. It allows the
orchestration of machines on Citrix XenServer.

# Installation from source
Following the installation of Golang and Docker Machine, you can install the
docker-machine-xenserver-driver:
```bash
go install github.com/xenserver/docker-machine-driver-xenserver
```

# Usage
The usual Docker Machine commands apply:
```bash
docker-machine create -d xenserver --xenserver-server myip --xenserver-username myusername --xenserver-password mypassword mynewmmachine
docker-machine env mynewmmachine
```


# CLI Options:

 - `--xenserver-vcpu-count`: vCPU number for docker VM.
 - `--xenserver-memory-size`: Size of memory for Docker VM (in MB).
 - `--xenserver-boot2docker-url`: URL for boot2docker ISO image.
 - `--xenserver-server`: **required for create** XenServer hostname/IP for docker VM.
 - `--xenserver-disk-size`: Size of disk for Docker VM (in MB).
 - `--xenserver-username`: **required** XenServer Username.
 - `--xenserver-password`: **required** XenServer Password.
 - `--xenserver-network-label`: Network label where the docker VM will be attached
 - `--xenserver-sr-label`: SR label where the docker VM will be attached.
 - `--xenserver-host-label`: Host label where the docker VM will be run.
 - `--xenserver-upload-timeout`: Timeout uploading VDI.
 - `--xenserver-wait-timeout`: Timeout wating for VM start.

# Environment variables and default values:

| CLI option                        | Environment variable        | Default                      |
|-----------------------------------|-----------------------------|------------------------------|
| `--xenserver-vcpu-count`          | `XENSERVER_VCPU_COUNT`      | `1`                          |
| `--xenserver-memory-size`         | `XENSERVER_MEMORY_SIZE`     | `2048`                       |
| `--xenserver-disk-size`           | `XENSERVER_DISK_SIZE`       | `5120`                       |
| `--xenserver-boot2docker-url`     | `XENSERVER_BOOT2DOCKER_URL` | *boot2docker URL*            |
| `--xenserver-server`              | `XENSERVER_SERVER`          | -                            |
| `--xenserver-host-label`          | `XENSERVER_HOST_LABEL`      | -                            |
| **`--xenserver-username`**        | `XENSERVER_USERNAME`        | -                            |
| **`--xenserver-password`**        | `XENSERVER_PASSWORD`        | -                            |
| `--xenserver-network-label`       | `XENSERVER_NETWORK_LABEL`   | -                            |
| `--xenserver-sr-label`            | `XENSERVER_SR_LABEL`        | -                            |
| `--xenserver-upload-timeout`      | `XENSERVER_UPLOAD_TIMEOUT`  | `300`                        |
| `--xenserver-wait-timeout`        | `XENSERVER_WAIT_TIMEOUT`    | `1800`                       |
