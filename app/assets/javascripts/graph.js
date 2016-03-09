$(document).ready(function() {
  getDataButton();
});

function getDataButton() {
  $('#find-connection').on("click", function(event){
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
  var options = {
      swfPath: "/assets/CytoscapeWeb",
      flashInstallerPath: "/assets/playerProductInstall"
  };
  var vis = new org.cytoscapeweb.Visualization(div_id, options);
  var visual_style = {
    global: {
      backgroundColor: "#ffffff"
    },
    nodes: {
      shape: "CIRCLE",
      borderWidth: 2,
      borderColor: "#333333",
      size: {
          defaultValue: 60,
          continuousMapper: { attrName: "weight", minValue: 25, maxValue: 75 }
      },
      color: {
          discreteMapper: {
              attrName: "id",
              entries: [
                  { attrValue: 1, value: "#0B94B1" },
                  { attrValue: 2, value: "#9A0B0B" },
                  { attrValue: 3, value: "#dddd00" }
              ]
          }
      },
      labelHorizontalAnchor: "center",
      labelVerticalAnchor: "top"
    },
    edges: {
      width: 3,
      color: "#0B94B1"
    }
  };
  var draw_options = {
    network: network_json,
    visualStyle: visual_style,
    panZoomControlVisible: true
  };

  vis.draw(draw_options);
} // findConnection function