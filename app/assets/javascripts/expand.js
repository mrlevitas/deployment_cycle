$(document).ready(function() {
  $(document).on('click', '.timeline-event', function(event){



    var request = $.ajax({
      method: "GET",
      url: "/api/v1/events/" + $(this).attr('id'),
    });





    request.success(function(response) {
      var myNode = document.getElementById("expand-event");
      var demo_flag =  myNode.getAttribute("name");


      while (myNode.firstChild) {
        myNode.removeChild(myNode.firstChild);
      }

      var url = document.URL.split("/");
      var timeline_id = url[url.length - 1];
      var id = response.event.id;
      var title = response.event.title;
      var description = response.event.description;
      var date_and_time = response.event.date_and_time;
      var completion = response.event.completed;

      var title_header = document.createElement("h1");
      var para1 = document.createElement("p");
      var para2 = document.createElement("p");
      var para3 = document.createElement("p");
      var para4 = document.createElement("p");
      var para5 = document.createElement("p");

      var desc_node = document.createTextNode(description);
      var complete_node = null;

      if (completion == true) {
        complete_node = document.createTextNode("Completed");
        para5.setAttribute("class", "green-completion");
        para5.appendChild(complete_node);
      }

      if (completion == false) {
        complete_node = document.createTextNode("To Do");
        para5.setAttribute("class", "red-completion");
        para5.appendChild(complete_node);
      }

      var title_node = document.createTextNode(title);
      title_header.appendChild(title_node);

      var datetime_format = d3.time.format("%m/%d/%Y %I:%M %p");
      var datetime_string = datetime_format(new Date(date_and_time));
      var datetime_node = document.createTextNode(datetime_string);

      var update_button = document.createElement("a");
      var update_text = document.createTextNode("update event");
      update_button.setAttribute('class','button tiny update-butt');


      var delete_button = document.createElement("a");
      var delete_text = document.createTextNode("delete event");
      delete_button.setAttribute('class','button tiny update-butt');

      if (demo_flag == "welcome") {
        update_button.setAttribute('href', '#')
        delete_button.setAttribute('href', '#')
      } else {
          update_button.setAttribute('href','/timelines/' + timeline_id + '/events/' + response.event.id + '/edit');
          delete_button.setAttribute('href','/timelines/' + timeline_id + '/events/' + response.event.id);
          delete_button.setAttribute('data-method','delete');
      }

      update_button.appendChild(update_text);
      delete_button.appendChild(delete_text);

      para1.appendChild(datetime_node);
      para2.appendChild(update_button);
      para3.appendChild(desc_node);
      para4.appendChild(delete_button);

      var post_it = document.createElement("div");
      post_it.setAttribute('class','post-it');

      post_it.appendChild(title_header);
      // post_it.appendChild(break_line);
      post_it.appendChild(para5);
      post_it.appendChild(para1);
      post_it.appendChild(para2);
      post_it.appendChild(para3);
      post_it.appendChild(para4);

      var element = document.getElementById("expand-event");
      element.appendChild(post_it);
    });

    request.fail(function(response) {
      flash_string = "Unable to display Event";
      var flash_message = $('#flash-div');
      flash_message.text(flash_string);
    });

  })
});
