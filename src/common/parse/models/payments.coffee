angular.module( 'parse.models.payments', ['parse.models'])

.factory 'Payments', (ParseModel)->
  ParseModel.createModel 'Payment', [
    'amount'
  ]
