//
//  MainViewController.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 2/1/21.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    // MARK: - properties
    let ombdService = OmdbService()
    let notificationCenter = NotificationCenter.default
    let alertFactory = AlertFactory()
    var movies = [Movie]()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isHidden = true
        setupSearchController()
        setupNavigationBar()
        
    }
    // MARK: - Function
    func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
    }
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.delegate = self
        searchController.searchBar.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMovieDetailSegue" {
            let viewController = segue.destination as? MovieDetailViewController
            viewController!.movie = movies[tableView.indexPathForSelectedRow!.row]
        }
    }
    // MARK: - Actions

}

