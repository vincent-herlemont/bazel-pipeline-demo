package main

import (
	"database/sql"
	"fmt"
	"os"
	_ "github.com/go-sql-driver/mysql"
	"github.com/streadway/amqp"
)


func testSQL() {
	conStr :=  fmt.Sprintf("root:%s@tcp(%s:3306)/prepareGo",os.Getenv("MYSQL_ROOT_PASSWORD"),os.Getenv("MARIADB_IP"))
	fmt.Println(conStr)
	db, err := sql.Open("mysql",conStr)
	if err != nil {
		fmt.Println(err)
	}
	defer db.Close()

	var version string
	err = db.QueryRow("SELECT VERSION()").Scan(&version)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("mariadb version", version)
}

func testMq() {
	conStr := fmt.Sprintf("amqp://guest:guest@%s:5672/",os.Getenv("RABBITMQ_IP"))
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

	q, err := ch.QueueDeclare("data1", false, false, false, false,nil)
	if err != nil {
		fmt.Println(err)
	}

	ch.Publish("", q.Name, false, false, amqp.Publishing{
		ContentType: "text/plain",
		Body: []byte("Hello World !"),
	})

	msgs, err := ch.Consume(q.Name, "", true, false, false, false, nil)

	for d := range msgs {
		fmt.Println("consume message : ",string(d.Body))
		break
	}
}
func main()  {
	testSQL()
	testMq()

	fmt.Println("exit")
}
