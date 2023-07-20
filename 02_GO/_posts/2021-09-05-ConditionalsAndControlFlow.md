---
title: "#6 Conditionals and Control Flow"
author: Brandon Tsai
---


If statement
------------

The `if` statement allows you to execute a block of code conditionally based on a boolean expression. Here's an example:

```go
if (condition1) {

} else if (condition2) {

} else {

}
```

Note that, the parentheses () can be omitted from an if statement. for example:

```go
package main

import "fmt"

func main() {
	var x = 7
	if num%3 == 0 && num%5 == 0 {
		fmt.Printf("%d is divisible by both 3 and 5\n", x)
	} else if x < 0 {
		fmt.Printf("%d is negative\n", x)
	} else {
		fmt.Printf("%d is positive\n", x)
	}
}

```


Switch statement
----------------

Switch evaluates all the cases from top to bottom until a case succeeds. Once a case succeeds, it runs the block of code specified in that case and then stops the evaluation.

```go
package main

import "fmt"

func main() {
	code := "AT"
	switch code {
	case "AU":
		fmt.Println("Australia")
	case "TW", "ROC":
		fmt.Println("Taiwan")
	case "AT":
		{
			fmt.Println("Austria")
			fmt.Println("There is no kangaroos in Austria")
		}
	default:
		fmt.Println("Other Country")
	}
}

```

For Loops:
--------

The `for` loop is the primary loop construct in Go and allows you to repeatedly execute a block of code.
You can use `continue` statement to skip running the loop body midway and continue to the next iteration of the loop.
The `break` statement can be used to stop a loop before its normal termination.

```go
package main

import "fmt"

func main() {
	for i := 100; i < 150; i++ {
		if i%2 == 0 {
			continue
		} else if i%13 == 0 {
			fmt.Printf("%d is a the first odd multiple of 13\n", i)
			break
		}
		fmt.Printf("%d is an odd number\n", i)
	}
}
```


**Notice:** Go does not have `while` loop. you can replace a while loop with a for loop by omitting the initialization and post statements, and only providing the condition. This allows you to achieve the same functionality as a while loop. Here's an example to illustrate the conversion:

```go
package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	// While loop equivalent using for loop
	i := 0
	for i < 5 {
		fmt.Println(i)
		i = getRandomNumber()
	}
}

func getRandomNumber() int {
	rand.Seed(time.Now().UnixNano()) // Initialize random number generator with a unique seed
	return rand.Intn(10)             // Generate a random number between 0 and 9
}

```