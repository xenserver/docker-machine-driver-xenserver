package main

import (
	"github.com/jonludlam/docker-machine-xenserver"
	"github.com/docker/machine/libmachine/drivers/plugin"
)

func main() {
	plugin.RegisterDriver(xenserver.NewDriver())
}
