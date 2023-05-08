void main(List<String> args) {
  // User().postComment();
  // Moderator().postComment();
  // Moderator().deleteComment();
  // Publisher().publishArticle();
  // Publisher().postComment();
  Admin().deleteComment();
}

class User {
  void postComment() {
    print("Post Comment");
  }
}

class Moderator extends User {
  void deleteComment() {
    print("Comment deleted");
  }
}

class Publisher extends User with CanPublishArticle {}

class Admin extends Moderator with CanPublishArticle {}

mixin CanPublishArticle {
  void publishArticle() {
    print("Article published");
  }
}
