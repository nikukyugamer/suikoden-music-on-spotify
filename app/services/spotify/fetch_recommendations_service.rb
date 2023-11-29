module Spotify
  class FetchRecommendationsService
    def initialize
      client_id = ENV.fetch('CLIENT_ID', nil)
      client_secret = ENV.fetch('CLIENT_SECRET', nil)

      RSpotify.authenticate(
        client_id,
        client_secret
      )
    end

    def execute_based_on_tracks(track_ids)
      RSpotify::Recommendations.generate(seed_tracks: track_ids)
    end

    def execute_based_on_artists(artist_ids)
      RSpotify::Recommendations.generate(seed_artists: artist_ids)
    end
  end
end
