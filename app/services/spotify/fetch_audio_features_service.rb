module Spotify
  class FetchAudioFeaturesService
    def initialize
      client_id = ENV.fetch('CLIENT_ID', nil)
      client_secret = ENV.fetch('CLIENT_SECRET', nil)

      RSpotify.authenticate(
        client_id,
        client_secret
      )
    end

    # cf. https://python-muda.com/python/spotify-api-ep-2/
    # #<RSpotify::AudioFeatures:0x00007f4618cb0790
    #   @acousticness=0.0113,
    #   @analysis_url="https://api.spotify.com/v1/audio-analysis/4A4qxXQZwv2rUl7lmkl4Lw",
    #   @danceability=0.335,
    #   @duration_ms=142893,
    #   @energy=0.436,
    #   @external_urls=nil,
    #   @href=nil,
    #   @id="4A4qxXQZwv2rUl7lmkl4Lw",
    #   @instrumentalness=0.127,
    #   @key=1,
    #   @liveness=0.262,
    #   @loudness=-16.57,
    #   @mode=1,
    #   @speechiness=0.084,
    #   @tempo=119.035,
    #   @time_signature=3,
    #   @track_href="https://api.spotify.com/v1/tracks/4A4qxXQZwv2rUl7lmkl4Lw",
    #   @type="audio_features",
    #   @uri="spotify:track:4A4qxXQZwv2rUl7lmkl4Lw",
    #   @valence=0.342>
    def execute(track_id)
      # TODO: Bulk で取得する方法がある？
      Spotify::FetchTracksService.new.execute(track_id).audio_features
    end
  end
end
