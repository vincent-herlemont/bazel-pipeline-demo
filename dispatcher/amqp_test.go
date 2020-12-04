package main

import "testing"

func TestUrl(t *testing.T) {
	cfg := AmqpCfg{
		host: "localhost",
		port: "5672",
		user: "guest",
		password: "pwd",
	}

	url := cfg.url()
	if url != "amqp://guest:pwd@localhost:5672/" {
		t.Errorf("%s", url)
	}
}