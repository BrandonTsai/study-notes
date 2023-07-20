Go Template
============

In Go, you can parse a file as a template and assign the output as a string variable using the template.ParseFiles() and Template.Execute() functions from the text/template package.

Here's an example of how to parse a file as a template and assign the output as a string variable:

```go
package main

import (
	"fmt"
	"os"
	"text/template"
)

type Person struct {
	Name string
	Age  int
}

func main() {
	// Create a person object
	p := Person{"John", 30}

	// Parse a template file
	t, err := template.ParseFiles("template.txt")
	if err != nil {
		panic(err)
	}

	// Execute the template with the person data and capture the output in a string
    var buf bytes.Buffer
	err = t.Execute(&buf, p)
	if err != nil {
		panic(err)
	}
    outputStr := buf.String()
    fmt.Println(outputStr)

}
```

In this example, we parse a template file called template.txt using the template.ParseFiles() function. We then execute the template with data using the Execute() function, but instead of writing the result to os.Stdout, we capture the output in a string variable called output using the fmt.Sprint() function.

After executing the template and assigning the output to a variable, we print the output using the fmt.Println() function. Note that we could have also written the output to a file or sent it over the network instead of printing it to the console.

Include Template file in your go binary
------

starting from Go 1.16, you can use the embed package to include files in your binary. The embed package provides a simple way to embed files or directories in your Go binary.

Here's how to use embed to load the template file and make sure the content is included in the binary:

In your command line, navigate to the root directory of your Go project.

Create a directory called templates in the root directory of your Go project.

Inside the templates directory, create a file called mytemplate.tpl. This is the template file you want to include in the binary.

In your Cobra command function, add the following code:


```go
package cmd

import (
    "embed"
    "fmt"
    "github.com/spf13/cobra"
    "text/template"
)

//go:embed templates/mytemplate.tpl
var tplContent embed.FS

func init() {
    rootCmd.AddCommand(myCmd)
}

func myCmd(cmd *cobra.Command, args []string) {
    tplData, err := tplContent.ReadFile("templates/mytemplate.tpl")
    if err != nil {
        fmt.Println(err)
        return
    }

    tpl := template.Must(template.New("mytemplate.tpl").Parse(string(tplData)))

    data := struct {
        Name string
        Age  int
    }{
        Name: "John Doe",
        Age:  25,
    }

    err = tpl.Execute(os.Stdout, data)
    if err != nil {
        fmt.Println(err)
        return
    }
}
```

In this code, we use the embed package to embed the mytemplate.tpl file in the binary. The //go:embed directive is used to specify the files or directories to embed. We then use embed.FS.ReadFile() to read the content of the embedded file, create a template.Template with the content using template.New("mytemplate.tpl").Parse(), and execute the template with data.

Note that we need to use template.Must() to create the template.Template and panic if there's an error parsing the template.

When you build your binary using go build, the content of the mytemplate.tpl file will be included in the binary. You don't need to use any special flags or tools to achieve this.