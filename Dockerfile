FROM node:alpine

WORKDIR /app
COPY package.json .
RUN npm install
COPY metrics.html /
EXPOSE 8080
CMD [ "node", "-e", "const http = require('http');const fs = require('fs');const server = http.createServer((req, res) => {if (req.url === '/') {fs.readFile('/metrics.html', (err, data) => {if (err) {res.writeHead(500);res.end('Error loading metrics.html');} else {res.writeHead(200, {'Content-Type': 'text/html'});res.end(data);}});} else {res.writeHead(404);res.end('Not Found');}});server.listen(8080);" ]
