$(document).ready(function() {
  $("#new_comment").submit(createComment);
});

function createComment(event) {
  event.preventDefault();

  postComment();
}

function commentData() {
  return {
    comment: {
      author: $("#comment_author").val(),
      body: $("#comment_body").val()
    }
  };
}

function postComment(){
  var id = $(this).data("id");

  // check if there are any comments
  //if there are, find the last comment and its id
  // the id of the new comment will be the id of the last one + 1


  $.post("/posts/" + id + "/comments", commentData(), function(data) {
    $(".comments").prepend(data);
    $("#new_comment").trigger('reset');
  });
}
