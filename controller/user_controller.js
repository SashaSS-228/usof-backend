const db = require("../db.js");

class UserController {
  async createUser(req, res) {
    const { login, password, email } = req.body;
    const newPerson = await db.query(
      "INSERT INTO users (login, password, email) VALUES ($1, $2, $3) RETURNING *",
      [login, password, email]
    );
    res.json(newPerson.rows[0]);
  }

  async getUsers(req, res) {
    const users = await db.query("SELECT * FROM users");
    res.json(users.rows);
  }

  async getOneUser(req, res) {
    const id = req.params.id;
    const user = await db.query("SELECT * FROM users where id = $1", [id]);
    res.json(user.rows[0]);
  }

  async updateUser(req, res) {
    const { id, full_name } = req.body;
    const user = await db.query(
      "UPDATE users set full_name = $1 where id = $2 RETURNING *",
      [full_name, id]
    );
    res.json(user.rows[0]);
  }

  async deleteUser(req, res) {
    const id = req.params.id;
    const user = await db.query("DELETE  FROM users where id = $1", [id]);
    res.json(user.rows[0]);
  }
}

module.exports = new UserController();
