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
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
            self.photoButton.transform = CGAffineTransform.identity
        })
        
        delay(0.08, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.quoteButton.transform = CGAffineTransform.identity
            })
        })
        
        delay(0.16, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.chatButton.transform = CGAffineTransform.identity
            })
        })
        
        
        delay(0.24, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.textButton.transform = CGAffineTransform.identity
            })
        })
        
        
        delay(0.32, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.linkButton.transform = CGAffineTransform.identity
            })
        })
        
        delay(0.4, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.videoButton.transform = CGAffineTransform.identity
            })
        })
    }

    @IBAction func didPressDismiss(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
            self.videoButton.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height - self.videoButton.frame.origin.y)
        })
        
        delay(0.04, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.linkButton.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height - self.linkButton.frame.origin.y)
            })
        })
        
        delay(0.08, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.textButton.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height - self.textButton.frame.origin.y)
            })
        })
        
        
        delay(0.12, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.chatButton.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height - self.chatButton.frame.origin.y)
            })
        })
        
        
        delay(0.16, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.quoteButton.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height - self.quoteButton.frame.origin.y)
            })
        })
        
        delay(0.2, closure: {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.photoButton.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height - self.photoButton.frame.origin.y)
            })
            
            // wait to dismiss until all the icons have animated out of view
            self.dismiss(animated: true, completion: nil)
        })
    }
}
