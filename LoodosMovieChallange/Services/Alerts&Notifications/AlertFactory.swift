//
//  AlertFactory.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 2/1/21.
//

import Foundation
import UIKit
class AlertFactory {
    
    // MARK: - UI Elements
    
    // MARK: - properties
    let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: .none)
    let okayAlertAction = UIAlertAction(title: "Okay", style: .default, handler: .none)
    // MARK: - Life Cycle
    init() {
        
    }
    // MARK: - Function
    func createAlert(type: AlertType) -> UIAlertController {
        switch type {
        case AlertType.network:
            let alertController = UIAlertController(title: "No Network Connection", message: "There is a problem in your network. If you believe the problem has been resolved, please try again.", preferredStyle: .alert)
            alertController.addAction(cancelAlertAction)
            alertController.addAction(okayAlertAction)
            return alertController
        case AlertType.movie_not_found:
            let alertController = UIAlertController(title: "Movie not found", message: "There is no movie with this title. Please try again.", preferredStyle: .alert)
            alertController.addAction(cancelAlertAction)
            alertController.addAction(okayAlertAction)
            return alertController
        }
    }
    // MARK: - Actions
}
