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
    private let searchController = UISearchController(searchResultsController: nil)
    // MARK: - properties
    let ombdService = OmdbService()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        activityIndicator.startAnimating()
    }
    // MARK: - Function
    func setNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        searchController.delegate = self
    }
    // MARK: - Actions

}

extension MainViewController: UISearchControllerDelegate {
    
}

