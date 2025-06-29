//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by egigoka on 30.10.2024.
//

import UIKit

class QuestionsViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.value = answerCount
        }
    }
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    // MARK: - Private Properties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultsVC = segue.destination as? ResultsViewController else {
            return
        }
        resultsVC.answersChosen = answersChosen
    }
    
    // MARK: - IB Actions
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {
            return
        }
        
        let currentAnswer = currentAnswers[currentIndex]
        
        answersChosen.append(currentAnswer)
     
        nextQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedActionButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
}

extension QuestionsViewController {
    private func updateUI() {
        // Hide stacks
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for question label
        questionLabel.text = currentQuestion.text
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for progressView
        progressView.setProgress(totalProgress, animated: true)
        
        // Set title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // Show current StackView
        showCurrentStackView(for: currentQuestion.type)
    }
    
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: currentAnswers)
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged: showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
        
        for multipleSwitch in multipleSwitches {
            multipleSwitch.isOn = false
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
        
        rangedSlider.value = 0.5
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
