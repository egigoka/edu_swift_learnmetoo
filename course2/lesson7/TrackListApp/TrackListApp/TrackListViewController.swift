//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by egigoka on 18.06.2025.
//

import UIKit

class TrackListViewController: UITableViewController {

    var trackList = Track.getTrackList()
    
    // MARK: - Main View Controller methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}

// MARK: - Table view data source
extension TrackListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackName", for: indexPath)

        let track = trackList[indexPath.row]
        
        cell.textLabel?.text = track.song
        cell.detailTextLabel?.text = track.artist
        cell.imageView?.image = UIImage(named: "7elements")
        
        return cell
    }
}
