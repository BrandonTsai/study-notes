---
title: "#7 Array and Slice"
author: Brandon Tsai
---

Go has two type of structure to handle list:

- **Array**: Fixed length list of elements. An array isn't immutable by nature; you can't make it constant.
- **Slice**: flexiable length list that can groe or shrink.

Every element in a Array or Slice must be of same types. The elements are stored sequentially and can be accessed using their index


Array
=====

### Declairing an array:

```go
// An array of 5 integers with default value 0.
a := [5]int{}

// An array with initial value
b := [5]int{2, 4, 6, 8, 10}

// An array of 5 integers and initial 2 elements
// output = [2 4 0 0 0]
b := [5]int{2, 4}

//Letting Go compiler infer the length of the array
a := [...]int{1, 3, 5, 7, 9}

```

### Pass-By-Value

Array is **pass by value**, this means that the value of elements are copied when assigning one array to another. If you make any changes to this copied array, the original one won’t be affected and will remain unchanged. For example:


```go
a := [5]int{2, 4, 6, 8, 10}
b := a

b[0] = 0

fmt.Println(a) // output = [2 , 4, 6, 8, 10]
fmt.Println(b) // output = [0 , 4, 6, 8, 10]
```

### Iterating/Loop:

```go
a := [5]int{2, 4, 6, 8, 10}

// get value with index
for i := 0; i < len(a); i++ {
    fmt.Println(a[i])
}

// you can use 'range' operator to get index and value of elements.
for index, value := range a {
    fmt.Println(index, value)
}

// Go compiler doesn’t allow creating variables that are never used.
// You can fix this by using an _ (underscore) in place of index

for _, value := range a {
    fmt.Println(value)
}
```


### Multidimensional Array:

```go
a := [2][3]int{
    {1, 3, 5},
    {2, 4, 6}, // This trailing comma is mandatory
}

for i := 0; i < len(a); i++ {
    for j := 0; j < len(a[i]); j++ {
        fmt.Println(a[i][j])
    }
}

// you can use 'range' operator to get index and value of elements.
for _, raw := range a {
    for index, value := range raw {
        fmt.Println(index, value)
    }
}
```


Slice
======

The slice type is an abstraction built on top of Go’s array type. But unlike an array type, a slice does not have specified fix length.

### Declair Slices:

```go
// Declair an empty slice which length is 0
a := []int{}

// Declair a slice of lengh 5 and fill with default value via "make" . function
b := make([]int, 5)

// Decalre a slice with initial value
c := []int{2, 4, 6, 8}
```

### Access last element

Go doesn't support negative indexing (`a[-1]`) like Python does .
Use the index `len(a)-1` to access the last element of a slice or array a.

### Append new elements:

```go
// Declair an empty slice
a := []int{}
b := []int{2, 4}

// add elements via append function
a = append(a, 1)
a = append(a, 2, 3)

// apend a slice to another slice.
// the ... lets you pass multiple arguments to a variadic function from a slice
a = append(a, b...)
```

### Remove an element at a give index

there is no function for removing elements from slices
you can use append function to "re-slice".

```go
func remove(a []int, index int) []int {
    a = append(a[:index], a[index+1:]...)
    return a
}
```

### Insert a value at a given index

Same as removing an element. we can to use append function to "re-slice".

```go
func insert(a []int, index int, value int) []int {
    if len(a) == index { // nil or empty slice or after last element
        return append(a, value)
    }
    a = append(a[:index+1], a[index:]...) // index < len(a)
    a[index] = value
    return a
}
```


### Pass-By-Reference

Unlike Array, slice is pass by reference, this means when any changes being made to this copied array, the original one is affected as well. For example:

```go
// Create a slice refer to another slice
a := []int{1, 2, 3, 4}
b := a
b[0] = 2
fmt.Println(a) //output = [2 2 3 4]
fmt.Println(b) //output = [2 2 3 4]

// Create a slice refer to part of another slice
c := a[1:4]
c[0] = 5
fmt.Println(a) //output = [2 5 3 4]
fmt.Println(b) //output = [2 5 3 4]
fmt.Println(c) //output = [5 3 4]
```

### Copy

If you want to copy the value from one slice to another slice, you should use `copy(dst, src)` function. It copies elements from the source to the destination and returns the number of elements that are copied. The number of elements copied will be the minimum of len(src) and len(dst)

```go
a := []int{1, 2, 3, 4}
b := make([]int, len(a))

copy(b, a)
b[0] = 5

fmt.Println(a, reflect.TypeOf(a).Kind()) // output = [1 2 3 4]
fmt.Println(b, reflect.TypeOf(b).Kind()) // output = [5 2 3 4]

c := []int{}
copy(c, a)                               // nothing copied to c because len(c)= 0
fmt.Println(a, reflect.TypeOf(a).Kind()) // output = [1 2 3 4]
fmt.Println(c, reflect.TypeOf(c).Kind()) // output = []
```

Slice can be used to refer to an array as well.

