//
//  DetailViewController.swift
//  Project1
//
//  Created by Murat Baykor on 20.06.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = UIImageView()
    var selectedImage: String?
    
    
    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    

}
