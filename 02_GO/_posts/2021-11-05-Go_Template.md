Go Template

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
	var output string
	err = t.Execute(os.Stdout, p)
	if err != nil {
		panic(err)
	}

	// Assign the output to a variable
	output = fmt.Sprint(os.Stdout)

	// Print the output
	fmt.Println(output)
}
```

In this example, we parse a template file called template.txt using the template.ParseFiles() function. We then execute the template with data using the Execute() function, but instead of writing the result to os.Stdout, we capture the output in a string variable called output using the fmt.Sprint() function.

After executing the template and assigning the output to a variable, we print the output using the fmt.Println() function. Note that we could have also written the output to a file or sent it over the network instead of printing it to the console.