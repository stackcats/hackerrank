package main

import "fmt"

func main() {
	var q, n int
	fmt.Scan(&q)
	fmt.Scan(&n)

	arr := make([]int, n)
	for i := range arr {
		fmt.Scan(&arr[i])
	}

	for i, v := range arr {
		if v == q {
			fmt.Println(i)
			return
		}
	}
}
