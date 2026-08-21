//
//  TimeCounter.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 21.08.2026.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: <#T##TimeInterval#>,
            target: <#T##Any#>,
            selector: <#T##Selector#>,
            userInfo: <#T##Any?#>,
            repeats: <#T##Bool#>
        )
    }
}
