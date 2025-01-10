resource "spotify_playlist" "HollywoodTF" {
  name = "HollywoodTF"
  tracks = ["6ayKgleoMF26lvU1Z7wVm7"]
}

# First, search for Ariana Grande's tracks
data "spotify_search_track" "ariana_grande" {
  artist = "Ariana Grande"
  limit  = 10
}

# Then, create a playlist with those tracks
resource "spotify_playlist" "ariana_grande" {
  name = "My Ariana Grande Playlist using Terraform"

  tracks = data.spotify_search_track.ariana_grande.tracks[*].id
}
