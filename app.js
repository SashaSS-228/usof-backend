const express = require("express");
const userRouter = require("./routes/user_routes.js");
const postRouter = require("./routes/post_routes.js");

const PORT = 8080;

const app = express();

app.use(express.json());
app.use("/api", userRouter);
app.use("/api", postRouter);

app.listen(PORT, () => {
  console.log(`listening on port ${PORT}`);
});
