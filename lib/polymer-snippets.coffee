PolymerSnippetsView = require './polymer-snippets-view'

module.exports =
  polymerSnippetsView: null

  activate: (state) ->
    @polymerSnippetsView = new PolymerSnippetsView(state.polymerSnippetsViewState)

  deactivate: ->
    @polymerSnippetsView.destroy()

  serialize: ->
    polymerSnippetsViewState: @polymerSnippetsView.serialize()
