package main

import "fmt"
import "unicode"

func main() {
	var line string
	fmt.Scanln(&line)
	i := 0
	for _, c := range line {
		if unicode.IsUpper(c) {
			i++
		}
	}
	fmt.Println(i + 1)
}
