//
//  Track.swift
//  TrackListApp
//
//  Created by egigoka on 18.06.2025.
//

struct Track {
    let artist: String
    let song: String
    
    var track: String {
        "\(artist) - \(song)"
    }
}

extension Track {
    static func getTrackList() -> [Track] {
        [
            Track(artist: "Alberto Ruiz", song: "7 Elements (Original Mix)"),
            Track(artist: "Deve Wincent", song: "Red Eye (Original Mix)"),
            
            
        ]
    }
}
