package main

import "fmt"

func main() {
	var n, k, q int
	fmt.Scanf("%d %d %d", &n, &k, &q)
	arr := make([]int, n)
	for i := range arr {
		fmt.Scanf("%d", &arr[i])
	}

	ans := make([]int, n)
	for i := 0; i < n; i++ {
		ans[(i+k)%n] = arr[i]
	}

	for q > 0 {
		q--
		qu := 0
		fmt.Scanf("%d", &qu)
		fmt.Println(ans[qu])
	}
}
