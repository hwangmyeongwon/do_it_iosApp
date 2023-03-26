//
//  ViewController.swift
//  PageControl
//
//  Created by 황명원 on 2022/01/09.
//

import UIKit

var images=["1.jpeg","2.jpeg","3.jpeg","4.jpeg","5.jpeg","6.jpeg"]

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages=images.count
        
        pageControl.currentPage=0
        
        pageControl.pageIndicatorTintColor=UIColor.green
        
        pageControl.currentPageIndicatorTintColor=UIColor.red
        
        imgView.image=UIImage(named: images[0])
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image=UIImage(named: images[pageControl.currentPage])
    }
    
}

