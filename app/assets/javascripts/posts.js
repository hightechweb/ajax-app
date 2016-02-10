var init_post_lookup;

init_post_lookup = function() {
  $('#post-lookup-form').on('ajax:success', function(event, data, status) {
    $('#post-lookup').replaceWith(data);
    init_post_lookup();
  })
}

$(document).ready(function() {
  init_post_lookup();
})