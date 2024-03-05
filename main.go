package main

import (
	"fmt"
	"log"
	"net/http"
)

func IndexHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("/index endpoint was hit")
	fmt.Fprintf(w, "Hello world from our server")
}

func main() {
	http.HandleFunc("/index", IndexHandler)

	http.ListenAndServe(":8080", nil)
}
