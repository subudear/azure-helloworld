package main

import "fmt"
import "net/http"


func index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Hello World</h1>")
}

func health(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Health Check Pass</h1>")
}

func main() {
	http.HandleFunc("/",index)
	http.HandleFunc("/health",health)
	fmt.Println("Server Starting...")
	http.ListenAndServe(":8080",nil)
}