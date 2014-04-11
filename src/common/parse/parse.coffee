angular.module(
  'parse', []
)

.provider 'Parse', ()->
  this.js_key = "default_app_id"
  this.js_key = "default_jsk_key"

  this.$get = ->
    Parse.initialize this.app_id, this.js_key
    Parse

  this.config = (settings = {})->
    this.app_id = settings.app_id
    this.js_key = settings.js_key

  this
