package main

import "fmt"
import "net/http"
import "hello-world/health"

func index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Hello World</h1>")
}


func main() {
	fmt.Println("Server Starting...")
    mux := http.NewServeMux()
    mux.HandleFunc("/", index)
	//http.HandleFunc("/",index)
	//http.HandleFunc("/health",health.health)
	mux.HandleFunc("/health", health.Health)

	http.ListenAndServe(":8080",nil)
}