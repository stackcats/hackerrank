package main

import "fmt"

func main() {
	var n int
	fmt.Scan(&n)
	arr := make([]int, n)
	for i := range arr {
		fmt.Scan(&arr[i])
	}
	ans := n + 1
	for i := 0; i < n; i++ {
		for j := i + 1; j < n; j++ {
			if arr[j] == arr[i] {
				if ans > j-i {
					ans = j - i
				}
			}
		}
	}
	if ans == n+1 {
		ans = -1
	}
	fmt.Println(ans)
}
