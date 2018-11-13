package main

import "fmt"

func main() {
	//Enter your code here. Read input from STDIN. Print output to STDOUT
	var a [3]int
	var b [3]int
	fmt.Scanf("%d %d %d", &a[0], &a[1], &a[2])
	fmt.Scanf("%d %d %d", &b[0], &b[1], &b[2])
	var s1, s2 int
	for i := 0; i < len(a); i++ {
		if a[i] > b[i] {
			s1++
		} else if a[i] < b[i] {
			s2++
		}
	}
	fmt.Println(s1, s2)
}
