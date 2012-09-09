var MessageView = Backbone.View.extend({
  template: "<p class='muted'><span class='label {{#current_user}}label-success{{/current_user}}'>{{user_string}}</span> {{message}}</p>",

  render: function() {
    var template = Mustache.render(this.template, { 
        message: this.model.get('message'),
        user_string: this.model.get('user_string'),
        current_user: this.model.get('user_string') == $('.user-string').data('user-string')
      });
    this.el.innerHTML = template;

    return this;
  }
});