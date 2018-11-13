package main

import "fmt"

func main() {
	var n int
	fmt.Scan(&n)

	clouds := make([]int, n)
	for i := range clouds {
		fmt.Scan(&clouds[i])
	}

	steps := 0
	i := 0
	for i < n-1 {
		if i+2 < n && clouds[i+2] == 0 {
			i += 2
		} else {
			i++
		}
		steps++
	}
	fmt.Println(steps)
}
