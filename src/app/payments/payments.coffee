angular.module( 'ngBoilerplate.payments', [
  'ui.router.state'
  'ui.bootstrap'
  'parse.models.payments'
])

.config( ( $stateProvider )->
  $stateProvider.state 'payments',
    url: '/payments',
    views:
      main:
        controller: 'PaymentsCtrl',
        templateUrl: 'payments/payments.tpl.html'
    data:
      pageTitle: 'Payments'
      restricted: true
)

.controller( 'PaymentsCtrl',
  class PaymentsCtrl
    constructor: ( @$scope, @Payments ) ->
      @loadPayments()

    loadPayments: ()->
      @Payments.query().then (payments)=>
        @$scope.payments = payments
)
