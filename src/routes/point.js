const Router = require('express-promise-router')
const pool = require('./../configs/db')

const router = new Router()

module.exports = router

router.get("/", async (req, res) => {
  try {
    const allPoint = await pool.query("SELECT id_point, nama_point, geom FROM point");
    res.json(allPoint.rows);
  } catch (err) {
    console.error(err.message);
  }
});

router.get("/:id", async (req, res) => {
  try {
    const { id } = req.params
    const pointById = await pool.query("SELECT id_point, nama_point, geom FROM point WHERE id_point = $1", [id]);
    res.json(pointById.rows);
  } catch (err) {
    console.error(err.message);
  }
});