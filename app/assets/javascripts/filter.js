$(document).ready(function () {

  var $posts = $('.post');

  $('#post_filter_title').on('change', function () {
    var currentTitle = this.value;
    $posts.filter(function (index, post) {
      $post = $(post);
      if ($post.data('title') === currentTitle) {
        $post.show();
      } else {
        $post.hide();
      }
    });
  });

  $('#post_filter_author').on('change', function () {
    var currentAuthor = this.value.toLowerCase();
    $posts.filter(function (index, post) {
      $post = $(post);
      if ($post.data('author') === currentAuthor) {
        $post.show();
      } else {
        $post.hide();
      }
    });
  });
});
