var init_post_lookup;

init_post_lookup = function() {
  // Show Spinner
  $('#post-lookup-form').on('ajax:before', function(event, data, status){
    show_spinner();
  });
  // Hide Spinner
  $('#post-lookup-form').on('ajax:after', function(event, data, status){
    hide_spinner();
  });

  // AJAX POST SEARCH SUCCESS
  $('#post-lookup-form').on('ajax:success', function(event, data, status) {
    $('#post-lookup').replaceWith(data);
    $('#post').val('');
    init_post_lookup();
  });
  // AJAX POST SEARCH ERROR
  $('#post-lookup-form').on('ajax:error', function(event, xhr, status, error) {
    hide_spinner(); //hide spinner call
    $('#post-lookup-results').replaceWith(' ');
    $('#post-lookup-errors').replaceWith('<div class="alert alert-warning" role="alert" style="display: inline-block; width: 100%;"><strong>No Posts Found!</strong> Please try your search again.</div>');
  });
}

$(document).ready(function() {
  init_post_lookup();
})




