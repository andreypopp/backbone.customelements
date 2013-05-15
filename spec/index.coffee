$ = require 'jqueryify'
Backbone = require 'backbone'
{register, View} = require '../lib/index'

class Pane extends Backbone.View
  render: ->
    this.$el.html(this.options.text)

register 'pane', Pane

class Tabs extends View
  @registerAs 'tabs'
