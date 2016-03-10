$(document).ready(function() {
  getDataButton();
});

function getDataButton() {
  $('#find-connection').on("click", function(event){
    console.log("Button hit")
    event.preventDefault();
    var first_character_id  = $("#first_character_character_id option:selected").text();
    var second_character_id = $('#second_character_character_id option:selected').text()

    $.ajax({
      url: '/api/v1/connections',
      type: 'GET',
      data: { first_character: first_character_id, second_character: second_character_id },
      dataType: 'json',
      success: function(response){
        console.log('SUCCESS', response)
        renderGraph(response);
      }, error: function(xhr){
        console.log('FAIL', xhr)
      }
    })
  })
}

function renderGraph(json_data) {
  $('.graph').removeClass('hide')
  var div_id = "cy";
  var network_json = json_data
  // create an array with nodes
  var nodes = new vis.DataSet(json_data["nodes"]);
  // create an array with edges
  var edges = new vis.DataSet(json_data["edges"]);
  // create a network
  var container = document.getElementById(div_id);

  // provide the data in the vis format
  var data = {
     nodes: nodes,
     edges: edges
  };
  var options = {};

  // initialize your network!
  var network = new vis.Network(container, data, options);
} // findConnection function
