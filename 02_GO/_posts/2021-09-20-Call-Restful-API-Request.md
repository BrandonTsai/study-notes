---
title: "Handle Restful API in GO"
author: Brandon Tsai + ChatGPT
---


GO is a popular programming language used to build web applications and services. It has a built-in support for making HTTP requests and consuming RESTful APIs. In this article, we will explore how to call a RESTful API in GO language.


Making HTTP Requests in GO
--------------------------

GO has a built-in [`net/http`](https://pkg.go.dev/net/http) package that provides functions to make HTTP requests. To make an HTTP GET request to a RESTful API, you can use the the basic `Get`, `Head`, `Post`, and `PostForm` methods, for example

```go
package main

import (
    "fmt"
    "net/http"
    "io/ioutil"
)

func main() {
    resp, err := http.Get("https://jsonplaceholder.typicode.com/todos/1")
    if err != nil {
        fmt.Println(err)
        return
    }

    //The client must close the response body when finished with it:
    defer resp.Body.Close()

    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        fmt.Println(err)
        return
    }

    fmt.Println(string(body))
}

```


In the above code, we are making an HTTP GET request to the JSONPlaceholder API endpoint. We are checking for any errors and reading the response body using the `ioutil` package. Finally, we are printing the response body to the console.


However, if you want to control over HTTP client headers, redirect policy, and other settings, You need to create a `Client`.  We will show the examples in following sections.

Handling Response
----------------

The response of a RESTful API can be in various formats such as JSON, XML, or plain text. GO provides a way to handle these different response formats.

### JSON Response

To handle a JSON response, you can use the `encoding/json` package. The following code demonstrates how to unmarshal a JSON response from a RESTful API into a struct:

```go
package main

import (
    "fmt"
    "net/http"
    "encoding/json"
)

type User struct {
    ID       int    `json:"id"`
    Name     string `json:"name"`
    Username string `json:"username"`
    Email    string `json:"email"`
}

func main() {
    url := "https://jsonplaceholder.typicode.com/users/1"

    // create a new request 
    req, err := http.NewRequest("GET", url, nil)
    if err != nil {
        fmt.Println("Error creating request: ", err)
        return
    }
    req.Header.Set("Content-Type", "application/json")

    // send the request using http.Client
    client := &http.Client{}
    resp, err := client.Do(req)
    if err != nil {
        fmt.Println("Error executing request: ", err)
        return
    }

    //The client must close the response body when finished with it:
    defer resp.Body.Close()

    //// Print status code of response
    fmt.Println("Status code:", resp.StatusCode)

    var user User
    err = json.NewDecoder(resp.Body).Decode(&user)
    if err != nil {
        fmt.Println("Error decoding response: ", err)
        return
    }

    fmt.Println(user)
}

```

In the above code, we are creating an HTTP GET request to the JSONPlaceholder API endpoint with the URL "https://jsonplaceholder.typicode.com/users/1". We are setting the Content-Type header to "application/json". Finally, we are decoding the response body into a User struct using the json.NewDecoder function.

### XML Response


To handle an XML response, you can use the encoding/xml package. The following code demonstrates how to unmarshal an XML response from a RESTful API into a struct:

```go

package main

import (
    "fmt"
    "net/http"
    "encoding/xml"
)

type User struct {
    ID       int    `xml:"id"`
    Name     string `xml:"name"`
    Username string `xml:"username"`
    Email    string `xml:"email"`
}

func main() {
    url := "https://www.w3schools.com/xml/note.xml"

    req, err := http.NewRequest("GET", url, nil)
    if err != nil {
        fmt.Println("Error creating request: ", err)
        return
    }

    req.Header.Set("Content-Type", "application/xml")

    client := &http.Client{}
    resp, err := client.Do(req)
    if err != nil {
        fmt.Println("Error executing request: ", err)
        return
    }
    defer resp.Body.Close()

    var user User

    err = xml.NewDecoder(resp.Body).Decode(&user)
    if err != nil {
        fmt.Println("Error decoding response: ", err)
        return
    }

    fmt.Println(user)
}

```

In the above code, we are creating an HTTP GET request to the W3Schools API endpoint with the URL "https://www.w3schools.com/xml/note.xml". We are setting the Content-Type header to "application/xml". We are then decoding the response body into a User struct using the xml.NewDecoder function. Since the response from this API is in XML format only, we don't need to check the Content-Type header of the response.

Sending Data to the API
-------------------------------

In addition to making GET requests, you can also send data to a RESTful API using GO. To send data, you need to create an HTTP POST request.

```go
package main

import (
    "fmt"
    "net/http"
    "bytes"
)

func main() {
    url := "https://jsonplaceholder.typicode.com/posts"
    jsonStr := []byte(`{"title":"foo","body":"bar","userId":1}`)
    req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonStr))
    req.Header.Set("Content-Type", "application/json")

    client := &http.Client{}
    resp, err := client.Do(req)
    if err != nil {
        panic(err)
    }
    defer resp.Body.Close()

    fmt.Println("response Status:", resp.Status)
}
```

In the above code, we are creating an HTTP POST request to the JSONPlaceholder API endpoint with a JSON payload. We are setting the Content-Type header to application/json. Finally, we are printing the response status to the console.


Authentication When Sending Request
--------------------------------------

The common way to authenticate requests to a private API server is using a bearer token.

```go
package main

import (
    "fmt"
    "net/http"
    "bytes"
    "encoding/json"
)

type User struct {
    ID       int    `json:"id"`
    Name     string `json:"name"`
    Username string `json:"username"`
    Email    string `json:"email"`
}

func main() {
    url := "https://myapi.com/users"

    // create a new request with authorization header
    req, err := http.NewRequest("GET", url, nil)
    if err != nil {
        fmt.Println("Error creating request: ", err)
        return
    }
    req.Header.Set("Authorization", "Bearer my_access_token")

    // make the request
    client := &http.Client{}
    resp, err := client.Do(req)
    if err != nil {
        fmt.Println("Error executing request: ", err)
        return
    }
    defer resp.Body.Close()

    // parse the response
    var users []User
    buf := new(bytes.Buffer)
    buf.ReadFrom(resp.Body)
    err = json.Unmarshal(buf.Bytes(), &users)
    if err != nil {
        fmt.Println("Error decoding response: ", err)
        return
    }

    fmt.Println(users)
}
```

In the above code, we are adding an `Authorization` header to the request with the value `Bearer my_access_token`. We are then making the request and parsing the response as before.

Note that the exact method of authentication may differ depending on the API server and authentication scheme being used. For example, some APIs may require Basic Authentication with a username and password, or a different type of token-based authentication. Be sure to consult the API documentation for the specific authentication method to use.



Handle HTTP Requests Concurrently Using `goroutines`:
-----------

Clients is safe for concurrent use by multiple goroutines and for efficiency should only be created once and re-used.

```go
package main

import (
    "fmt"
    "net/http"
    "sync"
    "time"
)

func main() {
    urls := []string{
        "https://www.google.com",
        "https://www.github.com",
        "https://www.stackoverflow.com",
        "https://www.wikipedia.org",
    }

    // create a single http.Client instance to be re-used
    client := &http.Client{
        Timeout: time.Second * 10,
    }

    var wg sync.WaitGroup
    wg.Add(len(urls))

    for _, url := range urls {
        go func(url string) {
            defer wg.Done()
            fmt.Println("Making request to", url)

            resp, err := client.Get(url)
            if err != nil {
                fmt.Println("Error making request to", url, err)
                return
            }

            defer resp.Body.Close()
            fmt.Println("Response from", url, "status code:", resp.StatusCode)
        }(url)
    }

    wg.Wait()
}
```

In the above code, we have a slice of URLs that we want to request concurrently. We are using a `sync.WaitGroup` to wait for all the requests to complete before exiting the program.

We create a single instance of `http.Client` before the loop and re-use it for all requests. This reduces the overhead of creating a new `http.Client` instance for every request and improves efficiency.

We loop through the URLs and for each URL, we create a new goroutine using an anonymous function that makes a GET request to the URL using the `http.Client` struct. We set a timeout of 10 seconds for each request using the Timeout field of the `http.Client` struct.

After making the request, we defer closing the response body and print the status code of the response. Once all the requests have been made, we wait for all goroutines to finish using the `Wait` method of the `sync.WaitGroup`.

Note that the number of goroutines that can be spawned at once is limited by the system resources available, so it's important to not create too many goroutines at once. It's also important to ensure that the program doesn't exit before all goroutines have completed, which is why we use the `sync.WaitGroup` to wait for all requests to finish before exiting.



Conclusion
----------


GO provides built-in support for making HTTP requests and consuming RESTful APIs. With the net/http package and support for various response formats, you can easily consume RESTful APIs in your GO applications.