//
//  APIController.swift
//  Tweet
//
//  Created by Gordon RASS-KWASI on 6/12/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import Foundation

class APIController {
    weak var delegate : APITwitterDelegate?
    let token : String
    
    init(delegate: APITwitterDelegate?, token: String) {
        self.delegate = delegate
        self.token = token
    }
    
    func request(search: String) {
        let query = search.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        if let url = URL(string: "https://api.twitter.com/1.1/search/tweets.json?q=\(query)&count=100&lang=fr&result_type=recent") {
            let request = NSMutableURLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
            request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with : request as URLRequest) { (data, response, error) in
                if let err = error {
                    print(err)
                    self.delegate?.GestionErreur(erreur: err as NSError)
                } else if let d = data {
                    do {
                        if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d, options: .mutableContainers) as? NSDictionary {
                            if let statuses =  dic["statuses"] as? [NSDictionary] {
                                 var post: [Tweet] = []
                                for posts in statuses {
                                    if let user = posts["users"] as? NSDictionary {
                                        if let name = user["name"] as? String {
                                            if let text = posts["text"] as? String {
                                                post.append(Tweet(name: name, text: text))
                                            }
                                        }
                                    }
                                }
                            }
                            print(dic)
                        }
                    } catch (let err) {
                        print(err)
                        self.delegate?.GestionErreur(erreur: err as NSError)
                    }
                }
            }
            
            task.resume()
        }

    }
}
