package main

import (
	"fmt"
	"os"
)

type DispatcherCfg struct {
	host     string
	port     string
}

func NewDispatcherCfg() DispatcherCfg {
	return DispatcherCfg{
		os.Getenv("DISPATCHER_HOST"),
		os.Getenv("DISPATCHER_PORT"),
	}
}

func (c DispatcherCfg) Url() string  {
	return fmt.Sprintf(
		"http://%s:%s/dispatcher",
		c.host, c.port,
		);
}
