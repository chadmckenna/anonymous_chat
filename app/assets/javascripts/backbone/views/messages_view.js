var MessagesView = Backbone.View.extend({
  initialize: function() {
    _(this).bindAll();
    this._messages = [];
    this._scroll = false;

    this.collection.each(this.add);

    this.collection.bind('add', this.add);
    this.collection.bind('reset', this.fetchRender);
    this.collection.bind('add', this.scrollToBottom);
  },

  add: function(message) {
    var mv = new MessageView({ model: message });
    this._messages.push(mv);

    if (this._rendered) {
      $(this.el).append(mv.render().el);
    }
  },

  fetchRender: function() {
    var div = $('#messages');

    if ((div.prop("scrollHeight") - div.prop("scrollTop") - div.height()) < 150) {
      this._scroll = true;
    } else {
      this._scroll = false;
    }

    $(this.el).empty();
    
    this.collection.each(this.add);

    if (this._scroll) {
      this.scrollToBottom();
    }
  },

  scrollToBottom: function() {
    var div = $('#messages')
    div.animate({ scrollTop: div.prop("scrollHeight") - div.height() }, 500);
  },

  render: function() {
    this._rendered = true;

    $(this.el).empty();

    _(this._messages).each(function(mv) {
      this.$('#messages').append(mv.render().el);
    });

    return this;
  }
});