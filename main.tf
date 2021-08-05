terraform {
  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
      version = "~> 0.2.0"
    }
  }
}

variable "spotify_api_key" {
  type = string
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "built_with_terraform" {
  name        = "Built With Terraform"
  description = "A playlist built using Terraform that is hosted in GitHub"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
  ]
}

data "spotify_search_track" "by_artist" {
  artists = ["Dolly Parton"]
   album = "Jolene"
   name  = "Early Morning Breeze"
}

output "tracks" {
  value = data.spotify_search_track.by_artist.tracks
}
