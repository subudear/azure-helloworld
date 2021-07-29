package health

import "net/http"

//check health
func health(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Health Check Pass</h1>")
}