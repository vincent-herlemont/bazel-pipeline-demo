package main

import (
	"bytes"
	"net/http"
	"net/http/httptest"
	"strconv"
	"testing"
)

func TestHandler(t *testing.T) {
	c := make(chan int,1)
	sData := strconv.Itoa(10)
	reqBody := bytes.NewBuffer([]byte(sData))
	req, err := http.NewRequest("POST", "/health-check", reqBody)
	if err != nil {
		t.Fatal(err)
	}
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(Handler(c))

	handler.ServeHTTP(rr, req)

	expectedCode := 200
	if rr.Code != expectedCode {
		t.Fatalf("Response code '%v' expected '%v'",rr.Code, expectedCode)
	}

	expectedBody := "Retrieve 10"
	respBody := rr.Body.String()
	if respBody != expectedBody {
		t.Fatalf("Response reqBody '%v' expected '%v'", respBody,expectedBody)
	}
}