package main

import "fmt"

func main() {
	var n int
	fmt.Scan(&n)
	m := make(map[int]int)
	for n > 0 {
		n--
		t := 0
		fmt.Scan(&t)
		m[t]++
	}
	ans := 0
	for _, v := range m {
		ans += v / 2
	}
	fmt.Println(ans)
}
