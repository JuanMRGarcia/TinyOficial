const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const app = express();

const routes = require('./routes/index')

app.get('/', (req, res) =>{
        res.render('eventos')
});
var port = 3000;
app.listen(port);
// settings

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

//start the ser

