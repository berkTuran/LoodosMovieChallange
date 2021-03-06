//
//  FirebaseService.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 2/1/21.
//

import Foundation
import Firebase

class FirebaseService: NetworkService {
    // MARK: - UI Elements
    
    // MARK: - properties
    let remoteConfig = RemoteConfig.remoteConfig()
    let remoteConfigSettings = RemoteConfigSettings()
    let userDefaults = UserDefaults.standard
    let analytics = Analytics()
    // MARK: - Life Cycle
    override init() {
        remoteConfigSettings.minimumFetchInterval = 0
        remoteConfig.configSettings = remoteConfigSettings
    }
    // MARK: - Function
    func getConfigParameters() -> Dictionary<String, Any> {
        var parameters = Dictionary<String, Any>()
        if self.isConnectedToNetwork() {
            for key in RemoteConfigKey.allCases {
                let parameterByKey = remoteConfig.configValue(forKey: key.rawValue).stringValue ?? ""
                parameters.updateValue(parameterByKey, forKey: key.rawValue)
                userDefaults.setValue(parameterByKey, forKey: key.rawValue)
            }
        }
        return parameters
    }
    
    func createLogForMovieDetails(movie: Movie) {
        let parameters = [
            "ownerDevice": UIDevice.current.identifierForVendor!.uuidString,
            "movieTitle": movie.Title! ,
            "movieActors": movie.Actors! ,
            "imbdRating": movie.imdbRating! ,
            "awards": movie.Awards!
        ]
        Analytics.logEvent("movieDetailsOpened", parameters: parameters)
    }
    // MARK: - Actions
}
