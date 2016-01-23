$(document).ready(function() {
  $(document).on('click', '.timeline-event', function(event){

    var request = $.ajax({
      method: "GET",
      url: "/api/v1/events/" + $(this).attr('id'),
    });

    var myNode = document.getElementById("expand-event");
    while (myNode.firstChild) {
      myNode.removeChild(myNode.firstChild);
    }



    request.success(function(response) {
      var url = document.URL.split("/");
      var timeline_id = url[url.length - 1];
      var id = response.event.id;
      var title = response.event.title;
      var description = response.event.description;
      var title_header = document.createElement("h1");
      var para = document.createElement("p");
      var title_node = document.createTextNode(title);
      var desc_node = document.createTextNode(description);


      title_header.appendChild(title_node);
      para.appendChild(desc_node);

      var element = document.getElementById("expand-event");


      //Create an input type dynamically.
      var update_button = document.createElement("a");
      var delete_button = document.createElement("a");

      var update_text = document.createTextNode("update event");
      var delete_text = document.createTextNode("delete event");


      update_button.setAttribute('class','button tiny update-butt');
      update_button.setAttribute('name','update-button');
      update_button.setAttribute('href','/timelines/' + timeline_id + '/events/' + response.event.id + '/edit');
      // update_button.setAttribute('class','tiny update-butt');

      delete_button.setAttribute('class','button');
      delete_button.setAttribute('name','delete-button');
      delete_button.setAttribute('href','/timelines/' + timeline_id + '/events/' + response.event.id);
      delete_button.setAttribute('data-method','delete');
      // delete_button.setAttribute('class','tiny update-butt');

      update_button.appendChild(update_text);
      delete_button.appendChild(delete_text);

      para.appendChild(update_button);
      para.appendChild(delete_button);
      element.appendChild(title_header);
      element.appendChild(para);


    });

    request.fail(function(response) {
      flash_string = "Unable to display Event";
      flash_message.text(flash_string);
    });

  })
});
