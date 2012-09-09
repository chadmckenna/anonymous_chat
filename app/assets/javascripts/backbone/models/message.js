var Message = Backbone.Model.extend({
  url: function() {
    return '/rooms/' + this.get('room_id') + "/messages";
  },

  initialize: function() { }
});