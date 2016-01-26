function filterTag(control) {
    var current = $(this);
    var tag = control.value;
    var events = gon.events;
    var tlColor = "#F2C66D";

    if (tag == "none"){
      var filtered_events = events;
    } else {
      var filtered_events = _.filter (events, function(eventz) {
        return eventz.team_tag == tag;
      });
    }

    if (tag == "dev") {
      tlColor = "#A80874";
    } else if (tag == "test") {
      tlColor = "#B7FDFE";
    } else if (tag == "qa") {
      tlColor = "#2B9720";
    } else if (tag == "release") {
      tlColor = "#AB3A1A";
    } else if (tag == "rd") {
      tlColor = "#779B71";
    }

    var myNode = document.getElementById("timelineNonDate");
    var myNode2 = document.getElementById("expand-event");

    while (myNode.firstChild) {
      myNode.removeChild(myNode.firstChild);
    }

    while (myNode2.firstChild) {
      myNode2.removeChild(myNode2.firstChild);
    }

    TimeKnots.draw("#timelineNonDate", filtered_events,  {color: tlColor, width:1000, showLabels: true});
}
