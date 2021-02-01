//
//  ViewController.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 1/31/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var internetConnectionControlLabel: UILabel!
    
    // MARK: - properties
    var networkService = NetworkService()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if networkService.isConnectedToNetwork() {
            internetConnectionControlLabel.text = "Network is Connected"
        }else {
            internetConnectionControlLabel.text = "No Connection"
        }
    }
    // MARK: - Function
    
    // MARK: - Actions


}

