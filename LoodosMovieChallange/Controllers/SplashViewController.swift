//
//  ViewController.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 1/31/21.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var internetConnectionControlLabel: UILabel!
    @IBOutlet weak var remoteConfigResponseLabel: UILabel!
    
    // MARK: - properties
    let firebaseService = FirebaseService()
    let alertFactory = AlertFactory()
    var myTimer = Timer()
    var seconds = 3
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if firebaseService.isConnectedToNetwork() {
            internetConnectionControlLabel.text = "Network is Connected"
            remoteConfigResponseLabel.text = firebaseService.getConfigParameters()[RemoteConfigKey.loodos_text.rawValue] as? String
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.seconds -= 1
                if self.seconds == 0 {
                    timer.invalidate()
                    self.performSegue(withIdentifier: "goToMainSegue", sender: nil)
                }
            }
        }else {
            let alert = alertFactory.createAlert(type: .network)
            present(alert, animated: true, completion: nil)
        }
    }
    // MARK: - Function
    
    // MARK: - Actions


}

