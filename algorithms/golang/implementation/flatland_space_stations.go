package main

import "fmt"

func main() {
	var n, m int
	fmt.Scanf("%d %d", &n, &m)

	arr := make([]int, n)

	for m > 0 {
		m--
		var t int
		fmt.Scan(&t)
		arr[t] = 1
	}

	ans := 0
	for i := 0; i < n; i++ {
		t := n + 1
		if arr[i] == 1 {
			t = 0
		} else {
			offset := 0
			flag := false
			for j := i - 1; j >= 0; j-- {
				if arr[j] == 1 {
					offset = i - j
					flag = true
					break
				}
			}

			if flag && t > offset {
				t = offset
			}

			flag = false
			for j := i + 1; j < n; j++ {
				if arr[j] == 1 {
					offset = j - i
					flag = true
					break
				}
			}

			if flag && t > offset {
				t = offset
			}
		}

		if ans < t {
			ans = t
		}
	}

	fmt.Println(ans)
}
