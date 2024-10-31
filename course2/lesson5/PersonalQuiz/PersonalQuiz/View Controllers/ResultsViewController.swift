//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by egigoka on 30.10.2024.
//

import UIKit
// MARK: - Class/Struct Declaration
// MARK: - IB Outlets
// MARK: - Public Properties
// MARK: - Private Properties
// MARK: - Initializers
// MARK: - Lifecycle Methods
// MARK: - Deinitializer
// MARK: - Override Methods
// MARK: - Navigation
// MARK: - IB Actions
// MARK: - Public Methods
// MARK: - Private Methods
// MARK: - Error Handling
// MARK: - Protocol Conformance
// MARK: - Static Methods
// MARK: - Closures and Callbacks
class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animalEmojiLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    // MARK: - Public Properties
    var answersChosen: [Answer]!
    
    // MARK: - Private Properties
    private var result: AnimalType?
    
    // MARK: - Ovverride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(answersChosen.count)
        countAnswers()
        
    }
    
    // MARK: - Private Methods
    private func countAnswers() {
        var results: [String: Int] = [:]
        for answer in answersChosen {
            let animal = "\(answer.type)"
            if results.keys.contains(animal) {
                results.updateValue((results[animal] ?? 0) + 1, forKey: animal)
            } else {
                results[animal] = 1
            }
        }
    }
    
    private func updateUI() {
        
    }
}
