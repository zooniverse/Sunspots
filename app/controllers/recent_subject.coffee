module.exports = App.RecentSubjectController = Ember.ObjectController.extend
  actions:
    toggleFavorite: ->
      if @get('model.isFavorited')
        zooniverse.api.delete "/projects/sunspot/favorites/#{ @get('model.favorite_id') }"
        @set 'model.favorited', false
        @set 'model.favorite_id', null
      else
        params = favorite:
          subject_ids: [@get('model.id')]
          recent_id: @get('model.recent_id')
        
        zooniverse.api.post('/projects/sunspot/favorites', params).then (favorite) =>
          @set 'model.favorited', true
          @set 'model.favorite_id', favorite.id
    
    goToTalk: ->
      window.location = @get 'model.talkUrl'
    
    tweet: ->
      window.location = @get 'model.twitterUrl'
