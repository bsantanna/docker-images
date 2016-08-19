var http = require('http');
var https = require('https');

http.createServer(function (req, resp) {
    var h = req.headers;
    h.host = process.env.REVERSE_PROXY_HOST;
    var req2 = https.request({ host: h.host, port: 443, path: req.url, method: req.method, headers: h, rejectUnauthorized: false }, function (resp2) {
        resp.writeHead(resp2.statusCode, resp2.headers);
        resp2.on('data', function (d) { resp.write(d); });
        resp2.on('end', function () { resp.end(); });
    });
    req.on('data', function (d) { req2.write(d); });
    req.on('end', function () { req2.end(); });
}).listen(3003);

console.log('server up on port 3003 proxy to https://' + process.env.REVERSE_PROXY_HOST);