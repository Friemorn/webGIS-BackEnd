const express = require('express')
const pointRoutes = require('./point')
const lineRoutes = require('./line')
const polygonRoutes = require('./polygon')

const router = express.Router()

router
  .use('/point', pointRoutes)
  .use('/line', lineRoutes)
  .use('/polygon', polygonRoutes)

module.exports = router
