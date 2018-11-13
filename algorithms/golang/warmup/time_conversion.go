package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	var line string
	fmt.Scanln(&line)
	time := line[:8]
	apm := line[8:]
	s := strings.Split(time, ":")
	h, _ := strconv.Atoi(s[0])
	if apm == "AM" {
		if h == 12 {
			h = 0
		}
	} else {
		if h < 12 {
			h += 12
		}
		if h == 24 {
			h = 0
		}
	}
	fmt.Printf("%02d:%s:%s\n", h, s[1], s[2])
}
