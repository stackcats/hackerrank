package main

import "fmt"

func main() {
	var s string
	fmt.Scan(&s)
	ans := ""
	for {
		ans = ""
		for i := 0; i < len(s); i++ {
			if i == len(s)-1 || s[i] != s[i+1] {
				ans += string(s[i])
			} else {
				i++
			}
		}
		if ans == s {
			break
		}
		s = ans
	}

	if ans == "" {
		fmt.Println("Empty String")
	} else {
		fmt.Println(ans)
	}
}
