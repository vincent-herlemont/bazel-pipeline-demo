package main

import "testing"

func TestUrl(t *testing.T) {
	cfg := DispatcherCfg{
		host: "localhost",
		port: "8080",
	}

	url := cfg.Url()
	if url != "http://localhost:8080/dispatcher" {
		t.Errorf("%s", url)
	}
}