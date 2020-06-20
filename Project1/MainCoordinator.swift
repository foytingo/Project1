//
//  MainCoordinator.swift
//  Project1
//
//  Created by Murat Baykor on 20.06.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator {
    
    var navigationController = UINavigationController()
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = storyboard.instantiateInitialViewController() as? ViewController else {
            fatalError("Missing intial view controller in Main.storyboard.")
        }
        viewController.pictureSelectAction = { [weak self] in
            self?.showDetail(for: $0)
        }
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showDetail(for filename: String) {
        let vc = DetailViewController()
        vc.selectedImage = filename
        navigationController.pushViewController(vc, animated: true)
    }
}
