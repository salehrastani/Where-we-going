
$(document).ready(function() {

$.get('/path/to/file', function(data) {
  debugger;

  $('.all-events-container').append('')

/});












  $("#event-title").on("click", function(event){
    event.preventDefault();
    var that = this;

    var options = $.ajax({
      console.log(this)
      url: that.attr("href")+ '/options',
      dataType: 'json',
      type: 'get'
    });

    options.done(function(data){
      $('#article'+).append(data);
    });
  });
});
