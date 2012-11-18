if require('isnode')
  module.exports = WebSocket = require('ws')
else
  EventEmitter = require('eemitterport').EventEmitter
  module.exports = WebSocket = class WebSocket extends EventEmitter
    constructor: (a) ->
      @ws = new window.WebSocket(a)

      @ws.onopen = (evt) =>
        @emit 'open'

      @ws.onclose = =>
        @emit 'close'

      @ws.onerror = (evt) =>
        @emit 'error', evt.data

      @ws.onmessage = (evt) =>
        @emit 'message', evt.data

    send: (arg) =>
      @ws.send(arg)

    close: =>
      @ws.close()