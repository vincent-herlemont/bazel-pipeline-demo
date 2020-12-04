package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"math/rand"
	"net/http"
	"time"
)

func CallNumber() int {
	rand.Seed(time.Now().UnixNano())
	min := 30
	max := 50
	return rand.Intn(max - min + 1) + min
}

func main() {
	callNumber := CallNumber();
	cfg := NewDispatcherCfg();
	url := cfg.Url()
	log.Println("url : ", url);
	fmt.Println("call number : ",callNumber);
	for i := 0; i <= callNumber; i++ {
		resp, err := http.Get(url)
		if err != nil {
			log.Fatalln(err)
		}

		defer resp.Body.Close();

		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			log.Fatalln(err)
		}
		log.Println(string(body))
	}

}