// regular drinks (un-fancy)
window.loadDrinks = function() {
  $.ajax({
      type: 'GET', 
      url: 'http://localhost:3000/drinks.json', 
      dataType: 'json'
  }).done(function(data) {
      
      // grabs the template we're going to use
      var source = $("#drink-template").html();

      // compiles it with Handlebars (pops content from drinks into drink-template)
      var template = Handlebars.compile(source);

      // displays compiled template with things in a div called content
      $('#drinks').html(template(data));
  })
};

// fancy drinks (SO fancy!)
window.loadFancyDrinks = function() {
  $.ajax({
      type: 'GET', 
      url: 'http://localhost:3000/drinks.json', 
      dataType: 'json'
  }).done(function(data) {
      
      // grabs the template we're going to use
      var source = $("#fancy-drink-template").html();

      // compiles it with Handlebars (pops content from drinks into drink-template)
      var template = Handlebars.compile(source);

      // displays compiled template with things in a div called content
      $('#fancy-drinks').html(template(data));
  })
};