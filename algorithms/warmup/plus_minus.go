package main

import "fmt"

func main() {
	var n int
	fmt.Scanf("%d", &n)
	var positive, negative, zeroes int
	for i := 0; i < n; i++ {
		var x int
		fmt.Scanf("%d", &x)
		switch {
		case x > 0:
			positive++
		case x < 0:
			negative++
		case x == 0:
			zeroes++
		}
	}
	fmt.Printf("%.6f\n", float64(positive)/float64(n))
	fmt.Printf("%.6f\n", float64(negative)/float64(n))
	fmt.Printf("%.6f\n", float64(zeroes)/float64(n))
}
