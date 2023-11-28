module Spotify
  class FetchAlbumService
    def initialize
      client_id = ENV.fetch('CLIENT_ID', nil)
      client_secret = ENV.fetch('CLIENT_SECRET', nil)

      RSpotify.authenticate(
        client_id,
        client_secret
      )
    end

    # rubocop:disable Layout/LineLength
    # #<RSpotify::Album:0x00007f4618cffb60
    # @album_type="album",
    # @artists=
    # [#<RSpotify::Artist:0x00007f46187fb600
    #   @external_urls={"spotify"=>"https://open.spotify.com/artist/1TYnZ36ebN5zEe1mGjTng0"},
    #   @followers=nil,
    #   @genres=nil,
    #   @href="https://api.spotify.com/v1/artists/1TYnZ36ebN5zEe1mGjTng0",
    #   @id="1TYnZ36ebN5zEe1mGjTng0",
    #   @images=nil,
    #   @name="Konami Kukeiha Club",
    #   @popularity=nil,
    #   @top_tracks={},
    #   @type="artist",
    #   @uri="spotify:artist:1TYnZ36ebN5zEe1mGjTng0">],
    # @available_markets=["JP"],
    # @copyrights=[{"text"=>"2018 Konami Digital Entertainment", "type"=>"C"}, {"text"=>"2018 Konami Digital Entertainment", "type"=>"P"}],
    # @external_ids={"upc"=>"4580204264485"},
    # @external_urls={"spotify"=>"https://open.spotify.com/album/1DEfvfv6tr5O5HoM8oUaUp"},
    # @genres=[],
    # @href="https://api.spotify.com/v1/albums/1DEfvfv6tr5O5HoM8oUaUp",
    # @id="1DEfvfv6tr5O5HoM8oUaUp",
    # @images=
    # [{"height"=>640, "url"=>"https://i.scdn.co/image/ab67616d0000b273ec40289b4dff6d7ea2c4727e", "width"=>640},
    #   {"height"=>300, "url"=>"https://i.scdn.co/image/ab67616d00001e02ec40289b4dff6d7ea2c4727e", "width"=>300},
    #   {"height"=>64, "url"=>"https://i.scdn.co/image/ab67616d00004851ec40289b4dff6d7ea2c4727e", "width"=>64}],
    # @label="Konami Digital Entertainment",
    # @name="幻想水滸伝 ORIGINAL GAME SOUNDTRACK",
    # @popularity=11,
    # @release_date="2018-12-26",
    # @release_date_precision="day",
    # @total_tracks=58,
    # @type="album",
    # @uri="spotify:album:1DEfvfv6tr5O5HoM8oUaUp">
    # rubocop:enable Layout/LineLength
    def execute(album_name)
      RSpotify::Album.find(album_name_to_album_id[album_name])
    end

    private

    def album_name_to_album_id
      {
        '幻想水滸伝 ORIGINAL GAME SOUNDTRACK' => '1DEfvfv6tr5O5HoM8oUaUp',
        '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.1' => '5cCA9ErhDo9sjGR4y4CY47',
        '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.2' => '7JnTiFKhEujTKw3xbgeJ1j',
        '幻想水滸伝III ORIGINAL SOUNDTRACK SELECTION' => '5oRb2isLfFHAvOmfexy4mo',
        '幻想水滸伝IV ORIGINAL SOUNDTRACK SELECTION' => '5XaEep3FhwLYuLBGmonbju',
        '幻想水滸伝V ORIGINAL SOUNDTRACK SELECTION' => '2bZlVti3G35TXHANYliIUF',
        '幻想水滸伝ティアクライス ORIGINAL SOUNDTRACK' => '0CvxwMIrf6nWyTH0d7Syz1',
        '幻想水滸伝 紡がれし百年の時 オリジナルサウンドトラック' => '6lrUOdg6kX2ITMezqHVrTC'
      }
    end
  end
end
