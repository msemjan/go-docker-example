build:
	go build main.go

run: build
	./main

docker:
	docker build -t hello-server .

docker-run:
	sudo docker run -p 8080:8080 -it hello-server
