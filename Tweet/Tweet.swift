//
//  Tweet.swift
//  Tweet
//
//  Created by Gordon RASS-KWASI on 6/6/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import Foundation

class Tweet: CustomStringConvertible {
    let name: String
    let text: String
    var description: String {
        return "Name : \(name), Text: \(text)"
    }
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    
}
