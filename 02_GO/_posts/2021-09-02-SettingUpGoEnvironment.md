---
title: "#2 Setting Up the Go Environment"
author: Brandon Tsai
---


Setting up the Go environment is the first step towards developing Go applications. In this chapter, we will walk through the process of installing Go on macOS, configuring plugins and environment variables for Go in the Visual Studio Code (VSCode) editor, and verifying the installation. We will also introduce some of the basic toolchains that come with Go.

Go Installation
-----------

**Step 1:** Visit the official Go website at and download latest stable release of Go at https://golang.org/doc/install
**Step 2:** Open the package file you downloaded and follow the prompts to install Go.
**Step 3:** After the installation is complete, open the Terminal application and verify the Go installation by running the following command: `go version`


Configure Environment Variables
--------------------------------

### GOPATH

GOPATH is a variable that defines the root of your workspace. 
By default, the workspace directory is a directory that is named go within your user home directory (~/go for Linux and MacOS, %USERPROFILE%/go for Windows). 
GOPATH stores your code base and all the files that are necessary for your development. You can use another directory as your workspace by configuring GOPATH for different scopes. Open the Terminal and run the following command to set the GOPATH environment variable:

```shell
export GOPATH=$HOME/go
```
To make this setting permanent, you can add this line to your shell configuration file (e.g., .bash_profile, .bashrc, or .zshrc).

GOPATH is the root of your workspace and contains the following folders:
src/: location of Go source code (for example, .go, .c, .g, .s).
pkg/: location of compiled package code (for example, .a).
bin/: location of compiled executable programs built by Go.

To run the compiled executable binary files, you can add the Go binaries directory to your PATH via following command:

```shell
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
```

Similarly, you can add this line to your shell configuration file to make the setting permanent.


Go support in VSCode
--------------------

Visual Studio Code (VSCode) is a popular code editor that provides excellent support for Go development. To configure VSCode for Go development, follow these steps:

**Step 1:** Install the Go extension for VSCode. Open VSCode and go to the Extensions view by clicking on the square icon on the left sidebar or by pressing Cmd+Shift+X. Search for "Go" and click on the "Go" extension by Google.

[](02-go-extension-vscode.png)

**Step 2:** Click the Install button to install the extension. After the installation, you may be prompted to reload VSCode for the changes to take effect. Click the Reload button.

**Step 3:** Open the settings.json file in VSCode. You can access the settings by going to Code -> Preferences -> Settings or by pressing `Cmd` + `, (comma)`. In the settings, search for "go.gopath" and set the value to "$HOME/go". This step ensures that the Go extension in VSCode recognizes your GOPATH.

**Step 4:** Refer https://code.visualstudio.com/docs/languages/go for more usage of this extension.



The Go Toolchain Introduction
---------------------------

Go comes with a comprehensive toolchain that helps developers build, test, and manage Go projects. The basic toolchain includes various commands and utilities that facilitate Go development.
We will use the example repo to help us understand some important CLI commands for Go.

```bash
$ git clone https://go.googlesource.com/example
$ cd example
```

### go run

`go run` command is used for compiling and running a simple Go program.
It is not recommended to compile and run large Go projects.
Instead, you should use the commands `go build` for large project to build and executable the binary files.

```bash
$ cd hello
$ go run .
Hello, Go examples!
```

### go build

`go build` compiles the packages with their dependencies and writes the resulting executable to in current folder, but it does not install the results.

```bash
$ cd hello
$ go build
$ ls
hello		hello.go
$ ./hello 
Hello, Go examples!

```

**Cross Compile**

By default, `go build` command generate project binary for the current system’s platform.
You can use `GOOS` and `GOARCH` environment variables to specify the target system platform and architecture for different types of machine.
Example:

```bash
$ export GOARCH="amd64"
$ export GOOS="linux"
$ go build
```


**X Flag**

`go build -x` allows you to see how Go is performing the build process. This command helps to debug the process when you are doing a conditional build.

