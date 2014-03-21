{View} = require 'atom'

module.exports =
class PolymerSnippetsView extends View
  @content: ->
    @div class: 'polymer-snippets overlay from-top', =>
      @div "The PolymerSnippets package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "polymer-snippets:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "PolymerSnippetsView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
