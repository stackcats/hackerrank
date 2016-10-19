package main

import "fmt"

func main() {
	var t int
	fmt.Scan(&t)

	init := 3
	for t > init {
		t -= init
		init *= 2
	}

	fmt.Println(init - t + 1)
}
