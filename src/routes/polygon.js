const Router = require('express-promise-router')
const pool = require('./../configs/db')

const router = new Router()

module.exports = router

router.get("/", async (req, res) => {
  try {
    const allPolygon = await pool.query("SELECT id_polygon, nama_polygon, geom, SUM(ST_Area(geom))/1000 AS luas_area, deskripsi FROM polygon GROUP BY id_polygon")
    res.json(allPolygon.rows)
  } catch (err) {
    console.error(err.message)
  }
});

router.get("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const polygonById = await pool.query("SELECT id_polygon, nama_polygon, geom, SUM(ST_Area(geom))/1000 AS luas_area, deskripsi FROM polygon WHERE id_polygon = $1 GROUP BY id_polygon", [id])
    res.json(polygonById.rows)
  } catch (err) {
    console.error(err.message)
  }
});

//Di pgadmin bisa, di Node.JS belum bisa
router.post("/", async (req, res) => {
  try {
    const { id_polygon, nama_polygon, geom, deskripsi } = req.body
    const insertPolygon = await pool.query("INSERT INTO polygon (nama_polygon, geom, deskripsi) VALUES($1, ST_SetSRID(ST_GeomFromText('POLYGON(($2))'), 4326), $3) RETURNING *", [nama_polygon, geom, deskripsi])
    res.json(insertPolygon.rows[0])
  } catch (err) {
    console.error(err.message)
  }
});

//Di pgadmin bisa, di Node.JS belum bisa
router.patch("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const { nama_polygon, geom, deskripsi } = req.body
    const updatePolygon = await pool.query("UPDATE polygon SET nama_polygon = $2, geom = (ST_SetSRID(ST_GeomFromText('POLYGON(($3))'), 4326), deskripsi = $4 WHERE id_polygon = $1", [id, nama_polygon, geom, deskripsi])
    res.json("Polygon was Updated!")
  } catch (err) {
    console.error(err.message)
  }
});

router.delete("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const deletePolygon = await pool.query("DELETE FROM polygon WHERE id_polygon = $1", [id])
    res.json("Polygon was Deleted!")
  } catch (err) {
    console.log(err.message)
  }
})