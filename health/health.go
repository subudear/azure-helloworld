package health

import "net/http"
import "fmt"

//check health
func Health(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "<h1>Health Check Pass</h1>")
}