```bash
$ go build -x .
WORK=/var/folders/7z/k_5hdgqx3vq1qrtxrk3619rw0000gn/T/go-build2107802638
mkdir -p $WORK/b001/
cat >$WORK/b001/importcfg.link << 'EOF' # internal
packagefile golang.org/x/example/hello=/Users/brandon/Library/Caches/go-build/7c/7c302081fd9a21baf0f4d985062baa1ed447ad7a1e7a01e03c2c72871664a6fa-d
packagefile fmt=/usr/local/go/pkg/darwin_amd64/fmt.a
packagefile golang.org/x/example/stringutil=/Users/brandon/Library/Caches/go-build/d3/d35bf9fd2fb681cfcc6b3d61a8ea6df43aa584e3a39cfbcedcb8b8499b43c26e-d
packagefile runtime=/usr/local/go/pkg/darwin_amd64/runtime.a
packagefile errors=/usr/local/go/pkg/darwin_amd64/errors.a
packagefile internal/fmtsort=/usr/local/go/pkg/darwin_amd64/internal/fmtsort.a
packagefile io=/usr/local/go/pkg/darwin_amd64/io.a
packagefile math=/usr/local/go/pkg/darwin_amd64/math.a
packagefile os=/usr/local/go/pkg/darwin_amd64/os.a
packagefile reflect=/usr/local/go/pkg/darwin_amd64/reflect.a
packagefile strconv=/usr/local/go/pkg/darwin_amd64/strconv.a
packagefile sync=/usr/local/go/pkg/darwin_amd64/sync.a
packagefile unicode/utf8=/usr/local/go/pkg/darwin_amd64/unicode/utf8.a
packagefile internal/abi=/usr/local/go/pkg/darwin_amd64/internal/abi.a
packagefile internal/bytealg=/usr/local/go/pkg/darwin_amd64/internal/bytealg.a
packagefile internal/cpu=/usr/local/go/pkg/darwin_amd64/internal/cpu.a
packagefile internal/goexperiment=/usr/local/go/pkg/darwin_amd64/internal/goexperiment.a
packagefile runtime/internal/atomic=/usr/local/go/pkg/darwin_amd64/runtime/internal/atomic.a
packagefile runtime/internal/math=/usr/local/go/pkg/darwin_amd64/runtime/internal/math.a
packagefile runtime/internal/sys=/usr/local/go/pkg/darwin_amd64/runtime/internal/sys.a
packagefile internal/reflectlite=/usr/local/go/pkg/darwin_amd64/internal/reflectlite.a
packagefile sort=/usr/local/go/pkg/darwin_amd64/sort.a
packagefile math/bits=/usr/local/go/pkg/darwin_amd64/math/bits.a
packagefile internal/itoa=/usr/local/go/pkg/darwin_amd64/internal/itoa.a
packagefile internal/oserror=/usr/local/go/pkg/darwin_amd64/internal/oserror.a
packagefile internal/poll=/usr/local/go/pkg/darwin_amd64/internal/poll.a
packagefile internal/syscall/execenv=/usr/local/go/pkg/darwin_amd64/internal/syscall/execenv.a
packagefile internal/syscall/unix=/usr/local/go/pkg/darwin_amd64/internal/syscall/unix.a
packagefile internal/testlog=/usr/local/go/pkg/darwin_amd64/internal/testlog.a
packagefile internal/unsafeheader=/usr/local/go/pkg/darwin_amd64/internal/unsafeheader.a
packagefile io/fs=/usr/local/go/pkg/darwin_amd64/io/fs.a
packagefile sync/atomic=/usr/local/go/pkg/darwin_amd64/sync/atomic.a
packagefile syscall=/usr/local/go/pkg/darwin_amd64/syscall.a
packagefile time=/usr/local/go/pkg/darwin_amd64/time.a
packagefile unicode=/usr/local/go/pkg/darwin_amd64/unicode.a
packagefile internal/race=/usr/local/go/pkg/darwin_amd64/internal/race.a
packagefile path=/usr/local/go/pkg/darwin_amd64/path.a
EOF
mkdir -p $WORK/b001/exe/
cd .
/usr/local/go/pkg/tool/darwin_amd64/link -o $WORK/b001/exe/a.out -importcfg $WORK/b001/importcfg.link -buildmode=exe -buildid=Ti7_47Jz2to15h_7uJ7o/DGcSnpuydnHt86uC2z3J/oTJijITJicVoW5OA9_wI/Ti7_47Jz2to15h_7uJ7o -extld=clang /Users/brandon/Library/Caches/go-build/7c/7c302081fd9a21baf0f4d985062baa1ed447ad7a1e7a01e03c2c72871664a6fa-d
/usr/local/go/pkg/tool/darwin_amd64/buildid -w $WORK/b001/exe/a.out # internal
mv $WORK/b001/exe/a.out hello
rm -r $WORK/b001/

$ ls
hello		hello.go
```

### go install

Compile and install packages and dependencies to $GOPATH/bin folder.
Default GOPATH is:

 - $HOME/go on Unix-like systems
 - %USERPROFILE%\go on Windows

for example:

```
$ go install
$ ls ~/go/bin/
hello
```

### go get

Add/Upgrade/Downgrade/Remove a single dependency package to $GOPATH/pkg/.

Install package:

```bash
$ go get github.com/gobuffalo/flect
go: downloading github.com/gobuffalo/flect v0.2.3
go get: added github.com/gobuffalo/flect v0.2.3
```

Downgrade/Upgrade to particular version

```bash
$ go get github.com/gobuffalo/flect@v0.2.2
go: downloading github.com/gobuffalo/flect v0.2.2
go get: downgraded github.com/gobuffalo/flect v0.2.3 => v0.2.2
```

Uninstall package

```bash
$ go get github.com/gobuffalo/flect@none
go get: removed github.com/gobuffalo/flect v0.2.2
```

### go fmt

To format Go source code with a consistent coding style.

### go test

Executes test functions (Usually in test files). You can add the -v flag to lists all of the tests and their results.

```bash
$ cd stringutil
$ go test
PASS
ok  	golang.org/x/example/stringutil	0.004s
```

### go tool

This is the most powerful tool that Go provides natively. We all owe to Go’s engineers for coming up with this utility. Right from diagnosing the latency problems to finding bottlenecks with heap and threads in the code, Go profiling tools is something a production-grade system wants!

`go tool trace`

trace lets you collect your program traces and helps to visualize it.

Given a trace file produced by 'go test':

```
$ go test -trace=trace.out
PASS
ok  	golang.org/x/example/stringutil	0.005s
```

Open a web browser displaying trace:

```
$ go tool trace trace.out
2021/09/08 01:08:28 Parsing trace...
2021/09/08 01:08:28 Splitting trace...
2021/09/08 01:08:28 Opening browser. Trace viewer is listening on http://127.0.0.1:53082
```


`go tool pprof`

pprof lets you collect CPU profiles, traces, and heap profiles for your Go programs. 
Please refer https://pkg.go.dev/net/http/pprof for more details.



Conclusion
----------

By following these steps, you have successfully set up the Go environment on your Macbook or macOS system, configured VSCode for Go development, and verified the installation by building and running a simple Go program. In the next chapters, we will delve into the essential concepts and techniques of the Go language that every DevOps engineer should know.