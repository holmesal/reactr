// Generated by CoffeeScript 1.6.2
(function() {
  define(['jquery', 'underscore', 'backbone'], function($, _, Backbone) {
    var ButtonModel;

    ButtonModel = Backbone.Model.extend({
      defaults: {
        prefix: 'button',
        icon: 'icon-power'
      },
      initialize: function() {
        return console.log('controller model init');
      }
    });
    return ButtonModel;
  });

}).call(this);
