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
        tableView.rowHeight = 80
        navigationItem.leftBarButtonItem = editButtonItem
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trackDetailsVC = segue.destination as! TrackDetailsViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        trackDetailsVC.track = trackList[indexPath.row]
    }

}

// MARK: - Table view data source
extension TrackListViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackName",
                                                 for: indexPath)

        let track = trackList[indexPath.row]
        
        cell.textLabel?.text = track.song
        cell.textLabel?.font = cell.textLabel?.font.withSize(20)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = track.artist
        cell.detailTextLabel?.font = cell.detailTextLabel?.font.withSize(15)
        cell.detailTextLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage(named: track.track)
        
        return cell
    }
}

// MARK: - Table view delegate
extension TrackListViewController {
    
    override func tableView(
        _ tableView: UITableView,
        editingStyleForRowAt indexPath: IndexPath
    ) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(
        _ tableView: UITableView,
        shouldIndentWhileEditingRowAt indexPath: IndexPath
    ) -> Bool {
        false
    }
    
    override func tableView(
        _ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath
    ) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        print("\(currentTrack.track) moved to \(destinationIndexPath.row)")
        trackList.insert(currentTrack, at: destinationIndexPath.row)
    }
    
    /*
    override func tableView(_ tableView: UITableView,
     heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    } // defined in viewDidLoad
    */
}
