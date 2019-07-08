var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.send('Hello v1.0 GET API from electrolux.com');
});

router.post('/', function(req, res, next) {
  res.send('Hello v1.0 POST API from electrolux.com');
});

module.exports = router;