//
//  TableViewExtension.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 2/2/21.
//

import Foundation
import UIKit
import Kingfisher
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let movieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        movieTableViewCell.imdbRateLabel.text = "IMDB Rate: \(String(describing: movie.imdbRating!))"
        movieTableViewCell.titleLabel.text = movie.Title
        return movieTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
    }
    
}
