var form = {
  init: function() {
    this.destination = $('#destination');
    this.address = $('#address');
    this.listen();
  },

  listen: function() {
    var self = this;
    $('.add-activity').on('click', function(e){
      e.preventDefault();
      if (self.invalid()) return false

      $('.search-results .activity-block').remove();
      queryResult.reset();
      $('div.new-plan, .create-plan').show();
      
      //Geocoder
      var newActivity = new Activity(self.data())
      newActivity.get_location_data();
      queryResult.add(newActivity);

      //Yelp
      var searchTerms = { destination: self.destination.val(), address: self.address.val() };
      $.post("/yelp", {query: searchTerms}).done(function(data){
        queryResult.load(data.results, self.isMeal());
      });

      self.reset();
    });
  },

  invalid: function() {
    $.each($('#destination, #address'), function(idx, input){
      if ($(input).val() == "") $(input).addClass("error");
    });
    return ($('#destination').val() == "") || ($('#address').val() == "");
  },

  data: function() {
    var mealBool = this.isMeal();
    return {destination: this.destination.val(), address: this.address.val(), meal: mealBool};
  },

  reset: function() {
    $('#destination, #address').val("");
    $('#destination').focus();
    $('input').removeClass('error');
  },

  isMeal: function() {
    return $('div.switch-on').length == 1;
  }
};
