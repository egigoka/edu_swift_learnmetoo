//
//  CoursesViewController.swift
//  Networking
//
//  Created by egigoka on 12.07.2025.
//

import UIKit

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
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.courses = try decoder.decode([Course].self, from: data)
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
}

