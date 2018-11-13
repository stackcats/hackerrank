package main

import "fmt"

func main() {
	var x1, v1, x2, v2 int
	fmt.Scanf("%d %d %d %d", &x1, &v1, &x2, &v2)
	dx := x2 - x1
	dv := v1 - v2
	if dx*dv >= 0 && dv != 0 && dx%dv == 0 {
		fmt.Println("YES")
	} else {
		fmt.Println("NO")
	}

}
