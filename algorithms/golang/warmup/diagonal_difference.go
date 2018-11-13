package main

import (
	"fmt"
	"math"
)

func main() {
	var n int
	fmt.Scanf("%d", &n)
	mat := make([][]int, n)
	for i := 0; i < n; i++ {
		mat[i] = make([]int, n)
		for j := 0; j < n; j++ {
			fmt.Scanf("%d", &mat[i][j])
		}
	}

	var primary, secondary int
	for i := 0; i < n; i++ {
		primary += mat[i][i]
		secondary += mat[n-1-i][i]
	}

	fmt.Println(math.Abs(float64(primary - secondary)))
}
