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
    @IBOutlet weak var buttonSuperview: UIView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    var fadeTransition: FadeTransition!
    
    var explorePopupImageView: UIImageView!

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
        
        // set up explore popup
        explorePopupImageView = UIImageView(image: UIImage(named: "explore_popup"))
        view.addSubview(explorePopupImageView)
        explorePopupImageView.center = CGPoint(x: buttons[1].center.x, y: buttonSuperview.frame.origin.y - (explorePopupImageView.frame.height / 2))
        
        UIView.animate(withDuration: 1.3, delay: 0, options: [.autoreverse, .repeat, .curveEaseInOut], animations: {
            self.explorePopupImageView.center.y += 10
        }, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // setting a variable for the destination view controller
        let destinationViewController = segue.destination
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        fadeTransition = FadeTransition()
        
        destinationViewController.transitioningDelegate = fadeTransition
        
        fadeTransition.duration = 0.3
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
        
        // this could be moved?
        if selectedIndex == 1 {
            UIView.animate(withDuration: 0.2, animations: {
                self.explorePopupImageView.alpha = 0
            }, completion: { (Bool) in
                self.explorePopupImageView.isHidden = true
            })
        } else if explorePopupImageView != nil {
            explorePopupImageView.isHidden = false
            
            UIView.animate(withDuration: 0.2, animations: {
                self.explorePopupImageView.alpha = 1
            })
        }
    }
}
