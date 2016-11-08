//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Michael Volovar on 11/6/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination
        
        fadeTransition = FadeTransition()
        fadeTransition.duration = 0.3
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        destinationViewController.transitioningDelegate = fadeTransition
    }

}
