package main

import "fmt"

func nch(n int, ch string) (str string) {
	for i := 0; i < n; i++ {
		str += ch
	}
	return
}

func main() {
	//Enter your code here. Read input from STDIN. Print output to STDOUT
	n := 0
	fmt.Scanf("%d", &n)
	for i := 1; i <= n; i++ {
		fmt.Println(nch(n-i, " ") + nch(i, "#"))
	}
}
