//
//  OnboardingViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/19.
//

import UIKit

var images = ["onboard1.jpg","onboard2.jpg","onboard3.jpg","onboard4.jpg"]


class OnboardingViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var Login_apple: UIButton!
    
    @IBAction func pageChanged(_ sender: Any) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }

    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        imageView.image = UIImage(named: images[0])

        Login_apple.layer.borderWidth = 1
        Login_apple.layer.borderColor = UIColor.black.cgColor
        
    }
    


}
