//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Michael Volovar on 11/6/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttons = [textButton, photoButton, quoteButton, linkButton, chatButton, videoButton]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // set positions of icons to initial, "hidden" state
        for button in buttons {
            button.transform = CGAffineTransform(translationX: 0, y: view.frame.height - button.frame.origin.y)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // animate icons into final position
        // TODO there has to be a better way to do this, some sort of recursion?
        animateComposeIconUp(button: self.photoButton)
        
        delay(0.08, closure: {
            self.animateComposeIconUp(button: self.quoteButton)
        })
        
        delay(0.16, closure: {
            self.animateComposeIconUp(button: self.chatButton)
        })
        
        
        delay(0.24, closure: {
            self.animateComposeIconUp(button: self.textButton)
        })
        
        
        delay(0.32, closure: {
            self.animateComposeIconUp(button: self.linkButton)
        })
        
        delay(0.4, closure: {
            self.animateComposeIconUp(button: self.videoButton)
        })
    }

    @IBAction func didPressDismiss(_ sender: UIButton) {
        animateComposeIconDown(button: self.videoButton)
        
        delay(0.04, closure: {
            self.animateComposeIconDown(button: self.linkButton)
        })
        
        delay(0.08, closure: {
            self.animateComposeIconDown(button: self.textButton)
        })
        
        
        delay(0.12, closure: {
            self.animateComposeIconDown(button: self.chatButton)
        })
        
        
        delay(0.16, closure: {
            self.animateComposeIconDown(button: self.quoteButton)
        })
        
        delay(0.2, closure: {
            self.animateComposeIconDown(button: self.photoButton)
            
            // wait to dismiss until all the icons have animated out of view
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    func animateComposeIconUp(button: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
            button.transform = CGAffineTransform.identity
        })
    }
    
    func animateComposeIconDown(button: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
            button.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height - button.frame.origin.y)
        })
    }
}
