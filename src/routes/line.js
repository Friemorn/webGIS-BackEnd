const Router = require('express-promise-router')
const pool = require('./../configs/db')

const router = new Router()

module.exports = router

router.get("/", async (req, res) => {
  try {
    const allLine = await pool.query("SELECT id_line, nama_line, geom, ST_AsGeoJSON(geom) AS koordinat, SUM(ST_Length(geom)) AS panjang_garis, deskripsi FROM line GROUP BY id_line")
    res.json(allLine.rows)
  } catch (err) {
    console.error(err.message)
  }
})

router.get("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const lineById = await pool.query("SELECT id_line, nama_line, geom, ST_AsGeoJSON(geom) AS koordinat, SUM(ST_Length(geom)) AS panjang_garis, deskripsi FROM line WHERE id_line = $1 GROUP BY id_line", [id])
    res.json(lineById.rows)
  } catch (err) {
    console.error(err.message)
  }
})

router.post("/", async (req, res) => {
  try {
    const { id_line, nama_line, geom, deskripsi } = req.body
    const insertPoint = await pool.query("INSERT INTO line (nama_line, geom, deskripsi) VALUES($1, ST_SetSRID(ST_GeomFromText($2), 4326), $3) RETURNING *", [nama_line, geom, deskripsi])
    res.json(insertPoint.rows[0])
  } catch (err) {
    console.error(err.message)
  }
})

router.patch("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const { nama_line, geom, deskripsi } = req.body
    const updateLine = await pool.query("UPDATE line SET nama_line = $2, geom = ST_SetSRID(ST_GeomFromText($3), 4326), deskripsi = $4 WHERE id_line = $1", [id, nama_line, geom, deskripsi])
    res.json("Line was Updated!")
  } catch (err) {
    console.error(err.message)
  }
})

router.delete("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const deleteLine = await pool.query("DELETE FROM line WHERE id_line = $1", [id])
    res.json("Line was Deleted!")
  } catch (err) {
    console.log(err.message)
  }
})