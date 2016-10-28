// http://cs.stackexchange.com/questions/57873/maximum-subset-pairwise-not-divisible-by-k
package main

import "fmt"

func main() {
	var n, k int
	fmt.Scanf("%d %d", &n, &k)
	set := make([]int, k)

	for i := 0; i < n; i++ {
		var num int
		fmt.Scan(&num)
		set[num%k]++
	}

	size := 0
	for i := 0; i < k/2+1; i++ {
		if i == 0 || i*2 == k {
			if set[i] > 0 {
				size += 1
			}
		} else {
			size += max(set[i], set[k-i])
		}
	}

	fmt.Println(size)
}

func max(a, b int) int {
	if a < b {
		return b
	}
	return a
}
