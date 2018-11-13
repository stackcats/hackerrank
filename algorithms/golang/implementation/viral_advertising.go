package main

import "fmt"

func main() {
	var n int
	fmt.Scan(&n)

	i := 5
	ans := 0
	for n > 0 {
		n--
		i /= 2
		ans += i
		i *= 3
	}

	fmt.Println(ans)
}
