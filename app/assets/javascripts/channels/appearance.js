App.appearance = App.cable.subscriptions.create({
  channel:'AppearanceChannel'
 }, {
  received: function(data) {
    var user = JSON.parse(data)
    if (user.online === true){
      var element = document.getElementById("user_" + user.id);
        element.innerHTML = user.name + "：オンライン(js)"
    };
    if (user.online === false){
      var element = document.getElementById("user_" + user.id);
        element.innerHTML = user.name + "：オフライン(js)"
    };
  }
});
