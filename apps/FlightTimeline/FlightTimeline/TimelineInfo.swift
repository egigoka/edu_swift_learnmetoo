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
    
    func makeCoordinator() -> Coordinator {
        Coordinator(flights: flights)
    }
    
    //typealias UIViewControllerType = UITableViewController
}

extension Coordinator: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        
        let flight = flights[indexPath.row]
        let scheduledString = dateFormatter.string(from: flight.scheduledTime)
        let currentString = dateFormatter.string(from: flight.currentTime ?? flight.scheduledTime)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath)
        
        var flightInfo = "\(flight.airline) \(flight.number) "
        + "\(flight.direction == .departure ? "to" : "from") "
        + "\(flight.otherAirport) - \(flight.flightStatus)"
        
        cell.descriptionLabel.text = flightInfo
        cell.titleLabel.text = "On time for \(scheduledString)"
        
        if flight.status == .cancelled {
            cell.titleLabel.text = "Cancelled"
        } else if flight.timeDifference != 0, flight.status == cancelled {
            cell.titleLabel.text = "Cancelled"
        } else if flight.timeDifference != 0 {
            
        }
    }
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
