function createComment(event) {
  event.preventDefault();

  postComment();
}

function commentData() {
  return {
    comment: {
      author: $("#comment_author").val(),
      body: $("#idea_body").val()
    }
  };
}

function postComment(){
  $.post("/posts/:id", commentData(), function(data) {
    $(".comments").prepend(data);
    $("#new_comment").trigger('reset');
  });
}
