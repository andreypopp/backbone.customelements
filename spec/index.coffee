$ = require 'jqueryify'
{View} = require 'backbone'
{register} = require '../lib/index'

class Pane extends View
  render: ->
    this.$el.html(this.options.text)

register 'pane', Pane
