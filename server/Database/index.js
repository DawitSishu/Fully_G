import mysql from "mysql2";

try {
  var pool = mysql
    .createPool({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      waitForConnections: true,
      enableKeepAlive: true,
      keepAliveInitialDelay: 0,
    })
    .promise();
  console.log("Connected to Database");
} catch (error) {
  console.log(error);
}

function closePool() {
  pool.end((err) => {
    if (err) {
      console.error("Error closing the connection pool:", err);
    } else {
      console.log("Connection pool closed.");
    }
  });
}

// Close the connection pool when the application is exiting
process.on("exit", () => {
  closePool();
});

// Optionally, also handle termination signals like SIGINT and SIGTERM
process.on("SIGINT", () => {
  closePool();
  process.exit(0);
});

process.on("SIGTERM", () => {
  closePool();
  process.exit(0);
});

export { pool, closePool };
