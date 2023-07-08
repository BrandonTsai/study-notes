---
title: "#5 Variables"
author: Brandon Tsai
---

Variables are used to store and manipulate data. Understanding variables and their associated data types is crucial for working with data and performing operations in any programming language. We will explore how to declare and initialize variables, discuss the basic data types available in Go, and cover some important considerations when working with variables.

Declaring and Initializing Variables
---------------------

Before using a variable, we need to declare it, specifying its name and type. Here's the general syntax for declaring a variable in Go:

```go
var variableName dataType
```

To initialize a variable with a value, we can combine the declaration and initialization:

```go
var variableName dataType = value
```

This syntax infers the variable's type based on the provided value.

Following is the example with a variable declaration and initialization.

```go
package main

import "fmt"

func main() {
    var message string = "Hello world!"
    fmt.Println(message)
}
```

Go is Static Tye language. It cares the type of value that is going to be assigned to a variable. You can not assign a different type of value to a variable. for example:

```go
var message string = "Hello world"
message = 100 // ERROR! You can not assign a integer value to a string variable
```


Name Convention 
---------------------------

As mentioned earlier, Go use `mixedCaps` (simply camelCase) rather than underscores to write multi-word names.
A variable start with a lowercase letter is unexported (or internal) variable which is not accessible outside the package.
On the other hand, A variable start with a uppercase letter is exported and can be accessed from other packages.

| Convention | Usage                                                        |
| ---------- | ------------------------------------------------------------ |
| MixedCaps  | If an identifier needs to be visible outside the package     |
| mixedCaps  | If you don't have the intention to use it in another package |



Basic Data Types in Go
-----------------------

Go has several built-in data types that serve different purposes. Here are some of the basic data types:


Numeric Types:
- int: Signed integers, the size of which depends on the underlying platform.
- int8, int16, int32, int64: Signed integers with specific bit sizes.
- uint: Unsigned integers, the size of which depends on the underlying platform.
- uint8, uint16, uint32, uint64: Unsigned integers with specific bit sizes.
- float32, float64: Floating-point numbers (decimal numbers).
- complex64, complex128: Complex numbers with real and imaginary parts.

Boolean Type:
- bool: Represents boolean values (true or false).

String Type:
- string: Represents a sequence of characters.

Derived Types:
- arrays: Fixed-size sequences of elements with the same type.
- slices: Dynamic-size sequences built on top of arrays.
- structs: User-defined types that group together different fields.
- maps: Key-value pairs, also known as associative arrays or dictionaries.
- pointers: Variables that store memory addresses.


### No Char data type

Golang doesn’t have a `char` data type. It uses `byte` and `rune` to represent character values. The *byte* data type represents **ASCII** characters and the *rune* data type represents a more broader set of **Unicode** characters that are encoded in UTF-8 format.

Characters are expressed in Golang by enclosing them in single quotes like this: 'A'.

The default type for character values is rune. That means, if you don’t declare a type explicitly when declaring a variable with a character value, then Go will infer the type as rune -

```go
var firstLetter = 'A' // Type inferred as `rune`
var lastLetter byte = 'Z' //Create a byte variable by explicitly specifying the type 
```

Default Value
----------

Any variable declared without an initial value will have a default value assigned.

| Type                           | Default Value |
| ------------------------------ | ------------- |
| bool                           | false         |
| string                         | ""            |
| int, int8, int16, int32, int64 | 0             |
| float32, float64               | 0.0           |


```go
package main

import "fmt"

func main() {
	var message string
	fmt.Println(message)

	message = "Hello world!"
	fmt.Println(message)
}
```

Type Inference
--------------

Although Go is a Statically typed language, you do not need to specify the type of every variable you declare. Go provides a shorthand syntax known as the "short variable declaration":

```go
variableName := value
```

Go compiler will analysis the type of value and define the varible type as same as the value.
For example:

```go
package main

import "fmt"

func main() {
	// var hello string = "Hello world"
	message := "Hello World"
	fmt.Println(message)

	message = "Hello Taiwan!"
	fmt.Println(message)
}

```

Check The Type of A Variable
----------------------------

In GO, you can check the type of a variable using the `reflect` package.

Here's an example code snippet that demonstrates how to check the type of a variable:

```go

package main

import (
    "fmt"
    "reflect"
)

func main() {
    var x int = 10
    var y string = "Hello, World!"

    fmt.Println(reflect.TypeOf(x)) // Output: int
    fmt.Println(reflect.TypeOf(y)) // Output: string
}
```

