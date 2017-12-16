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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let selectedMeme = memes[indexPath.row]
        cell.imageView?.image = selectedMeme.memedImage
        cell.textLabel?.text = "\(selectedMeme.topText)...\(selectedMeme.bottomText)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailVC.meme = self.memes[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
    
    
}
