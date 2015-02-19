
$(document).ready(function() {
});


function getEvents() {
  $.get('/events', function(response) {

    var json_version = JSON.parse(response);

    json_version.forEach(function(object) {
      appendAllEvents(object);
    });
  });
}

function appendAllEvents(json) {
  $('.all-events-container').append("<div id ='"+json.event.id+"'></div>");
  $("#"+json.event.id).append("<h2><a class='event-title' href='#' onclick='return false;'>"+json.event.title+"</a></h2>");
  $("#"+json.event.id).append("<span>"+json.votes.length+"</span>");
  $("#"+json.event.id).append("<span>"+json.manager.username+"</span>");
  $("#"+json.event.id).append("<span>"+json.event.date+"Febuary, 14 2015"+"</span>");
  setupEventLinks();
}




function setupEventLinks() {
  $(".event-title").on("click", function(){
    var that = this
    $.ajax({
      url: '/event_options',
      type: 'GET',
      dataType: 'json',
      data: {id: $(that).parents("div")[0].id},
    })
    .done(function(response) {
      response.forEach(function(object){
        debugger
        appendEventOptions(object);
      })
    })
    .fail(function() {
      console.log("error");
    })
  })
}

function appendEventOptions(json){
  // $("#"+json.option.event_id).append("<a href="#" onclick ='return false' id = /vote' class="vote-button">""<img src ="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-5/24/navigate-up-icon.png">"
}