In this code, we first import the fmt and reflect packages. We then declare two variables x and y of different types.

To check the type of a variable, we use the reflect.TypeOf() function from the reflect package. We pass the variable to this function, which returns the type of the variable. We then use the fmt.Println() function to print the type of each variable to the console.

Note that the reflect package is relatively slow and should not be used for performance-critical code.



Type Conversion
---------------

**Numeric types conversion**

Golang doesn’t allow you to mix numeric types in an expression. For example:

```go
a := 2021
b := 3.1415

result := a + b // Error (invalid operation: mismatched types int and float64)

result := float64(a) + b // Works

```

You can convert float64 to int as well

```go
a := 4.0
b := 3

result := int(a) + b

```

**String and other basic data types conversion:**

Use the [strconv](https://pkg.go.dev/strconv) package to conversions to/from string representations of basic data types

```go
package main

import (
	"fmt"
	"reflect"
	"strconv"
)

func main() {
	// Convert String to Bool, Float, Integer
	b, err := strconv.ParseBool("true")
	fmt.Println(b, err, reflect.TypeOf(b))

	f, err := strconv.ParseFloat("3.1415", 64)
	fmt.Println(f, err, reflect.TypeOf(f))

	i, err := strconv.ParseInt("-42", 10, 64)
	fmt.Println(i, err, reflect.TypeOf(i))

	// Convert Bool, Float, Integer to String.
	sb := strconv.FormatBool(b)
	sf := strconv.FormatFloat(f, 'G', -1, 64)
	si := strconv.FormatInt(i, 10)

	fmt.Printf(sb + "\t" + sf + "\t" + si + "\n")
}
```


Constants Variables
-------------

Constants are variables whose values cannot be changed once assigned and are declared using the `const` keyword.
They provide a way to define fixed values that remain constant throughout the execution of a program.
Here's an example of declaring and using constants in Go:

```go
const pi := 3.14159
const capital string = "Taipei"
const (
	population2020 int32 = 23568378 // Valid
	population2021 int32 = population2020 + 34159 // Valid
)

func main() {
	fmt.Println("Pi value:", pi)
	fmt.Println("Hello ", capital)
	fmt.Println("2020 Population: ", population2020)
	fmt.Println("2021 Population: ", population2021)

	pi = 3.14 // ERROR! You can not change the value of a constant variables
}
```

Using constants can enhance the readability and maintainability of your code, as they provide meaningful names to fixed values and allow for consistent use throughout the program. It's good practice to use constants when you have values that should not be modified and need to be referenced multiple times throughout your codebase.


Work With System Environment Variables
----------------------

https://www.callicoder.com/go-read-write-environment-variables/

Sometime, we need to access the system environment variable at runtine so that we can make the same application work in different environments like Dev, UAT, and Production.

The `os` packages provide functions to interact with the operating system, including reading and modifying environment variables. 

| Funtion            | Usage                                                                                                                                                   |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Setenv(key, value) | Set an environment variable.                                                                                                                            |
| Unsetenv(key)      | Unset an environment variable.                                                                                                                          |
| Getenv(key)        | Get an environment variable.                                                                                                                            |
| LookupEnv(key)     | Get the value of an environment variable and a boolean indicating whether the environment variable is present or not. It returns a string and a boolean |
| Environ()          | Obtain a list of all environment variables                                                                                                              |

for example:

```go
package main

import (
	"fmt"
	"os"
)

func main() {
	// Set Environment Variables
	os.Setenv("DB_HOST", "localhost")
	os.Setenv("DB_USER", "admin")
	os.Setenv("DB_PASS", "test123")

	// Get Environment Variables
	user := os.Getenv("DB_USER")
	pass := os.Getenv("DB_PASS")
	fmt.Printf("Host: %s, Port: %s\n", user, pass)

	// Unset Environment Variable
	os.Unsetenv("DB_HOST")
	fmt.Printf("Try to get host: %s\n", os.Getenv("DB_HOST"))


	// Get the value of an environment variable and a boolean indicating whether the environment variable is set or not.
	database, ok := os.LookupEnv("DB_NAME")
	if !ok {
		fmt.Println("DB_NAME is not present")
	} else {
		fmt.Printf("Database Name: %s\n", database)
	}
}

```




