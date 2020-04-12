const express = require('express');
const fs = require('fs');
const public = "./public/";
let app = express();

// Sends the home page
app.get('/', (req, res)=>{
    fs.readFile(public + "home.html", (err, data) => {
        if(err) throw err;
        res.end(data);
    });
});

// Sends the cart page
app.get('/cart', (req, res)=> {
    fs.readFile(public + "cart.html", (err, data) => {
        if(err) throw err;
        res.end(data);
    });
});

app.listen(3000, () => {
    console.log("Starting server on PORT 3000");
    console.log("To view, go to http://localhost:3000");
});