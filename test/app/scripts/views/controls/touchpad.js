// Generated by CoffeeScript 1.6.2
(function() {
  define(['jquery', 'underscore', 'backbone', 'handlebars', 'hammer', 'views/controls/base', 'text!templates/touchpadOverlay.html'], function($, _, Backbone, handlebars, hammer, BaseView, TouchpadOverlayTemplate) {
    var TouchpadView;

    TouchpadView = BaseView.extend({
      setup: function() {
        return this.model.set('description', 'Drag your finger or mouse around.');
      }
    });
    return TouchpadView;
  });

}).call(this);
