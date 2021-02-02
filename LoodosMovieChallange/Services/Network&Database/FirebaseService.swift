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
        Analytics.logEvent("movie_details_opened", parameters: [
            "ownerDevice": UIDevice.current.identifierForVendor!.uuidString as NSObject,
            "movieTitle": movie.Title! as NSObject,
            "movieActors": movie.Actors! as NSObject,
            "imbdRating": movie.imdbRating! as NSObject,
            "awards": movie.Awards! as NSObject
        ])
    }
    // MARK: - Actions
}
