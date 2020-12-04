package main

import (
	"fmt"
	"os"
)

type AmqpCfg struct {
	host     string
	port     string
	user     string
	password string
}

func NewAmqpCfg() AmqpCfg {
	return AmqpCfg{
		os.Getenv("AMQP_HOST"),
		os.Getenv("AMQP_PORT"),
		os.Getenv("AMQP_USER"),
		os.Getenv("AMQP_PASSWORD"),
	}
}

func (c AmqpCfg) url() string  {
	return fmt.Sprintf(
		"amqp://%s:%s@%s:%s/",
		c.user, c.password,
		c.host, c.port,
		);
}