```go
a := [5]int{0, 2, 4, 6, 8}

// Create an array copy from another array
a1 := a // pass by value
a1[0] = 1
fmt.Println(a, len(a), reflect.TypeOf(a).Kind())    //output = [0 2 4 6 8]
fmt.Println(a1, len(a1), reflect.TypeOf(a1).Kind()) //output = [1 2 4 6 8]

// Create an array copy from part of another array
var a2 [4]int
copy(a2[:], a[0:4])
a2[0] = 2
fmt.Println(a, len(a), reflect.TypeOf(a).Kind())    //output = [0 2 4 6 8]
fmt.Println(a2, len(a2), reflect.TypeOf(a2).Kind()) //output = [2 2 4 6]

// Create a slice refer to an array
s1 := a[:] // pass by reference
s1[0] = 3
fmt.Println(a, len(a), reflect.TypeOf(a).Kind())    //output = [3 2 4 6 8]
fmt.Println(a1, len(a1), reflect.TypeOf(a1).Kind()) //output = [1 2 4 6 8]
fmt.Println(a2, len(a2), reflect.TypeOf(a2).Kind()) //output = [2 2 4 6]
fmt.Println(s1, len(s1), reflect.TypeOf(s1).Kind()) //output = [3 2 4 6 8]

// Create a slice refer to part of an array
s2 := a[0:4]
s2[0] = 4
fmt.Println(a, len(a), reflect.TypeOf(a).Kind())    //output = [4 2 4 6 8]
fmt.Println(a1, len(a1), reflect.TypeOf(a1).Kind()) //output = [1 2 4 6 8]
fmt.Println(a2, len(a2), reflect.TypeOf(a2).Kind()) //output = [2 2 4 6]
fmt.Println(s1, len(s1), reflect.TypeOf(s1).Kind()) //output = [4 2 4 6 8]
fmt.Println(s2, len(s2), reflect.TypeOf(s2).Kind()) //output = [4 2 4 6]
```


### Iterating/Loop:

```go
s := []int{2, 4, 6, 8, 10}

// get value with index
for i := 0; i < len(s); i++ {
    fmt.Println(s[i])
}

// you can use 'range' operator as well.
for _, value := range s {
    fmt.Println(value)
}
```


### Multidimensional Slices:

```go
s := [][]int{
    {2, 4, 6, 8, 10},
    {1, 3, 5},
}

for i := 0; i < len(s); i++ {
    for _, value := range s[i] {
        fmt.Println(value)
    }
}
```

Sort Slices/Arrays
=================

The `sort` package in Go provides several convenience methods for sorting a slice of primitive types. The following example demonstrates how to sort a slice of strings, integers, and floats in Go:

```go
package main

import (
	"fmt"
	"sort"
)

func main() {
	// Sorting a slice of Strings
	strs := []string{"quick", "brown", "fox", "jumps"}
	sort.Strings(strs)
	fmt.Println("Sorted strings: ", strs)

	// Sorting a slice of Integers
	ints := []int{56, 19, 78, 67, 14, 25}
	sort.Ints(ints)
	fmt.Println("Sorted integers: ", ints)

	// Sorting a slice of Floats
	floats := []float64{176.8, 19.5, 20.8, 57.4}
	sort.Float64s(floats)
	fmt.Println("Sorted floats: ", floats)
}
```

### Sorting a Slice in Reverse order

`sort.Ints` is a convenient function to sort a couple of ints. Generally you need to implement the `sort.Interface` interface if you want to sort something and `sort.Reverse` just returns a different implementation of that interface that redefines the "Less" method.

Luckily the sort package contains a predefined type called `IntSlice` that implements `sort.Interface`


```go
package main

import (
	"fmt"
	"sort"
)

func main() {
	// Sorting a slice of Strings
	strs := []string{"quick", "brown", "fox", "jumps"}
	sort.Sort(sort.Reverse(sort.StringSlice(strs)))
	fmt.Println("Sorted strings in reverse order: ", strs)

	// Sorting a slice of Integers
	ints := []int{56, 19, 78, 67, 14, 25}
	sort.Sort(sort.Reverse(sort.IntSlice(ints)))
	fmt.Println("Sorted integers in reverse order: ", ints)

	// Sorting a slice of Floats
	floats := []float64{176.8, 19.5, 20.8, 57.4}
	sort.Sort(sort.Reverse(sort.Float64Slice(floats)))
	fmt.Println("Sorted floats in reverse order: ", floats)
}
```

### Sorting a slice using a comparator function in Go

Slice() and SliceStable() that accept a comparator function as an argument:

| Function      | Feaure                                                    |
| ------------- | --------------------------------------------------------- |
| Slice()       | equal elements may be reversed from their original order. |
| SliceStable() | keeping equal elements in their original order.           |

```go
package main

import (
	"fmt"
	"sort"
)

func main() {
	// Sorting a slice of strings by length
	strs := []string{"United States", "India", "France", "United Kingdom", "Spain"}
	sort.Slice(strs, func(i, j int) bool {
		return len(strs[i]) < len(strs[j])
	})
	fmt.Println("Sorted strings by length: ", strs)

	// Stable sort
	sort.SliceStable(strs, func(i, j int) bool {
		return len(strs[i]) < len(strs[j])
	})
	fmt.Println("[Stable] Sorted strings by length: ", strs)

	// Sorting a slice of strings in the reverse order of length
	sort.SliceStable(strs, func(i, j int) bool {
		return len(strs[j]) < len(strs[i])
	})
	fmt.Println("[Stable] Sorted strings by reverse order of length: ", strs)
}


```