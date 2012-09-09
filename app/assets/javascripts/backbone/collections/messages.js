var Messages = Backbone.Collection.extend({
  model: Message,
  
  url: function() {
    return '/rooms/' + $('.room-id').data('room-id') + '/messages';
  },

  save: function() {
    _.each(this.models, function(message) {
      if (message.isNew()) {
        message.save();
      }
    });
  }
});