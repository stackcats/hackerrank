package main

import "fmt"

func main() {
	var T int
	fmt.Scanf("%d", &T)
	for T > 0 {
		T--
		var N, K int
		fmt.Scanf("%d %d", &N, &K)
		ct := 0
		for N > 0 {
			N--
			var a int
			fmt.Scanf("%d", &a)
			if a <= 0 {
				ct++
			}
		}
		if ct >= K {
			fmt.Println("NO")
		} else {
			fmt.Println("YES")
		}
	}
}
