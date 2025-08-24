//
//  CoursesViewController.swift
//  Networking
//
//  Created by egigoka on 12.07.2025.
//

import UIKit
import Alamofire

class CoursesViewController: UITableViewController {

    var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? CourseCell else { return cell }
        
        let course = courses[indexPath.row]
        
        cell.configure(with: course)
        
        return cell
    }
    
}

// MARK: - Networking
extension CoursesViewController {
    func fetchCourses() {
        //guard let url = URL(string: URLExamples.exampleTwo.rawValue) else { return }
        guard let url = URL(string: URLExamples.exampleFive.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                self.courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    print("    data reloaded")
                }
            } catch let error {
                print(error)
                print(String(data: data, encoding: .utf8) ?? "not decoded")
            }
        }.resume()
    }
    
    func alamofireGetButtonPressed() {
        AF.request(URLExamples.exampleTwo.rawValue)
            .validate()
            .responseJSON { [weak self] result in
                switch result.result {
                case .success(let value):
                    
                    self?.courses = Course.getCourses(from: value) ?? []
                    
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func alamofirePostButtonPressed() {
        let course = [
            "name": "Networking",
            "imageUrl": "https://swiftbook.org/system/uploads/course/image/640/promo_%D0%B8%D0%BA%D0%BE%D0%BD%D0%BA%D0%B0_1280%D1%85720.png",
            "numberOfLessons": "67",
            "numberOfTests": "10"
        ]
        
        //let headers = HTTPHeaders(["Content-Type": "application/json"])
        let headers: HTTPHeaders? = nil
        
        AF.request(
            URLExamples.postRequest.rawValue,
            method: .post,
            parameters: course,
            headers: headers
        )
        .validate()
//        .responseJSON(completionHandler: { data in
//            print(data)
//        })
        .responseDecodable(of: CourseStrings.self) { [weak self] data in
            switch data.result {
            case .success(let course):
                print(course)
                self?.courses.append(Course(from: course))
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

