//
//  ViewController.swift
//  Tweet
//
//  Created by Gordon RASS-KWASI on 6/6/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, APITwitterDelegate {

    @IBOutlet weak var tableView: UITableView!
    var Tweet: [Tweet]?
    var Api: APIController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        Api = APIController(delegate: self, token: getToken())

        Api?.request(search: "42")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweet = Tweet {
            return (tweet.count)
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        if let tweet = Tweet {
            cell?.textLabel?.text = tweet[indexPath.row].text
        }
        return cell!
    }
    
    func GestionTweet(tweet: [Tweet]) {
        self.Tweet = tweet
        self.tableView.reloadData()
        print("gestionTweet")
    }
    
    func GestionErreur(erreur: NSError) {
        print("gestionError")
    }
    
    
    func getToken() -> String {
        return "AAAAAAAAAAAAAAAAAAAAAABI0wAAAAAA9l2ehBRlwvi3UvV%2FskqYAJGEJ54%3DVt64NFVngs60EyI6WhhyQeV4qQWoWVFHj7j6dlRyRR410yfjyx"
    }
}

