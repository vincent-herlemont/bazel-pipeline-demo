package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"

	_ "github.com/lib/pq"
	"github.com/streadway/amqp"
)

func Sum(a int, b int) int {
	return a + b
}

func testSQL() {
	conStr := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
		os.Getenv("PG_HOST"),
		os.Getenv("PG_PORT"),
		os.Getenv("PG_USER"),
		os.Getenv("PG_PASSWORD"),
		os.Getenv("PG_DBNAME"),
	)
	fmt.Println(conStr)
	db, err := sql.Open("postgres", conStr)
	if err != nil {
		fmt.Println(err)
	}
	defer db.Close()

	var version string
	err = db.QueryRow("SELECT VERSION()").Scan(&version)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("db version", version)
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
	fmt.Fprintf(w, "Golang dispatcher %s!\n", r.URL.Path[1:])
}

func main() {
	testSQL()
	testMq()
	fmt.Println("dispatcher up ....")
	http.HandleFunc("/test", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
	fmt.Println("exit")
}
