//
//  UIViewController+Ext.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func setDefaultToolbar(dismissTabBar: Selector?){
        let image = UIImage(named: "ic_back_white")?.withRenderingMode(.alwaysOriginal)
        let leftBarItem = UIBarButtonItem(image: image, style: .plain, target: self, action: dismissTabBar)
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.backgroundColor = UIColor.orange
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
    
   
    
    
    
    func showIconBar(imageOne : String, imageTwo: String) {
           let menuBarButtonItem = UIBarButtonItem(image: UIImage(named: "\(imageOne)"), style: .plain, target: self, action: #selector(openMenuController))
           let menuBarButtonItem2 = UIBarButtonItem(image: UIImage(named: "\(imageTwo)"), style: .plain, target: self, action: #selector(openMenuController))
           menuBarButtonItem.tintColor = UIColor.white
           menuBarButtonItem2.tintColor = UIColor.white
           navigationItem.rightBarButtonItems = [menuBarButtonItem, menuBarButtonItem2]
       }
       
    
    
    @objc func openMenuController(){}
}
