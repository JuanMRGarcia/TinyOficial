var http = require('http');
var port = 3000;
var laddr = 'ec2-54-161-237-142.compute-1.amazonaws.com';
http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello, Red Hat Developer Program World from ' +
	    process.version + '!\n');
    console.log('Processed request for '+ req.url);
}).listen(port, laddr);
console.log('Server running at http://' + laddr + ':' + port + '/');


const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const app = express();

const routes = require('./routes/index')
// settings

app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// midLewares
app.use((req, res, next) =>{
	console.log('${req.url} -${req.method}');
	next();
})

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
//routes
app.use(routes);

//static files
app.use(express.static(path.join(__dirname, 'public')));

//start the server
app.listen(app.get('port'), () => {
	console.log('Server on port ', app.get('port'))
});
