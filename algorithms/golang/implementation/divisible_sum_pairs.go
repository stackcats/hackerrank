package main

import "fmt"

func main() {
	var n, k int
	fmt.Scanf("%d %d", &n, &k)
	arr := make([]int, n)
	for i := range arr {
		fmt.Scanf("%d", &arr[i])
	}

	ans := 0
	for i := 0; i < n-1; i++ {
		for j := i + 1; j < n; j++ {
			if (arr[i]+arr[j])%k == 0 {
				ans++
			}
		}
	}
	fmt.Println(ans)
}
