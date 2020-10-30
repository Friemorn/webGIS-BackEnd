const Router = require('express-promise-router')
const pool = require('./../configs/db')

const router = new Router()

module.exports = router

router.get("/", async (req, res) => {
  try {
    const allPoint = await pool.query("SELECT id_point, nama_point, geom FROM point")
    res.json(allPoint.rows)
  } catch (err) {
    console.error(err.message)
  }
})

router.get("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const pointById = await pool.query("SELECT id_point, nama_point, geom FROM point WHERE id_point = $1", [id])
    res.json(pointById.rows)
  } catch (err) {
    console.error(err.message)
  }
})

router.post("/", async (req, res) => {
  try {
    const { nama_point, lat, long } = req.body
    const insertPoint = await pool.query("INSERT INTO point (nama_point, geom) VALUES($1, (ST_SetSRID(ST_MakePoint($2, $3), 4326))) RETURNING *", [nama_point, lat, long])
    res.json(insertPoint.rows[0])
  } catch (err) {
    console.error(err.message)
  }
})

router.patch("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const { id_point, nama_point, lat, long } = req.body
    const updatePoint = await pool.query("UPDATE point SET nama_point = $2, geom = (ST_SetSRID(ST_MakePoint($3, $4), 4326)) WHERE id_point = $1", [id, nama_point, lat, long])
    res.json("Point was Updated!")
  } catch (err) {
    console.error(err.message)
  }
})

router.delete("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const deletePoint = await pool.query("DELETE FROM point WHERE id_point = $1", [id])
    res.json("Point was Deleted!")
  } catch (err) {
    console.log(err.message)
  }
})