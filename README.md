# Hugo with Caddy Dockerfile
[Hugo] (https://gohugo.io/), a fast and flexible static site generator built by [spf13](https://github.com/spf13/hugo) and friends in Go. So we extended that love to hugo by adding [Caddy](https://caddyserver.com/) web server as it's powerful and easy to use web server in one Dockerfile package. [Caddy](https://caddyserver.com/) supports HTTP/2, IPv6, Markdown, WebSockets, FastCGI, templates and more, right out of the box.

# Usage
Simply build a new Docker image using dockerfile. e.g ``` docker build -t hugo /path/to/dockerfile ``` 
