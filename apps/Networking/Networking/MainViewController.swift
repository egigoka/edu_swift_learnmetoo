//
//  MainViewViewController.swift
//  Networking
//
//  Created by egigoka on 12.07.2025.
//

import UIKit

enum URLExamples: String {
    case imageURL = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    case exampleOne = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    case exampleTwo = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    case exampleThree = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
    case examoleFour = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
}

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
}

class MainViewController: UICollectionViewController {
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    /*
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    */
    
    // MARK: - Private Methods
    
    private func successAlert() {
        let alert = UIAlertController(
            title: "Success",
            message: "You can see the results in the Debug area",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func failedAlert() {
        let alert = UIAlertController(
            title: "Failed",
            message: "You can see error in the Debug area",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // MARK: UICollectionViewDataSource

    
}

// MARK: - Networking
extension MainViewController {
    private func exampleOneButtonPressed() {
        
    }
    
    private func exampleTwoButtonPressed() {
        
    }
    
    private func exampleThreeButtonPressed() {
        
    }
    
    private func exampleFourButtonPressed() {
        
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
