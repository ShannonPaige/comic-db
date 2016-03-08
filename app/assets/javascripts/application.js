// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  findConnectionButton();
});

var dataset = {
  data: {
    nodes: [
      { id: "0", name: "Wolverine"},
      { id: "1", name: "Spiderman"},
      { id: "3", name: "Mary Jane"}
    ],
    edges: [
      { source: "1", target: "0", value: "friends"},
      { source: "1", target: "3", value: "friends"}
    ]
  }
}


function findConnectionButton() {
  $('#find-connection').on("click", function(event){
    event.preventDefault();
    $('.graph').removeClass('hide')

    var div_id = "cy";

    var network_json = {
      dataSchema: {
          nodes: [
            { name: "label", type: "string" },
          ],
          edges: [ { name: "label", type: "string" },
          ]
      },
      data: {
        nodes: [
          { id: "0", label: "Wolverine"},
          { id: "1", label: "Spiderman"},
          { id: "3", label: "Mary Jane"}
        ],
        edges: [
          { source: "1", target: "0", label: "friends"},
          { source: "1", target: "3", label: "friends"}
        ]
      }
    };

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

  }); //onclick function
} // findConnection function
