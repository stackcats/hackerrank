package main

import (
	"fmt"
	"sort"
)

func main() {
	var n int
	fmt.Scan(&n)

	sticks := make([]int, n)

	for i := range sticks {
		fmt.Scan(&sticks[i])
	}

	sort.Ints(sticks)

	for {
		sum := 0

		i := 0
		tmp := 0
		for i = 0; i < n; i++ {
			if sticks[i] != 0 {
				tmp = sticks[i]
				break
			}
		}

		for i < n {
			if sticks[i] != 0 {
				sticks[i] -= tmp
				sum++
			}
			i++
		}

		if sum == 0 {
			break
		}

		fmt.Println(sum)
	}
}
