package main

type User struct {
	Name string
}

func main() {
	_ = &User{
		Name: "hoge",
	}
}
