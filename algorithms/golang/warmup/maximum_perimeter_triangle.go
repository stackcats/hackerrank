package main

import (
	"fmt"
	"sort"
)

func main() {
	var ct int
	fmt.Scanf("%d", &ct)

	arr := make([]int, ct)
	for i := range arr {
		fmt.Scanf("%d", &arr[i])
	}

	sort.Sort(sort.Reverse(sort.IntSlice(arr)))

	for i := 0; i < ct-2; i++ {
		for j := i + 1; j < ct-1; j++ {
			for k := j + 1; k < ct; k++ {
				a, b, c := arr[i], arr[j], arr[k]
				if a+b > c && a-b < c {
					fmt.Println(c, b, a)
					return
				}
			}
		}
	}

	fmt.Println(-1)
}
