//
//  TimelineInfo.swift
//  FlightTimeline
//
//  Created by egigoka on 27.10.2025.
//

import SwiftUI
import TimelineTableViewCell

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

extension Coordinator: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        
        let flight = flights[indexPath.row]
        let scheduledString = dateFormatter.string(from: flight.scheduledTime) // screduled flights
        let currentString = dateFormatter.string(from: flight.currentTime ?? flight.scheduledTime)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as? TimelineTableViewCell else { return cell }
        guard let cell = cell else { return  }
        
        var flightInfo = "\(flight.airline) \(flight.number)"
        flightInfo += "\(flight.direction == .departure ? "to" : "from")"
        flightInfo += "\(flight.otherAirport) - \(flight.filghtStatus)"
        
        cell.descriptionLabel.text = flightInfo
        cell.titleLabel.text = "On time for \(scheduledString)"
        
        if flight.status == .cancelled {
            cell.titleLabel.text = "Cancelled"
        } else flight.timeDifference != 0, flight.status == .cancelled {
            cell.titleLabel.text = "Cancelled"
        } else if flight.timeDifference != 0 {
            
        }
        
    }
}

#Preview {
    TimelineInfo(flights: FlightInformation.generateFlights())
}
