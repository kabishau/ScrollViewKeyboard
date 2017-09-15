//
//  ViewController.swift
//  ScrollingForm
//
//  Created by user128830 on 9/13/17.
//  Copyright © 2017 user128830. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        registerForKeyboardNotifications()
    }
    
    // control on keyboard appearance
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: .UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(_ notification: NSNotification) {
        guard let info = notification.userInfo,
            let keyboardFrameValue = info[UIKeyboardFrameBeginUserInfoKey] as? NSValue else { return }
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        
    }
    
    func keyboardWillBeHidden(_ notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    




}

