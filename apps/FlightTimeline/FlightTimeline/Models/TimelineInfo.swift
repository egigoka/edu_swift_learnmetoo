//
//  TimelineInfo.swift
//  FlightTimeline
//
//  Created by egigoka on 27.10.2025.
//

import SwiftUI

struct TimelineInfo: UIViewControllerRepresentable {
    
    let flights: [FlightInformation]
    
    func makeUIViewController(context: Context) -> UITableViewController {
        UITableViewController()
    }
    
    func updateUIViewController(_ uiViewController: UITableViewController,
                                context: Context) {
        let timelineTableViewCell = UINib(
            nibName: "TimelineTableViewCell",
            bundle: nil
        )
        
        uiViewController.tableView.register(timelineTableViewCell, forHeaderFooterViewReuseIdentifier: "TimelineTableViewCell")
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(fligths: flights)
    }
}

class Coordinator: NSObject {
    let flights: [FlightInformation]
    
    init(fligths: [FlightInformation]) {
        self.flights = fligths
    }
}

class Coordinator: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.
    }
}

#Preview {
    TimelineInfo(flights: FlightInformation.generateFlights())
}
