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

}
