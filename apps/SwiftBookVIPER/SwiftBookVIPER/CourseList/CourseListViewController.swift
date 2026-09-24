//
//  ViewController.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 22.09.2026.
//

import UIKit

protocol CourseListViewInputProtocol: AnyObject {
    func reloadData(for section: CourseSection)
}

protocol CourseListViewOutputProtocol: AnyObject {
    init(view: CourseListViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class CourseListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CourseListViewOutputProtocol!
    
    private let configurator: CourseListConfiguratorProtocol = CourseListConfigurator()
    private var section: SectionRowsRepresentable = CourseSection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! CourseDetailsViewController
        let configurator: CourseDetailsConfiguratorProtocol = CourseDetailsConfigurator()
        configurator.configure(with: detailVC, and: sender as! Course)
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
        self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let courseCell = section.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: courseCell.cellIdentifier, for: indexPath) as! CourseTableViewCell
        cell.courseCell = courseCell
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(section.rows[indexPath.row].cellHeight)
    }
}

extension CourseListViewController: CourseListViewInputProtocol {
    func reloadData(for section: CourseSection) {
        self.section = section
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
