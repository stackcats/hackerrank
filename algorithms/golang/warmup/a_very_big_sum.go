package main

import (
	"fmt"
	"math/big"
)

func main() {
	//Enter your code here. Read input from STDIN. Print output to STDOUT
	var ct, n int64
	fmt.Scanf("%d", &ct)
	sum := big.NewInt(0)
	for ct > 0 {
		ct--
		fmt.Scanf("%d", &n)
		ad := big.NewInt(n)
		sum.Add(sum, ad)
	}
	fmt.Println(sum)
}
