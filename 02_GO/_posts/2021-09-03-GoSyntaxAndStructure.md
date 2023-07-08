---
title: "#3 Go Syntax and Structure"
author: Brandon Tsai
---

In this chapter, we will explore the fundamental aspects of Go syntax and structure. Understanding the syntax rules and conventions is crucial for writing clean and readable Go code. We will also delve into packages, imports, naming conventions, and provide an introduction to the basic toolchain that comes with Go.

Basic Syntax Rules
-------------------

Go follows a concise and readable syntax, making it easy to write and understand code. 
Let's examine the basic syntax rules and conventions using the following example:

```go
package main

import (
	"fmt"

	"golang.org/x/example/stringutil"
)

func main() {
	fmt.Println(stringutil.Reverse("!selpmaxe oG ,olleH"))
}
```

hello.go include three parts: `packages`, `import` and `func main()`.

### packages

The first statement of every go source file must be a package declaration.
Package is a way for collecting related Go code together.
A packages can have many files inside of it. For example:

main.go

```go
// main.go
package main
import (
	"fmt"
)

func main() {
	fmt.Println("Hello MAIN!")
}
```

help.go

```go
// help.go
package main
import (
	"fmt"
)

func help() {
	fmt.Println("Help!")
}
```


There are two type of packages

- Executable: Generate a file that we can run.
- Reuseable: Code dependencies or libraries that we can reuse.

Use package name `main` to specify this package can be compiled and then executed. Inside the main package, it must has a func call 'main'

Other package name defines a package that cab be used as a dependency.
We will discuss how to use reuseable packages later.



### import

The import keyword is used to import other packages.
The import block is enclosed in ***parentheses ()***, and each import is specified within double quotes.

Although there are some standard libraries such as math, fmt ,debug ... etc.
We still need to use import to link the library to our package.
you can find out more standard libraries on [https://pkg.go.dev/std](https://pkg.go.dev/std)

Besides, you can import third party packages from internet as well.
for example `import "golang.org/x/example/stringutil"`
This required you to install the package via command `go get <package>` before building your own package.


### func main()

The entry of our execuable code. This function is required for main package.

Naming Conventions
-----------------

Naming conventions play an essential role in Go, as they contribute to code readability and maintainability. Go has a set of naming conventions that are widely followed by the Go community. Let's explore some key aspects of naming conventions in Go:

### Package Names:

Package names should be short, concise, and indicative of the package's purpose.
Use lowercase letters for package names (e.g., fmt, net/http, myproject).
Avoid using underscores or mixed case in package names.
Choose meaningful and descriptive names that accurately represent the package's functionality.

### Variable and Function Names:

Use camelCase for variable and function names (e.g., myVariable, calculateSum).
Begin variable and function names with a lowercase letter.
Use descriptive names that convey the purpose or meaning of the variable or function.
Avoid excessively long names while still maintaining clarity and readability.
Strive for consistency in naming within the context of a package or project.

### Constant Names:

Use uppercase letters for constant names (e.g., MAX_VALUE, PI).
Separate words in constant names using underscores.
Prefer using descriptive names for constants that indicate their purpose.
Constants should be all uppercase to distinguish them from variables and functions.

### Exported Names:

In Go, exported names are names that start with an uppercase letter.
Exported names are visible and accessible outside the package in which they are defined.
Unexported (or internal) names start with a lowercase letter and are not accessible outside the package.
Use exported names for functions, variables, and types that are intended to be used by other packages.
Abbreviations and Acronyms:

### Abbreviations and acronyms should be consistent in case (e.g., URL, HTTPRequest).

Avoid using abbreviations or acronyms that may be unfamiliar to others.
When possible, choose more descriptive names over abbreviations for improved code readability.



Following these naming conventions helps to write clean, consistent, and maintainable Go code. Consistency within a package or project is key to enhancing code readability and making it easier for other developers to understand and collaborate on the codebase.