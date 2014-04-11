angular.module( 'ngBoilerplate.sign-up', [
  'ui.router.state'
  'ui.bootstrap'
  'parse.user'
])

.config( ( $stateProvider )->
  $stateProvider.state 'sign-up',
    url: '/signup',
    views:
      main:
        controller: 'SignUpCtrl',
        templateUrl: 'sign-up/sign-up.tpl.html'
    data:
      pageTitle: 'Sign Up'
)

.controller( 'SignUpCtrl',
  class SignUpCtrl
    constructor:( @$scope, @ParseUser ) ->
      @$scope.user = new @ParseUser()
      @$scope.signUp = @signUp

    signUp: (user)=>
      # user = new @ParseUser(user.username, user.email, user.password)
      user.signup().then (user)->
        console.log 'signed up !', user
)
