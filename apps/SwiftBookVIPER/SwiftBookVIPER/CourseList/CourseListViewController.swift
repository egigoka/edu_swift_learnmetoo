//
//  ViewController.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 22.09.2026.
//

import UIKit

protocol CourseListViewInputProtocol: AnyObject {
    func display(_ courses: [Course])
}

protocol CourseListViewOutputProtocol: AnyObject {
    init(view: CourseListViewInputProtocol)
    func viewDidLoad()
}

class CourseListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CourseListViewOutputProtocol!
    
    private let configurator: CourseListConfiguratorProtocol = CourseListConfigurator()
    private var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        tableView.rowHeight = 100
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! CourseDetailsViewController
        detailVC.course = sender as? Course
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}

// MARK: - UITableViewDataSource
extension CourseListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseTableViewCell
        let course = courses[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let course = courses[indexPath.row]
        performSegue(withIdentifier: "ShowDetails", sender: course)
    }
}

extension CourseListViewController: CourseListViewInputProtocol {
    func display(_ courses: [Course]) {
        self.courses = courses
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
