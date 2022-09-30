const Router = require("express");
const postController = require("../controller/post_controller.js");

const router = new Router();

router.post("/post", postController.createPost);

router.get("/post", postController.getPosts);

// router.get("/post/:id", postController.getOnePost);

// router.put("/post", postController.updatePost);

// router.delete("/post/", postController.deletePost);

module.exports = router;
