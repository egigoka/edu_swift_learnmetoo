//
//  MainViewViewController.swift
//  Networking
//
//  Created by egigoka on 12.07.2025.
//

import UIKit

enum URLExamples: String {
    // 10.1.0.6 - beyond /mnt/btr/Videos/Education courses/Swift/Swift_learnmetoo.ru_Evgenij_Efimov/backup_resources
    case imageURL = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    case exampleOne = "http://10.1.0.6:9090/fixed/api_course"
    case exampleTwo = "http://10.1.0.6:9090/fixed/api_courses"
    case exampleThree = "http://10.1.0.6:9090/fixed/api_website_description"
    case exampleFour = "http://10.1.0.6:9090/fixed/api_missing_or_wrong_fields"
    case exampleFive = "http://10.1.0.6:9090/fixed/api_courses_capital"
    
    case postRequest = "https://jsonplaceholder.typicode.com/posts"
}

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
    
    case postRequest = "POST Request"
    case alamofireGet = "Alamofire GET"
    case alamofirePost = "Alamofire POST"
}

class MainViewController: UICollectionViewController {
    
    let userActions = UserActions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        URLCache.shared.removeAllCachedResponses()
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        guard let cell = cell as? UserActionCell else { return cell }
        
        let userAction = userActions[indexPath.item]
        cell.userActionLabel.text = userAction.rawValue
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage: performSegue(withIdentifier: "showImage", sender: nil)
        case .exampleOne: exampleOneButtonPressed()
        case .exampleTwo: exampleTwoButtonPressed()
        case .exampleThree: exampleThreeButtonPressed()
        case .exampleFour: exampleFourButtonPressed()
        case .ourCourses: performSegue(withIdentifier: "showCourses", sender: nil)
        case .postRequest: postRequest()
        case .alamofireGet: performSegue(withIdentifier: "alamofireGet", sender: nil)
        case .alamofirePost: performSegue(withIdentifier: "alamofirePost", sender: nil)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourses" {
            guard let coursesVC = segue.destination as? CoursesViewController else { return }
            coursesVC.fetchCourses()
        }
    }
    
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
}

// MARK: - Networking
extension MainViewController {
    private func exampleOneButtonPressed() {
        guard let url = URL(string: URLExamples.exampleOne.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course)
                DispatchQueue.main.async {
                    self.successAlert()
                }
            } catch let error {
                print(error)
                print(String(data: data, encoding: .utf8) ?? "not decoded")
                DispatchQueue.main.async {
                    self.failedAlert()
                }
            }
        }.resume()
    }
    
    private func exampleTwoButtonPressed() {
        guard let url = URL(string: URLExamples.exampleTwo.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                DispatchQueue.main.async {
                    self.successAlert()
                }
            } catch let error {
                print(error)
                print(String(data: data, encoding: .utf8) ?? "not decoded")
                DispatchQueue.main.async {
                    self.failedAlert()
                }
            }
        }.resume()
        
    }
    
    private func exampleThreeButtonPressed() {
        guard let url = URL(string: URLExamples.exampleThree.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription)
                DispatchQueue.main.async {
                    self.successAlert()
                }
            } catch let error {
                print(error)
                print(String(data: data, encoding: .utf8) ?? "not decoded")
                DispatchQueue.main.async {
                    self.failedAlert()
                }
            }
        }.resume()
        
    }
    
    private func exampleFourButtonPressed() {
        guard let url = URL(string: URLExamples.exampleFour.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription)
                DispatchQueue.main.async {
                    self.successAlert()
                }
            } catch let error {
                print(error)
                print(String(data: data, encoding: .utf8) ?? "not decoded")
                DispatchQueue.main.async {
                    self.failedAlert()
                }
            }
        }.resume()
    }
    
    private func postRequest() {
        guard let url = URL(string: URLExamples.postRequest.rawValue) else { return }
        let course = Course(
            name: "Networking",
            imageUrl: "https://swiftbook.org/system/uploads/course/image/640/promo_%D0%B8%D0%BA%D0%BE%D0%BD%D0%BA%D0%B0_1280%D1%85720.png",
            numberOfLessons: "67",
            numberOfTests: "10"
        )
        
        guard let courseData = try? JSONEncoder().encode(course) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = courseData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let response = response, let data = data else { return }
            
            print(response)
            
            do {
                print("---")
                print(String(data: data, encoding: .utf8) ?? "no data")
                print("---")
                let course = try JSONDecoder().decode(Course.self, from: data)
                DispatchQueue.main.async {
                    [weak self] in
                    self?.successAlert()
                }
                print(course)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
