//
//  ViewController.swift
//  Project1
//
//  Created by Murat Baykor on 20.06.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictureSelectAction: ((String) -> Void)?
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pictureSelectAction?(pictures[indexPath.row])
    }
}

