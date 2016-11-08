//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Michael Volovar on 11/6/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var loadingImageView: UIImageView!
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3]
        
        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
        
        loadingImageView = UIImageView(image: animatedImage)
        view.addSubview(loadingImageView)
        loadingImageView.center = view.center
        loadingImageView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadingImageView.isHidden = false
        scrollView.isHidden = true
        scrollView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        delay(1.8, closure: {
            self.loadingImageView.isHidden = true
            self.scrollView.isHidden = false
            
            UIView.animate(withDuration: 0.3, animations: { 
                self.scrollView.alpha = 1
            })
        })
    }
}
