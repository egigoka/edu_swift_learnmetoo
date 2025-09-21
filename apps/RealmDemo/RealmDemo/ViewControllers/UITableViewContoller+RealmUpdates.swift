//
//  UITableViewContoller+RealmUpdates.swift
//  RealmDemo
//
//  Created by egigoka on 14.09.2025.
//

import UIKit
import RealmSwift

extension UITableViewController {
    
//    func updateTableView<T: Object>(with changes: RealmCollectionChange<Results<T>>, inSection section: Int) {
//
//        switch changes {
//        case .initial:
//            tableView.reloadData()
//        case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
//            print("performing update on section: \(section) with \(insertions.count) insertions, \(modifications.count) modifications, and \(deletions.count) deletions") // debug
//            tableView.performBatchUpdates {
//                tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: section)}, with: .automatic)
//                tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: section) }, with: .automatic)
//                tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: section)}, with: .automatic)
//            }
//        case .error(let error):
//            fatalError("Realm notifications error: \(error)")
//        }
//    }
    
    private var pendingChanges: [(section: Int, deletions: [Int], insertions: [Int], modifications: [Int])]
    private var pendingWorkItem: DispatchWorkItem?

    private func handleChanges<T: Object>(_ changes: RealmCollectionChange<Results<T>>, section: Int) {
        switch changes {
        case .initial:
            tableView.reloadData()
        case .update(_, let deletions, let insertions, let modifications):
            pendingChanges.append((section, deletions, insertions, modifications))
            
            // debounce to next runloop
            pendingWorkItem?.cancel()
            let workItem = DispatchWorkItem { [weak self] in self?.applyChanges() }
            pendingWorkItem = workItem
            DispatchQueue.main.async(execute: workItem)
        case .error(let error):
            print("Realm error: \(error)")
        }
    }

    private func applyChanges() {
        guard !pendingChanges.isEmpty else { return }

        tableView.performBatchUpdates {
            for change in pendingChanges {
                let s = change.section
                tableView.deleteRows(at: change.deletions.map { IndexPath(row: $0, section: s) }, with: .automatic)
                tableView.insertRows(at: change.insertions.map { IndexPath(row: $0, section: s) }, with: .automatic)
                tableView.reloadRows(at: change.modifications.map { IndexPath(row: $0, section: s) }, with: .automatic)
            }
        }
        
        pendingChanges.removeAll()
    }
    
}
