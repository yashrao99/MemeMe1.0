//
//  tableVC.swift
//  Meme_ImagePractice
//
//  Created by Yash Rao on 12/13/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import Foundation

import UIKit

class tableVC: UITableViewController {
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell", for: indexPath)
        
        let meme = memes[indexPath.row]
        
        cell.textLabel?.text = meme.topText + "   " + meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
}
