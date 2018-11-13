package main

import "fmt"

func main() {
	var n, k int
	fmt.Scanf("%d %d", &n, &k)

	clouds := make([]int, n)
	for i := range clouds {
		fmt.Scan(&clouds[i])
	}

	energy := 100
	pos := 0
	isEnd := false
	for !isEnd {
		pos = (pos + k) % n

		if clouds[pos] == 1 {
			energy -= 3
		} else {
			energy -= 1
		}

		if pos == 0 {
			break
		}
	}

	fmt.Println(energy)
}
