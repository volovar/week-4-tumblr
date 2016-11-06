//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Michael Volovar on 11/6/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController")
        accountViewController = storyboard.instantiateViewController(withIdentifier: "AccountViewController")
        trendingViewController = storyboard.instantiateViewController(withIdentifier: "TrendingViewController")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        // set initial view
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
    }

    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        let previousVC = viewControllers[previousIndex]
        
        // get new selected index and set the current view controller
        selectedIndex = sender.tag
        let vc = viewControllers[selectedIndex]
        
        // update selected states of previous button and current button
        buttons[previousIndex].isSelected = false
        sender.isSelected = true
        
        // remove previous view controller
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        // add new view controller and set it's size
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
}
