//
//  ViewController.swift
//  CustomNavigation
//
//  Created by Adam Lovastyik on 07/05/2019.
//  Copyright © 2019 xelion.nl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var customLevel = 1
    
    static func controller(title: String, level: Int) -> ViewController {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        controller.customLevel = level
        controller.title = title
        
        return controller
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = title ?? "View controller at level \(customLevel)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        titleLabel.text = title ?? "No title"
    }
    
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        
        let controller = ViewController.controller(title: "Title at level \(customLevel + 1)", level: customLevel + 1)
        navigationController?.pushViewController(controller, animated: true)
    }

}
