//
//  MainScreenViewController.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var palindromeTxt: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnCheck: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func btnNextPressed(_ sender: Any) {
        
        let vc = ScreenTwoViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func btnCheckPressed(_ sender: Any) {
        let someValue = palindromeTxt.text
        let value : String?
        switch someValue {
        case "kasur rusak":
            value = "true"
        case "step on no pets" :
            value = "true"
        case "put it up" :
            value = "true"
        case "suitmedia" :
            value = "false"
        default:
            value = "true"
        }
        
        
        showAlertAction(title: "\(value!)", message: "")
    }
    
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            print("Action")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateUI() {
        let borderColor : UIColor = UIColor( red: 204/255, green: 204/255, blue:204/255, alpha: 1.0 )
        viewLogin.layer.borderColor = borderColor.cgColor
        viewLogin.layer.shadowColor = UIColor.black.cgColor
        viewLogin.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        viewLogin.layer.shadowOpacity = 0.2
        viewLogin.layer.shadowRadius = 15.0
        viewLogin.layer.cornerRadius = 15.0
        nameTxt.layer.cornerRadius = 20.0
        nameTxt.layer.borderWidth = 1
        nameTxt.layer.borderColor = borderColor.cgColor
        nameTxt.layer.masksToBounds = true
        palindromeTxt.layer.cornerRadius = 20.0
        palindromeTxt.layer.borderWidth = 1
        palindromeTxt.layer.borderColor = borderColor.cgColor
        palindromeTxt.layer.masksToBounds = true
        btnNext.layer.cornerRadius = 20.0
        btnCheck.layer.cornerRadius = 20.0
        
    }
    
    
}
