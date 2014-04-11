angular.module('parse.user', ['parse', 'parse.util'])
.factory 'ParseUser', (Parse, ParseUtil, $q)->

  classMethods = {}

  instanceMethods = {
    # Regular Parse.User.signUp wrapped in a $q promise
    signup: (foo)->
      $q.when this.signUp foo

    # Regular Parse.User.logIn wrapped in a $q promise
    login: (name, password)-> $q.when this.logIn name, password

    # Regular Parse.User.logOut wrapped in a $q promise
    logout: ()-> $q.when this.logOut()
  }

  attributes = [
    'username'
    'email'
    'password'
    'displayName'
  ]

  model = Parse.User.extend instanceMethods, classMethods

  ParseUtil.prepareModel model, attributes

  model


