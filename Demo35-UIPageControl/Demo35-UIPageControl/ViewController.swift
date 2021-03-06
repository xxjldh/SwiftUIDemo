//
//  ViewController.swift
//  Demo35-UIPageControl
//
//  Created by Prashant on 23/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // create swipe gesture
    let swipeGestureLeft = UISwipeGestureRecognizer()
    let swipeGestureRight = UISwipeGestureRecognizer()
    
    // outlet - page control
    @IBOutlet var myPageControl: UIPageControl!
    
    // current page number label
    @IBOutlet var currentPageLabel: UILabel!
    
    
    
    // MARK: - view functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set gesture direction
        self.swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.left
        self.swipeGestureRight.direction = UISwipeGestureRecognizerDirection.right
        
        // add gesture target
        self.swipeGestureLeft.addTarget(self, action: #selector(ViewController.handleSwipeLeft(_:)))
        self.swipeGestureRight.addTarget(self, action: #selector(ViewController.handleSwipeRight(_:)))
    
        // add gesture in to view
        self.view.addGestureRecognizer(self.swipeGestureLeft)
        self.view.addGestureRecognizer(self.swipeGestureRight)
        
        // set current page number label.
        self.setCurrentPageLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Utility function
    
    // increase page number on swift left
    func handleSwipeLeft(_ gesture: UISwipeGestureRecognizer){
        if self.myPageControl.currentPage < 9 {
            self.myPageControl.currentPage += 1
            self.setCurrentPageLabel()
        }
    }
    
    // reduce page number on swift right
    func handleSwipeRight(_ gesture: UISwipeGestureRecognizer){

        if self.myPageControl.currentPage != 0 {
            self.myPageControl.currentPage -= 1
            self.setCurrentPageLabel()
        }
        
        
    }
    
    // set current page number label
    fileprivate func setCurrentPageLabel(){
        self.currentPageLabel.text = "\(self.myPageControl.currentPage + 1)"
    }
 
    
}

