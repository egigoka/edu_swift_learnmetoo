//
//  TimelineInfo.swift
//  FlightTimeline
//
//  Created by egigoka2kz on 27.08.2026.
//

import SwiftUI
import TimelineTableViewCell

struct TimelineInfo: UIViewControllerRepresentable {
    
    let flights: [FlightInformation]
    
    func makeUIViewController(context: Context) -> UITableViewController {
        UITableViewController()
    }
    
    func updateUIViewController(
        _ uiViewController: UITableViewController,
        context: Context
    ) {
        let bundle = Bundle(for: TimelineTableViewCell.self)
        guard let nibUrl = bundle.url(
            forResource: "TimelineTableViewCell_TimelineTableViewCell",
            withExtension: "bundle"
        ), let nibBundle = Bundle(url: nibUrl) else { return }
        let timelineTableViewCell = UINib(
            nibName: "TimelineTableViewCell",
            bundle: nibBundle
        )
        
        uiViewController.tableView.register(
            timelineTableViewCell,
            forCellReuseIdentifier: "TimelineTableViewCell"
        )
    }
    
    func makeCoordinator() -> () {
        return Coordinator(flights: flights)
    }
    
    //typealias UIViewControllerType = UITableViewController
}

class Coordinator: NSObject {
    let flights: [FlightInformation]
    
    init(flights: [FlightInformation]) {
        self.flights = flights
    }
}

#Preview {
    TimelineInfo(flights: FlightInformation.generateFlights())
}
