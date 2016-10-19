package main

import "fmt"

func main() {
	n := 0
	fmt.Scanf("%d", &n)
	sum := 0
	for n > 0 {
		n--
		var t int
		fmt.Scanf("%d", &t)
		sum += t
	}
	fmt.Println(sum)
}
