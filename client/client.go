package main

import "time"

func main() {
	for {
		println("print from client :)")
		time.Sleep(1 * time.Second)
	}
}
