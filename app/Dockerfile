FROM golang:1.17-alpine
WORKDIR /app
ENV PORT 8080
EXPOSE 8080
COPY hello-service/go.mod ./
#COPY hello-service/go.sum ./
RUN go mod download
COPY hello-service/*.go ./
RUN go build -o /docker-hello
CMD [ "/docker-hello" ]