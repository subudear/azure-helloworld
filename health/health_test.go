package health

import "net/http"
import "net/http/httptest"
import "testing"

func TestGetHealth(t *testing.T) {
    t.Run("returns healthy", func(t *testing.T) {
        request, _ := http.NewRequest(http.MethodGet,"/health",nil)
        response := httptest.NewRecorder()

        health(response, request)
        got := response.Body.String()
        want := "healthy"
        if gpt != want {
            t.Errorf("Hanlder returned wrong message, got %q, want %q", got, want)
        }
    })
}