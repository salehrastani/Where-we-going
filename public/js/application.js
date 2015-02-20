
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
  $('.all-events-container').append("<div id ='event"+json.event.id+"'></div>");
  $("#event"+json.event.id).append("<h2><a class='event-title' href='#' onclick='return false;'>"+json.event.title+"</a></h2>");
  $("#event"+json.event.id).append("<span>"+json.votes.length+"</span>");
  $("#event"+json.event.id).append("<span>"+json.manager.username+"</span>");
  $("#event"+json.event.id).append("<span>"+json.event.date+"Febuary, 14 2015"+"</span>");
  // setupEventLinks();
}




function setupEventLinks() {
  $(".all-events-container").on("click", 'a', function(){
    // debugger
    var that = this

    $.ajax({
      url: '/event_options',
      type: 'GET',
      dataType: 'json',
      data: {id: $(that).parents("div")[0].id},
    })
    .done(function(response) {

      response.forEach(function(object){
        appendEventOptions(object);
      })
    })
  })
}

function appendEventOptions(json){

$("#event"+json.option.event_id).append("<div id='option"+json.option.id+"'></div>")
$("#option"+json.option.id).append("<p><a href='#' onclick ='return false;' id='vote'"+json.option.id+"><img src ='http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-5/24/navigate-up-icon.png'></a><span>"+json.option.name+"</span>")
$("#option"+json.option.id).append("<span>"+json.votes.length+"</span>")
$("#option"+json.option.id).append("<span>"+json.option.location+"</span>")
}








