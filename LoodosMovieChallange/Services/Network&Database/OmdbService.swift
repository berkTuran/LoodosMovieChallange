//
//  OmdbService.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 2/1/21.
//

import Foundation
import ObjectMapper

class OmdbService: NetworkService {
    // MARK: - UI Elements
    let apiKey = UserDefaults.standard.value(forKey: RemoteConfigKey.omdb_apiKey.rawValue) as? String
    // MARK: - properties
    var baseUrlString = "http://www.omdbapi.com/?t=&apikey=7c8e43c"
    var urlSessionSharedInstance = URLSession.shared
    // MARK: - Life Cycle
    override init() {
        
    }
    // MARK: - Function
    func getMovie(_ title: String, completionHandler: @escaping (_ movie: Movie?, _ error: Error?) -> Void){
        let trimmedTitle = title.replacingOccurrences(of: " ", with: "+", options:.literal, range: nil)
        var requestUrlString = baseUrlString
        let requiredIndex = baseUrlString.index(baseUrlString.startIndex, offsetBy: 26)
        requestUrlString.insert(contentsOf: trimmedTitle, at: requiredIndex)
        let requestURL = URL(string: requestUrlString)
        let dataTask = urlSessionSharedInstance.dataTask(with: requestURL!) { (data, response, error) in
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    let movie = Movie(JSON: json)
                    completionHandler(movie!, nil)
                }
            } catch let JsonSerializationError as NSError {
                completionHandler(nil, JsonSerializationError)
            }
        }
        dataTask.resume()
    }
    // MARK: - Actions
}
