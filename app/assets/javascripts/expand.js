$(document).ready(function() {
  $(document).on('click', '.timeline-event', function(event){
    debugger;
    var para = document.createElement("p");
    var node = document.createTextNode("This is new");
    para.appendChild(node);

    var element = document.getElementById("timeline1");
    element.appendChild(para);
  })
});
