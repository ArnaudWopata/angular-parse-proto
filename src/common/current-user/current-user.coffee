angular.module('ngBoilerplate.current-user', [
  'parse.user'
]).service('CurrentUser',
  class CurrentUser
    constructor: (@ParseUser, @$rootScope)->
      @user =  new @ParseUser()
      @$rootScope.currentuser = @user

    signIn: ()->
      @user.login()

    signUp: ()->
      @user.signup()

    logOut: ()->
      @user.logout()

    isLogged:()->
      @user is @ParseUser.current()
)
