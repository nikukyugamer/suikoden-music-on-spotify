module Spotify
  class FetchArtistService
    def initialize
      client_id = ENV.fetch('CLIENT_ID', nil)
      client_secret = ENV.fetch('CLIENT_SECRET', nil)

      RSpotify.authenticate(
        client_id,
        client_secret
      )
    end

    # #<RSpotify::Artist:0x00007fdda8654f68
    # @external_urls={"spotify"=>"https://open.spotify.com/artist/6RG3jUoSKsNyZwN1LGZvgB"},
    # @followers={"href"=>nil, "total"=>566},
    # @genres=[],
    # @href="https://api.spotify.com/v1/artists/6RG3jUoSKsNyZwN1LGZvgB",
    # @id="6RG3jUoSKsNyZwN1LGZvgB",
    # @images=
    # [{"height"=>640, "url"=>"https://i.scdn.co/image/ab67616d0000b273be583ca657ab9054cfbe44d7", "width"=>640},
    #   {"height"=>300, "url"=>"https://i.scdn.co/image/ab67616d00001e02be583ca657ab9054cfbe44d7", "width"=>300},
    #   {"height"=>64, "url"=>"https://i.scdn.co/image/ab67616d00004851be583ca657ab9054cfbe44d7", "width"=>64}],
    # @name="幻想水滸伝音楽チーム",
    # @popularity=8,
    # @top_tracks={},
    # @type="artist",
    # @uri="spotify:artist:6RG3jUoSKsNyZwN1LGZvgB">

    # popularity: https://community.spotify.com/t5/Content-Questions/Artist-popularity/td-p/4415259
    # トラックの人気度は0から100の間の値で、100が最も人気です。
    # 人気度はアルゴリズムによって計算され、ほとんどの場合、トラックの総再生回数と、それらの再生がどのくらい新しいかに基づいています。
    def execute(artist_name)
      RSpotify::Artist.find(artist_name_to_artist_id[artist_name])
    end

    private

    def artist_name_to_artist_id
      {
        'コナミ矩形波倶楽部' => '1TYnZ36ebN5zEe1mGjTng0',
        '幻想水滸伝音楽チーム' => '6RG3jUoSKsNyZwN1LGZvgB',
        '幻想水滸伝ティアクライス音楽チーム' => '1ZrqfNH4qzjjY3yYqDsL2L',
        '幻想水滸伝サウンドチーム' => '0I2lhUQ5NcvhSLm5MYNR3C'
      }
    end
  end
end
