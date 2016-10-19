package main

import "fmt"

func main() {
	var n, k int
	fmt.Scanf("%d %d", &n, &k)

	items := make([]int, n)
	sum := 0

	for i := range items {
		fmt.Scan(&items[i])
		sum += items[i]
	}

	var b float64
	fmt.Scan(&b)

	actal := float64(sum-items[k]) / 2
	if b == actal {
		fmt.Println("Bon Appetit")
	} else {
		fmt.Println(b - actal)
	}
}
