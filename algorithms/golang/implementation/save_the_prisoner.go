package main

import "fmt"

func main() {
	var T int
	fmt.Scan(&T)

	for T > 0 {
		T--
		var N, M, S int
		fmt.Scanf("%d %d %d", &N, &M, &S)
		n := (M + S - 1) % N
		if n == 0 {
			n = N
		}
		fmt.Println(n)
	}
}
