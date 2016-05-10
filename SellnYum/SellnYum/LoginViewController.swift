//
//  LoginViewController.swift
//  SellnYum
//
//  Created by student5310 on 12/02/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit

protocol LoginDelegate: class {
    func logIn()
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate:LoginDelegate?
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
     
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    @IBAction func enter(sender: AnyObject) {
        
        
        if loginTextField.text != "" && passwordTextField.text != "" {
            delegate?.logIn()
        }
        
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
