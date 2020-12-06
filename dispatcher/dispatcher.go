package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strconv"
	"github.com/streadway/amqp"
)

func Handler(c chan int) func(w http.ResponseWriter, r *http.Request)  {
	return func(w http.ResponseWriter, r *http.Request) {

	b,err := ioutil.ReadAll(r.Body)
	if err != nil {
		log.Fatalln(err)
	}
	s := string(b)
	i,err := strconv.Atoi(s)
	if err != nil {
		log.Fatalln(err)
	}
	fmt.Println("Golang dispatcher ...")
	c <- i

	// Sensor Ack
	fmt.Fprintf(w, "Retrieve %v", s)
}}

func main() {
	amqpCfg := NewAmqpCfg()
	url := amqpCfg.url()

	fmt.Println("url amqp: ",url)
	conn, err := amqp.Dial(amqpCfg.url())
	if err != nil {
		log.Fatalln(err)
	}
	defer conn.Close()

	ch, err := conn.Channel()
	if err != nil {
		log.Fatalln(err)
	}
	defer ch.Close()


	q, err := ch.QueueDeclare("data", false, false, false, false, nil)
	if err != nil {
		log.Fatalln(err)
	}

	c := make(chan int)
	go func() {
		for {
			s := strconv.Itoa(<- c)
			log.Println("publish amqp : ",s)
			ch.Publish("", q.Name, false, false, amqp.Publishing{
				ContentType: "application/binary",
				Body:        []byte(s),
			})
		}
	}()

	http.HandleFunc("/dispatcher", Handler(c))
	log.Fatal(http.ListenAndServe(":8080", nil))
	fmt.Println("exit")
}
