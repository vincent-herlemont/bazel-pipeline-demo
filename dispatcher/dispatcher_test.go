package main

import (
	"bytes"
	"net/http"
	"net/http/httptest"
	"strconv"
	"testing"
)

func TestSum(t *testing.T) {
	total := Sum(5, 5)
	if total != 10 {
		t.Errorf("Sum was incorrect, got: %d, want: %d.", total, 10)
	}
}


func TestHandler(t *testing.T) {
	sData := strconv.Itoa(10)
	reqBody := bytes.NewBuffer([]byte(sData))
	req, err := http.NewRequest("POST", "/health-check", reqBody)
	if err != nil {
		t.Fatal(err)
	}
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(Handler)

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