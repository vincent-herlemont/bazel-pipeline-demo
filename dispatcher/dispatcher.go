package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"strconv"

	"github.com/streadway/amqp"
)

func Sum(a int, b int) int {
	return a + b
}

func testMq() {
	conStr := fmt.Sprintf("amqp://guest:guest@%s:5672/", os.Getenv("AMQP_HOST"))
	conn, err := amqp.Dial(conStr)
	if err != nil {
		fmt.Println(err)
	}
	defer conn.Close()

	ch, err := conn.Channel()
	if err != nil {
		fmt.Println(err)
	}
	defer ch.Close()

	q, err := ch.QueueDeclare("data1", false, false, false, false, nil)
	if err != nil {
		fmt.Println(err)
	}

	ch.Publish("", q.Name, false, false, amqp.Publishing{
		ContentType: "text/plain",
		Body:        []byte("Hello World !"),
	})

	msgs, err := ch.Consume(q.Name, "", true, false, false, false, nil)

	for d := range msgs {
		fmt.Println("consume message : ", string(d.Body))
		break
	}
}

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
		fmt.Println(err)
	}
	defer conn.Close()

	ch, err := conn.Channel()
	if err != nil {
		fmt.Println(err)
	}
	defer ch.Close()


	q, err := ch.QueueDeclare("data", false, false, false, false, nil)
	if err != nil {
		fmt.Println(err)
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
