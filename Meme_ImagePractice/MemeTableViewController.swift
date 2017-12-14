//
//  MemeTableViewController.swift
//  Meme_ImagePractice
//
//  Created by Yash Rao on 12/13/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import Foundation

import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    let cellIdentifier = "MemeCell"
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(memes.count)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let selectedMeme = memes[indexPath.row]
        
        cell.imageView?.image = selectedMeme.memedImage
        cell.textLabel?.text = "\(selectedMeme.topText)...\(selectedMeme.bottomText)"
        
        return cell
    }
    
    
    
    
    
}
