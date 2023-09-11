const mysql = require("mysql")

module.exports = async () => {
    let db = await mysql.createConnection({
        host: "78.108.218.47",
        user: "u91440_HbxyfiA1Z7",
        password: "IqrFYg06TE6VjQ8SGY.=wGy4",
        database: "s91440_botv14"
    })

    return db;
}