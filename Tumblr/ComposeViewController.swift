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
        // TODO all icons animate at once, update so they animate one at a time, with a slight delay
        for button in buttons {
            UIView.animate(withDuration: 0.3, animations: { 
                button.transform = CGAffineTransform.identity
            })
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // move buttons back off the screen as the view disappears
        for button in buttons {
            UIView.animate(withDuration: 0.3, animations: { 
                button.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height - button.frame.origin.y)

            })
        }
    }

    @IBAction func didPressDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
