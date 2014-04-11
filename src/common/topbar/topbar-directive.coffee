angular.module('topbar', ['ngBoilerplate.current-user'])

.directive('topbar', ()->
  templateUrl: 'topbar/topbar-directive.tpl.html'
  restrict: 'E'
  replace: true
  controller: class TopbarCtrl
    constructor: (@$scope, @CurrentUser)->
      @$scope.user = @CurrentUser.user
      @$scope.showPlaceholderTitle = @showPlaceholderTitle
      @$scope.showNav = @showNav

    showPlaceholderTitle: ()=>
      ! @CurrentUser.isLogged()

    showNav: ()=>
      @CurrentUser.isLogged()


)
