---
title: "#13 Go Modules"
author: Brandon Tsai
---

Within a small application, we can just use the main package and functionalities imported from Go’s core library packages.
However, The code base could become bigger and more complex as time goes on.
We might import massive third party packages from internet. Or, we might want to divide the complicate code base into semantic groups of functionality and unify them into a customized shared package within our project.

At this point, we can use [Go Modules](https://go.dev/blog/using-go-modules) to manages these dependencies and the customize packages.


Basic Usage of "go mod" toolchain
--------------

### `go mod init <ModuleName>` 
This command is used to generated a go.mod file in the current directory, which will be viewed as the root directory of a module called.

```go
$ go mod init brandon/go-example
go: creating new go.mod: module brandon/go-example
go: to add module requirements and sums:
	go mod tidy

```

### `go mod tidy`
Adds missing and remove unused modules dependencies by analyzing all the source code of the current project. Let's update the main.go to use a third party package as following

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

Then we can run `go mod tidy` to fetch the missing dependencies.

```bash
$ go mod tidy
go: finding module for package golang.org/x/example/stringutil
go: found golang.org/x/example/stringutil in golang.org/x/example v0.0.0-20210811190340-787a929d5a0d
```

This command update go.mod with the dependencies and generate 'go.sum' file which maintains the checksum so that when you run the project again 
, it will not install all dependencies packages again.

```bash
$ cat go.mod
module brandon/go-example

go 1.17

require golang.org/x/example v0.0.0-20210811190340-787a929d5a0d

$ cat go.sum
github.com/yuin/goldmark v1.2.1/go.mod h1:3hX8gzYuyVAZsxl0MRgGTJEmQBFcNTphYh9decYSb74=
golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod h1:djNgcEr1/C05ACkg1iLfiJU5Ep61QUkGW8qpdssI0+w=
golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod h1:yigFU9vqHzYiE8UmvKecakEJjdnWj3jj499lnFckfCI=
golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod h1:LzIPMQfyMNhhGPhUkYOs5KpL4U8rLKemX1yGLhDgUto=
golang.org/x/example v0.0.0-20210811190340-787a929d5a0d h1:VYLNvPLNayyBk9XOnsTk5jh7vZarEfiJe7/S15vri2g=
golang.org/x/example v0.0.0-20210811190340-787a929d5a0d/go.mod h1:+yakPl5KR9J+ysfUNADYwEU5qeqjUO473wDktD4xMYw=
golang.org/x/mod v0.3.0/go.mod h1:s0Qsj1ACt9ePp/hMypM3fl4fZqREWJwdYDEqhRiZZUA=
golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod h1:t9HGtf8HONx5eT2rtn7q6eTqICYqUVnKs3thJo3Qplg=
golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod h1:z5CRVTTTmAJ677TzLLGU+0bjPO0LkuOLi4/5GtJWs/s=
golang.org/x/net v0.0.0-20201021035429-f5854403a974/go.mod h1:sp8m0HH+o8qH0wwXwYZr8TS3Oi6o0r6Gce1SSxlDquU=
golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM=
golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM=
golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
golang.org/x/text v0.3.0/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ=
golang.org/x/text v0.3.3/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod h1:n7NCudcB/nEzxVGmLbDWY5pfWTLqBcC2KZ6jyYvM4mQ=
golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod h1:b+2E5dAYhXwXZwtnZ6UAqBI28+e2cm9otk0dWdXHAEo=
golang.org/x/tools v0.0.0-20210112183307-1e6ecd4bf1b0/go.mod h1:emZCQorbCU4vsT4fOWvOPXz4eW1wZW4PmDk9uLelYpA=
golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod h1:I/5z698sn9Ka8TeJc9MKroUUfqBBauWjQqLJ2OPfmY0=
golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod h1:I/5z698sn9Ka8TeJc9MKroUUfqBBauWjQqLJ2OPfmY0=
golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod h1:I/5z698sn9Ka8TeJc9MKroUUfqBBauWjQqLJ2OPfmY0=
```

### `go mod vendor`

This command making a copy of the third-party packages defined in go.mod and places it inside the /vendor in your root.
There are cases when we want to ensure the robustness of the packages builds without having to rely on external services like github or golang.org.
To build a package with the dependencies from the vendor directory, you need to specify `-mod` in the comand, for example `go build -mod vendor`.

```bash
$ go mod vendor
$ ls vendor/
golang.org	modules.txt
```

Create Shared Packages Within A Module
-------------------------------

Until now, We have only written code in the main package.
Let’s create a project that has customized shared package and see how to imports and use the functions in the shared package.


```bash
poker/
├── deck/
│   └── cards.go
├── go.mod
└── main.go
```

First, we implement the shared package deck/cards.go as following:

```go
package deck

func GetStandardDeck() [52]string {
	cards := [52]string{}

	i := 0
	for _, s := range getSuits() {
		for _, r := range getRanks() {
			cards[i] = s + " " + r
			i += 1
		}
	}

	return cards
}

func getSuits() [4]string {
	return [4]string{"Clubs", "Diamonds", "Hearts", "Spades"}
}

func getRanks() [13]string {
	return [13]string{"A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"}
}


```

Then we can import the shared pakcage with path `<Module_Path>/<package>` in main.go file .
In this example, I init this module with command `go mod init brandon/poker`
so I need to import the deck pakcage with path `brandon/poker/deck`

```go
package main

import (
	"fmt"

	"brandon/poker/deck"
)

func main() {
	a := deck.GetStandardDeck()
	for _, x := range a {
		fmt.Println(x)
	}
}

```

Exported vs Unexported names
----------------------------

Exported name: Anything (variable, type, or function) that starts with a capital letter is exported (public), and accessable outside the package.
Unexported name: Anything that does not start with a capital letter is not exported (private), and is accessable only inside the same package.
When you import a package, you can only access its exported names.

for example, in the main package, we can not call getSuits() and getRanks() functions because they are unexported. Only the exported GetStandardDeck() function can be accessed.

