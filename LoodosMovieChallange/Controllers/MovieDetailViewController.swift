//
//  MovieDetailViewController.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 2/2/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieActorsLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var imdbRatingLabel: UILabel!
    @IBOutlet weak var awardLabel: UILabel!
    
    // MARK: - properties
    var movie = Movie(JSONString: "{}")
    let firebaseService = FirebaseService()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        firebaseService.createLogForMovieDetails(movie: self.movie!)
    }
    // MARK: - Function
    func setupView() {
        movieTitleLabel.text = movie?.Title
        movieActorsLabel.text = movie?.Actors
        movieDescriptionLabel.text = movie?.Plot
        imdbRatingLabel.text = movie?.imdbRating
        awardLabel.text = movie?.Awards
        let url = URL(string: (movie?.PosterUrlString)!)
        posterImageView.kf.setImage(with: url)
    }
    // MARK: - Actions

}
