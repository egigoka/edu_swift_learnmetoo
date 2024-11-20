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
    
    // MARK: - Ovverride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        countAnswers()
    }
    
    // MARK: - Private Methods
    private func countAnswers() {
        var results: [AnimalType: Int] = [:]
        let animals = answersChosen.map { $0.type }
        for animal in animals {
            if let animalCount = results[animal] {
                results.updateValue(animalCount + 1, forKey: animal)
            } else {
                results[animal] = 1
            }
        }
        let sortedResults = results.sorted { $0.value > $1.value }
        guard let mostFrequent = sortedResults.first?.key else { return }
        
        updateUI(with: mostFrequent)
    }
    
    private func updateUI(with animal: AnimalType) {
        animalEmojiLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}
