package main

import "time"

func main() {
	for {
		println("print from sensor :)")
		time.Sleep(1 * time.Second)
	}
}
