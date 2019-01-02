FROM 10.247.216.67:20202/swrswr/golang:1.11.2
RUN source /etc/profile
# TODO: Use a container to build this and just use binary
ENV PATH=/usr/local/go/bin:${PATH} \
    GOROOT=/usr/local/go \ 
    GOPATH=/go
COPY ./main.go /go/src/github.com/rnzsgh/hello-world-golang/
WORKDIR /go/src/github.com/rnzsgh/hello-world-golang
RUN go get ./ && go build -o main . && rm -Rf main.go && mv main /

EXPOSE 80

CMD [ "/main" ]
