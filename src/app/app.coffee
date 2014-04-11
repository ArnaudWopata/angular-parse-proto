angular.module( 'ngBoilerplate', [
  'templates-app'
  'templates-common'
  'ngBoilerplate.home'
  'ngBoilerplate.sign-in'
  'ngBoilerplate.current-user'
  'ngBoilerplate.payments'
  'ui.router.state'
  'ui.router'
  'parse'
  'topbar'
])

.config( ( $stateProvider, $urlRouterProvider, ParseProvider ) ->
  $urlRouterProvider.otherwise '/home'

  ParseProvider.config {
    app_id: 'gfdYTdiHjK7OeIJd5j02Y6ZTctd3wOBPXfgbJdpu'
    js_key: 'lafz1zyqOVuHxG4vU4shMw3vtQqi79QaJWBAS0Ok'
  }
)

.run( ( CurrentUser, $rootScope, $state ) ->
  $rootScope.$on '$stateChangeStart', (e, to) ->

    # Only filter restricted states
    return unless to.data.restricted

    unless CurrentUser.isLogged()
      e.preventDefault()
      $state.go 'sign-in'
)

.controller( 'AppCtrl', ( $scope, $location ) ->
  $scope.$on '$stateChangeSuccess', (
    event,
    toState,
    toParams,
    fromState,
    fromParams
  )->
    if ( angular.isDefined( toState.data.pageTitle ) )
      $scope.pageTitle = toState.data.pageTitle + ' | boddy MD'
)

