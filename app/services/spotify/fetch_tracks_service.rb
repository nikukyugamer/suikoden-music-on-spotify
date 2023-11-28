module Spotify
  class FetchTracksService
    def initialize
      client_id = ENV.fetch('CLIENT_ID', nil)
      client_secret = ENV.fetch('CLIENT_SECRET', nil)

      RSpotify.authenticate(
        client_id,
        client_secret
      )
    end

    # @available_markets=["JP"],
    # @context_type=nil,
    # @disc_number=2,
    # @duration_ms=142893,
    # @explicit=false,
    # @external_ids={"isrc"=>"JPM201801839"},
    # @external_urls={"spotify"=>"https://open.spotify.com/track/4A4qxXQZwv2rUl7lmkl4Lw"},
    # @href="https://api.spotify.com/v1/tracks/4A4qxXQZwv2rUl7lmkl4Lw",
    # @id="4A4qxXQZwv2rUl7lmkl4Lw",
    # @is_playable=nil,
    # @linked_from=nil,
    # @name="第7章「最後の戦い」 ~最強の敵(ボス敵BGM)",
    # @played_at=nil,
    # @popularity=1,
    # @preview_url="https://p.scdn.co/mp3-preview/47e2740433154158210ad6031c3f34732296d1f2?cid=2cd620d784d247ac9def2fbe55de1ad1",
    # @track_number=20,
    # @type="track",
    # @uri="spotify:track:4A4qxXQZwv2rUl7lmkl4Lw">
    # 単数でも配列でも大丈夫
    def execute(track_ids)
      RSpotify::Track.find(track_ids)
    end
  end
end
