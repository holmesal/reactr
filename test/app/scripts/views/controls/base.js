// Generated by CoffeeScript 1.6.2
(function() {
  define(['jquery', 'underscore', 'backbone', 'handlebars', 'hammer', 'text!templates/control.html'], function($, _, Backbone, handlebars, hammer, ControlTemplate) {
    var BaseView;

    BaseView = Backbone.View.extend({
      className: 'control-container animated fadeIn',
      template: handlebars.compile(ControlTemplate),
      events: {
        'tap .shrink-icon-container': 'shrink'
      },
      log: function(words) {
        return console.log(words);
      },
      initialize: function() {
        var _this = this;

        hammer(this.el).on('tap', function(e) {
          if (_this.tap) {
            _this.tap(e);
          }
          if (!_this.options.controllerView.fullscreen) {
            _this.grow();
          }
          return false;
        });
        hammer(this.el).on('swiperight', function(e) {
          if (_this.swiperight) {
            _this.swiperight(e);
          }
          return false;
        });
        hammer(this.el).on('swipeleft', function(e) {
          if (_this.swipeleft) {
            _this.swipeleft(e);
          }
          return false;
        });
        hammer(this.el).on('pinch', function(e) {
          e.gesture.stopDetect();
          return _this.shrink();
        });
        if (this.setup) {
          return this.setup();
        }
      },
      setSize: function() {
        var idx, loc;

        console.error(this.$el.index());
        this.start = {
          width: this.$el.parent().width() / 2,
          height: this.$el.parent().height() / 2
        };
        this.start.font = this.start.height / 10;
        if (this.start.font < 30) {
          this.start.font = 30;
        }
        idx = this.$el.index();
        loc = (function() {
          switch (idx) {
            case 0:
              return loc = {
                top: 2,
                left: 2
              };
            case 1:
              return loc = {
                top: 2,
                left: this.$el.parent().width() / 2
              };
            case 2:
              return loc = {
                top: this.$el.parent().height() / 2,
                left: 2
              };
            case 3:
              return loc = {
                top: this.$el.parent().height() / 2,
                left: this.$el.parent().width() / 2
              };
          }
        }).call(this);
        this.start.top = loc.top;
        this.start.left = loc.left;
        return this.$el.css({
          position: 'absolute',
          top: this.start.top,
          left: this.start.left,
          width: this.start.width,
          height: this.start.height,
          fontSize: this.start.font
        });
      },
      freeze: function() {
        this.$el.addClass('active');
        return this.options.controllerView.fullscreen = true;
      },
      thaw: function() {
        this.$el.removeClass('active');
        return this.options.controllerView.fullscreen = false;
      },
      grow: function() {
        this.freeze();
        this.$el.animate({
          top: 0,
          left: 0,
          width: this.$el.parent().width(),
          height: this.$el.parent().height(),
          fontSize: this.start.font * 1.5
        }, {
          duration: 200
        });
        return this.$el.find('.show-fullscreen').animate({
          opacity: 1
        }, 400);
      },
      shrink: function() {
        var _this = this;

        this.log('shrink called!');
        this.$el.animate({
          top: this.start.top,
          left: this.start.left,
          width: this.start.width,
          height: this.start.height,
          fontSize: this.start.font
        }, {
          duration: 200,
          complete: function() {
            _this.thaw();
            return _this.log('thaw called!');
          }
        });
        return this.$el.find('.show-fullscreen').animate({
          opacity: 0
        }, 200);
      },
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        this.$el.addClass(this.model.get('type'));
        return this.$el;
      }
    });
    return BaseView;
  });

}).call(this);
