//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by egigoka on 30.10.2024.
//

import UIKit

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
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        countAnswers()
        updateUI()
    }
    
    // MARK: - Private Methods
    private func countAnswers() {
        var results: [String: Int] = [:]
        var maxValue = 0
        for answer in answersChosen {
            let animal = "\(answer.type)"
            if results.keys.contains(animal) {
                results.updateValue((results[animal] ?? 0) + 1, forKey: animal)
            } else {
                results[animal] = 1
            }
            
            if results[animal] ?? 0 >= maxValue {
                maxValue = results[animal] ?? 0
                result = answer.type
            }
        }
    }
    
    private func updateUI() {
        if let result = result {
            animalEmojiLabel.text = "Вы - \(result.rawValue)"
            descriptionLabel.text = result.definition
        }
    }
}
