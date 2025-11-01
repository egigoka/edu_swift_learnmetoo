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
        print("\n\n\ntest, date: \(Date())")
        let controller = UITableViewController()
        
//        let bundle = Bundle(for: TimelineTableViewCell.self)
//        let bundle = Bundle.main //debug
        let bundle = Bundle(for: TimelineTableViewCell.self)
        print("bundle: \(bundle)")
        DispatchQueue.main.async {
            
            if let nibUrl = bundle.url(forResource: "TimelineTableViewCell", withExtension: "bundle") {
                print("nibUrl \(nibUrl)")
            } else {
                print("no nib url")
            }
            //        let nibBundle = Bundle(url: nibUrl)
            //        let nib = UINib(nibName: "TimelineTableViewCell", bundle: nibBundle)
            //
            //        controller.tableView.register(nib, forCellReuseIdentifier: "TimelineTableViewCell")
            //
            //        controller.tableView.dataSource = context.coordinator
            
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UITableViewController,
                                context: Context) {
        print("\n uiViewController.tableView.dataSource \(String(describing: uiViewController.tableView.dataSource))")
        print("controller.tableView.dataSource is Coordinator \(uiViewController.tableView.dataSource is Coordinator)")
        
        
        if !(uiViewController.tableView.dataSource is Coordinator) {
            let bundle = Bundle(for: TimelineTableViewCell.self)
            
            if let nibUrl = bundle.url(forResource: "TimelineTableViewCell", withExtension: "bundle") {
                print("nib url: \(nibUrl)")
            } else {
                print("no nib url")
            }
            
//            let nibBundle = Bundle(url: nibUrl)!
//            let nib = UINib(nibName: "TimelineTableViewCell", bundle: nibBundle)
            
//            uiViewController.tableView.register(nib, forCellReuseIdentifier: "TimelineTableViewCell")
            
            uiViewController.tableView.dataSource = context.coordinator
        } else {
            uiViewController.tableView.reloadData()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(flights: flights)
    }
}

class Coordinator: NSObject {
    let flights: [FlightInformation]
    
    init(flights: [FlightInformation]) {
        self.flights = flights
    }
}

extension Coordinator: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flights.count
    }
    
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        UITableViewCell()
    //    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        
        let flight = flights[indexPath.row]
        let scheduledString = dateFormatter.string(from: flight.scheduledTime) // screduled flights
        let currentString = dateFormatter.string(from: flight.currentTime ?? flight.scheduledTime) // current flights
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath)
        guard let cell = cell as? TimelineTableViewCell else { return cell }
        
        var flightInfo = "\(flight.airline) \(flight.number) "
        flightInfo += "\(flight.direction == .departure ? "to" : "from")"
        flightInfo += " \(flight.otherAirport) - \(flight.flightStatus)"
        
        cell.descriptionLabel.text = flightInfo
        cell.titleLabel.text = "On Time for \(scheduledString)"
        
        if flight.status == .cancelled {
            cell.titleLabel.text = "Cancelled"
        } else if flight.timeDifference != 0, flight.status == .cancelled {
            cell.titleLabel.text = "Cancelled"
        } else if flight.timeDifference != 0 {
            cell.titleLabel.text = "\(scheduledString)  Now: \(currentString)"
        }
        
        cell.titleLabel.textColor = .black
        cell.bubbleColor = flight.timelineColor
        
        return cell
    }
}

#Preview {
    TimelineInfo(flights: FlightInformation.generateFlights())
}
