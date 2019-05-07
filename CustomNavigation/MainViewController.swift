//
//  MainViewController.swift
//  CustomNavigation
//
//  Created by Adam Lovastyik on 07/05/2019.
//  Copyright © 2019 xelion.nl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelToBackButton: NSLayoutConstraint!
    @IBOutlet weak var titleLabelToEdge: NSLayoutConstraint!
    
    private weak var customNavigationController: UINavigationController?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        updateTitle()
        toggleBackButton()
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        
        customNavigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        if let navController = segue.destination as? UINavigationController {
            
            customNavigationController = navController
            navController.delegate = self
            navController.isNavigationBarHidden = true
            
            toggleBackButton()
            updateTitle()
        }
    }
    
    // MARK: - Custom navigation
    
    private func toggleBackButton() {
        
        let hidden = customNavigationController?.viewControllers.count ?? 1 == 1
        
        if hidden {
            backButton.isHidden = true
            titleLabelToEdge.priority = .defaultHigh
            titleLabelToBackButton.priority = .defaultLow
        }
        else {
            backButton.isHidden = false
            titleLabelToEdge.priority = .defaultLow
            titleLabelToBackButton.priority = .defaultHigh
        }
    }
    
    private func updateTitle() {
        
        titleLabel.text = customNavigationController?.viewControllers.last?.title ?? "No title"
    }
    
    // MARK: - Navigation Controller Delegate
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        toggleBackButton()
        updateTitle()
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
}

