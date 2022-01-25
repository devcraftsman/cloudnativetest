package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/heartbeat", HeartBeat)
	http.HandleFunc("/hello", HelloServer)
	http.ListenAndServe(":8080", nil)
}

func HeartBeat(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "RUNNING")
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s!", r.URL.Query().Get("name"))
}
