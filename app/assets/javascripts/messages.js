var addMessage = function(sender, message) {
  var div = $("<div>");
  var message = sender + ": " + message;
  div.text(message);
  $("#message-list").append(div);
}

$("form.new_message").submit(function() {
  addMessage($("#user_name").text(), $("#message_content").val());
});
