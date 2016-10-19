package main

import (
	"fmt"
	"sort"
	"strings"
)

func main() {
	var t int
	fmt.Scan(&t)
	for t > 0 {
		t--
		var word string
		fmt.Scan(&word)
		fmt.Println(bigger(word))
	}
}

func bigger(w string) string {
	word := strings.Split(w, "")
	for i := len(word) - 2; i >= 0; i-- {
		if word[i] < word[i+1] {
			ans := make([]string, len(word))
			rest := make([]string, len(word))
			copy(ans, word[:i])
			copy(rest, word[i+1:])
			ndx := min(rest, word[i])
			ans[i], rest[ndx] = rest[ndx], word[i]
			sort.Strings(rest)
			ans = append(ans, rest...)
			return strings.Join(ans, "")
		}
	}
	return "no answer"
}

func min(s []string, w string) int {
	ans := s[0]
	ndx := 0
	for i := 0; i < len(s); i++ {
		if s[i] > w && s[i] < ans {
			ans = s[i]
			ndx = i
		}
	}
	return ndx
}
