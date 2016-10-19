package main

import (
	"fmt"
	"sort"
)

func main() {
	var N, C int
	fmt.Scan(&N)
	fmt.Scan(&C)

	coins := make([]int, C)
	for i := range coins {
		fmt.Scan(&coins[i])
	}

	sort.Ints(coins)

	arr := [300]int{1}

	for i := 0; i < C; i++ {
		for j := coins[i]; j <= N; j++ {
			arr[j] += arr[j-coins[i]]
		}
	}
	fmt.Println(arr[N])
}
