package main

import "fmt"

func main() {
	var s string
	fmt.Scanln(&s)

	var n int
	fmt.Scanf("%d", &n)

	a := 0
	for _, ch := range s {
		if ch == 'a' {
			a++
		}
	}

	ln := len(s)
	ct := (n / ln) * a
	n = n % ln
	for i := 0; i < n; i++ {
		if s[i] == 'a' {
			ct++
		}
	}
	fmt.Println(ct)
}
