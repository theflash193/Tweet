//
//  APITwitterDelegate.swift
//  Tweet
//
//  Created by Gordon RASS-KWASI on 6/7/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import Foundation

protocol APITwitterDelegate: class {
    func GestionTweet(tweet: Tweet)
    func GestionErreur(erreur: NSError)
}
