//
//  RealmTableViewController
//  RealmDemo
//
//  Created by egigoka on 14.09.2025.
//

import UIKit
import RealmSwift

class RealmTableViewController : UITableViewController {
    
    private var pendingChanges: [(section: Int, deletions: [Int], insertions: [Int], modifications: [Int])] = []
    private var pendingWorkItem: DispatchWorkItem?
    
    func updateTableView<T: Object>(_ changes: RealmCollectionChange<Results<T>>, section: Int) {
        switch changes {
        case .initial:
            tableView.reloadData()
        case .update(_, let deletions, let insertions, let modifications):
            pendingChanges.append((section, deletions, insertions, modifications))
            
            pendingWorkItem?.cancel() // if there's more updates, collect all and then start
            let workItem = DispatchWorkItem { [weak self] in self?.applyChanges() }
            pendingWorkItem = workItem
            DispatchQueue.main.async(execute: workItem)
        case .error(let error):
            print("Realm error: \(error)")
        }
    }

    func applyChanges() {
        guard !pendingChanges.isEmpty else { return }

        tableView.performBatchUpdates {
            for change in pendingChanges {
                let section = change.section
                
                tableView.deleteRows(at: change.deletions.map { IndexPath(row: $0, section: section) }, with: .automatic)
                tableView.insertRows(at: change.insertions.map { IndexPath(row: $0, section: section) }, with: .automatic)
                tableView.reloadRows(at: change.modifications.map { IndexPath(row: $0, section: section) }, with: .automatic)
            }
        }
        
        pendingChanges.removeAll()
    }
    
}
