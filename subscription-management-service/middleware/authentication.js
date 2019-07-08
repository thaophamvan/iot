module.exports = function (req, res, next) {
    console.log(req.headers.authorization);
    if (req.headers.authorization !== "1234-1234-1234-1234") {
        return res.status(401).json({ error: 'No credentials sent!' });
    }
    next();
}
