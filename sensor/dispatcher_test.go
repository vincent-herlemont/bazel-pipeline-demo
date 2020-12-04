package main

import "testing"

func TestUrl(t *testing.T) {
	cfg := DispatcherCfg{
		host: "localhost",
		port: "8080",
	}

	url := cfg.url()
	if url != "http://localhost:8080/" {
		t.Errorf("%s", url)
	}
}