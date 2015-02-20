
$(document).ready(function() {
});


function setupEvents() {
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
}


//---------------------------


function setupOptions() {
  $(".all-events-container").on("click", '.event-title', function(){
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
//debugger
$("#event"+json.option.event_id).append("<div id='option"+json.option.id+"'></div>")
$("#option"+json.option.id).append("<p><a href='#' onclick ='return false;' class='vote-button' id='vote"+json.option.id+"'><img src ='http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-5/24/navigate-up-icon.png'></a><span>"+json.option.name+"</span>")
$("#option"+json.option.id).append("<span class='votes-count'>"+json.votes.length+"</span>")
$("#option"+json.option.id).append("<span>"+json.option.location+"</span>")
}

//--------------------------------


function voteUp (){
  $(".all-events-container").on("click", '.vote-button', function(){
    var that = this


    $.ajax({
      url: '/voteup',
      type: 'put',
      dataType: 'json',
      data: {option_id: $(that).parents("div")[0].id, event_id: $(that).parents("div")[1].id},
    })
    .done(function(response) {
      $("#option"+response.option_id+" .votes-count").replaceWith(""+response.votes.length)
      // debugger
    })
  })
}


//-----------------------------


// function addEvent (){
//   $("#add-event").on("click", function (){
//     $.post('/event_new', function() {

//     });
//   })
// }




















