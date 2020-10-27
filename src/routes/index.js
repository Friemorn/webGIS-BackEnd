const express = require('express')
const pointRoutes = require('./point')

const router = express.Router()

router
  .use('/point', pointRoutes)

module.exports = router
