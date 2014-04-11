angular.module( 'ngBoilerplate.sign-in', [
  'ui.router.state'
  'ui.bootstrap'
  'ngBoilerplate.current-user'
])

.config( ( $stateProvider )->
  $stateProvider.state 'sign-in',
    url: '/signin'
    views:
      main:
        controller: 'SignInCtrl',
        templateUrl: 'sign-in/sign-in.tpl.html'
    data:
      pageTitle: 'Sign In'
)

.controller( 'SignInCtrl',
  class SignInCtrl
    constructor:(@$scope, @CurrentUser, @$state)->
      @$scope.user = @CurrentUser.user
      @$scope.signIn = @signIn

    signIn: ()=>
      @$scope.status = "pending"
      @$scope.error = null

      @CurrentUser.signIn().then (user)=>
        @$scope.status = "success"
        @$scope.error = null
        @$state.go('home')
      , (error)=>
        @$scope.status = "error"
        @$scope.error = error

)
