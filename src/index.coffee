{extend} = require 'underscore'

defaultOptions =
  proto: HTMLElement.prototype

exports.reference = (ref) ->
  {type: 'reference', ref: ref}

exports.register = (elementName, viewClass, options) ->
  options = extend {}, defaultOptions, options

  proto = Object.create(options.proto)

  proto.viewClass = viewClass

  proto.readyCallback = ->
    options = {}
    for attribute in this.attributes
      options[attribute.name] = attribute.value
    options.el = this
    this.view = new viewClass(options)
    this.view.render()

  proto.insertedCallback = ->
    this.view.onEnterDOM?()

  proto.removedCallback = ->
    this.view.onLeaveDOM?()

  proto.attributeChangedCallback = (attrName) ->
    this.view.trigger "change:#{attrName}"

  document.register elementName,
    prototype: proto

class exports.View extends HTMLElement

  @registerAs: (name) ->
    document.register(name, prototype: this.prototype)

  readyCallback: ->
    this.el = this
    this.initialize?()
    this.render?()

  insertedCallback: ->
    this.onEnterDOM?()

  removedCallback: ->
    this.onLeaveDOM()
