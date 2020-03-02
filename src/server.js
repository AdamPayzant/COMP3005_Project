const express = require('express');
const { Client } = require('pg');

const public = "./public/";

let app = express();

app.get('/', (req, res)=>{
    res.end(public + "index.html");
});

let server = app.listen(3000, ()=> {});
