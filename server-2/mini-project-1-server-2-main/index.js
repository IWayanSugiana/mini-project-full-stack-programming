// package from express
const express = require('express');
const app = express();
app.use(express.json());

// package from dotenv
require('dotenv').config({path:'./config/.env'});

// package from axios
const axios = require('axios').default;

// package from crypto
const HMAC256 = require('crypto-js/hmac-sha256');
const SHA256 = require('crypto-js/sha256');

// get port
const port = process.env.PORT;


app.post('/api/redirect_payment', (req, res) => {
    var va = process.env.VIRTUAL_ACCOUNT;
    var key = process.env.API_KEY;

    // request object
    const object = {
        "product" : req.body.product,
        "qty" : req.body.qty,
        "price" : req.body.price,
        "description" : req.body.description,
        "returnUrl": req.body.returnUrl,
        "notifyUrl": req.body.notifyUrl,
        "cancelUrl": req.body.cancelUrl,
        "paymentMethod": req.body.paymentMethod
    }

    // create signature
    var stringTosign = `POST:${va}:` + SHA256(JSON.stringify(object)) + `:${key}`
    var encrypt = HMAC256(stringTosign, key);

    axios.post('https://sandbox.ipaymu.com/api/v2/payment', object, {
        headers: {
        'Content-Type': 'application/json',
        'va' : va,
        'signature': encrypt,
        'timestamp': new Date(),
        }
    })
    .then(function(response) {
        res.send(response.data)
    })
    .catch(function(error){
        res.send(error.response.data);
    })
});



app.listen(port, () => console.log(`Listening on port ${port}`));