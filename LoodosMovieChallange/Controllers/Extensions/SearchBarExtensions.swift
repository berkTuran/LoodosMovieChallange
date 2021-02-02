//
//  SearchBarExtensions.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 2/2/21.
//

import Foundation
import UIKit

extension MainViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {

    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.activityIndicator.startAnimating()
        self.ombdService.getMovie(searchBar.text!) { (movie, error) in
            DispatchQueue.main.async {
                if movie?.Title == nil {
                    let alert = self.alertFactory.createAlert(type: .movie_not_found)
                    self.activityIndicator.stopAnimating()
                    self.present(alert, animated: true, completion: nil)
                }else {
                    self.activityIndicator.stopAnimating()
                    self.movies.append(movie!)
                    self.searchController.dismiss(animated: true) {
                        self.tableView.isHidden = false
                        self.activityIndicator.stopAnimating()
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
