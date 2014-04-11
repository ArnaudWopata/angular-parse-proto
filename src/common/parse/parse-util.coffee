angular.module('parse.util', [])
.factory('ParseUtil', ($q)->

  class ParseUtil

    # Add getter / setters for all listed attributes.
    # This allow avoiding using .get('attrName')
    @prepareModel: (model, attributes = [])->
      attributes.forEach (attribute)->
        Object.defineProperty model.prototype, attribute, {
          get: -> return this.get attribute
          set: (aValue)-> this.set attribute, aValue
        }

    # Wrap a parse query into an angular promise
    @wrapQuery: (model, queryBuilder)->
      query = new Parse.Query model
      queryBuilder && queryBuilder(query)
      $q.when query.find()
)
