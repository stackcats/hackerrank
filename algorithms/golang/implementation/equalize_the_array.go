package main

import "fmt"

func main() {
	var n int
	fmt.Scan(&n)
	arr := make([]int, n)
	for i := range arr {
		fmt.Scan(&arr[i])
	}

	m := make(map[int]int)
	max := -1
	for _, v := range arr {
		m[v]++
		if max < m[v] {
			max = m[v]
		}
	}

	fmt.Println(n - max)
}
