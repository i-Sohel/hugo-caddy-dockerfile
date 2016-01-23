FROM ubuntu:trusty

# Installing Go
RUN apt-get install -y curl
RUN curl -O https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz
RUN su root -c "tar -C /usr/local -xzf go1.5.2.linux-amd64.tar.gz"
ENV PATH=$PATH:/usr/local/go/bin
RUN mkdir $HOME/go
ENV GOPATH=$HOME/go
ENV PATH=$PATH:$GOPATH/bin
RUN apt-get install -y git

#Installing Caddy
RUN apt-get install -y wget
RUN wget https://caddyserver.com/download/builds/161101134256938/caddy_linux_amd64_custom.tar.gz
RUN mkdir /usr/local/caddy
RUN mkdir /usr/local/caddy/bin
RUN su root -c "tar -C /usr/local/caddy/bin -xzf caddy_linux_amd64_custom.tar.gz"
ENV PATH=$PATH:/usr/local/caddy/bin
RUN cd $HOME/go

#Installing Hugo
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mercurial 
RUN go get -v github.com/spf13/hugo
RUN mkdir /usr/local/hugo
RUN mkdir /usr/local/hugo/bin
WORKDIR $GOPATH/bin/
RUN cp hugo /usr/local/hugo/bin
ENV PATH=$PATH:/usr/local/hugo/bin

EXPOSE 22 80
ENTRYPOINT ["/usr/local/caddy/bin/caddy"]
