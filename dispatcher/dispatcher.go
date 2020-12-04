package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

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

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Golang dispatcher ...")
	fmt.Fprintf(w, "Golang dispatcher")
}

func main() {
	amqpCfg := NewAmqpCfg()
	url := amqpCfg.url()
	fmt.Println("url amqp: ",url)
	http.HandleFunc("/dispatcher", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
	fmt.Println("exit")
}
