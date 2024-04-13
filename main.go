package main

import "fmt"

type User struct {
	Name string
}

func (u *User) hello() {
	fmt.Print(u.Name)
}

func main() {
	user := &User{
		Name: "hoge",
	}
	user.hello()
}
