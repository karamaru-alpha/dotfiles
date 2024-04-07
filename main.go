package main

import "fmt"

type User struct {
	Name string
}

func main() {
	user := &User{
		Name: "hoge",
	}
	fmt.Println(user)
}
