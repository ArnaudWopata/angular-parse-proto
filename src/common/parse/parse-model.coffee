angular.module('parse.models', ['parse', 'parse.util'])
.factory('ParseModel', (Parse, ParseUtil)->
  class ParseModel

    # Create a Parse model with attributes, instance and class methods
    @createModel: (
      modelName,
      attributes = [],
      instanceMethods = {},
      classMethods = {}
    ) ->

      angular.extend classMethods, {
        query: (queryBuilder)->
          ParseUtil.wrapQuery(this, queryBuilder)
      }

      # Create the parse model
      model = Parse.Object.extend modelName, instanceMethods, classMethods

      # Create attribute getter/setters
      ParseUtil.prepareModel model, attributes

      # Return the model
      model
)
