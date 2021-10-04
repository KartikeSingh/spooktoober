const express = require('express')
const app = express()
// Simple YT Vid downloader 
// Ex. https://url.domain/api?url=https://www.youtube.com/watch?v=dQw4w9WgXcQ
app.get('/api', (res, req) => {
res.redirect(`https://cryptons.ga/api/v1/youtube/download?url=${req.query.url}`)
})
app.get('/', (res, req) => {
res.send({
gay; "Why u even here?"
})
})
app.listen(3000, () => {
  console.log('server started');
});
