https://www.honeybadger.io/blog/golang-logging/



Add Log with Logrus
--------


```go
package main

import (
	log "github.com/sirupsen/logrus"
)

func main() {
	log.SetLevel(log.InfoLevel)
	log.Info("This is Info log1")
	log.Debug("This is Debug log1")
	log.Warning("This is Warning log1")
	log.Error("This is Error log1")

	log.SetLevel(log.DebugLevel)
	log.Info("This is Info log2")
	log.Debug("This is Debug log2")
	log.Warning("This is Warning log2")
	log.Error("This is Error log2")
}

```

if you get following error
```
/Users/brandon/go/pkg/mod/golang.org/x/sys@v0.0.0-20191026070338-33540a1f6037/unix/syscall_darwin.1_13.go:25:3: //go:linkname must refer to declared function or variable
```

you need to run `go get -u golang.org/x/sys` to get the latest version of sys module


Output Log To File
---------------



