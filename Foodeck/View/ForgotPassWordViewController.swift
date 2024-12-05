//
//  ForgotPassWordViewController.swift
//  Foodeck
//
//  Created by Nguyen Le on 5/9/24.
//

import UIKit

class ForgotPassWordViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fogot PassWord"
        custumView()
//        emailTextField.delegate = self
        [emailTextField].forEach { textField in
                    textField?.delegate = self
                    textField?.isEnabled = true
    }

    }
    
    @IBAction func ConfirmHome(_ sender: Any) {
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func custumView()
    {
        viewEmail.layer.cornerRadius = 15
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.systemGray2.cgColor
        viewEmail.layer.masksToBounds = true
        viewEmail.backgroundColor = .white
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let pinkColor = UIColor(red: 233/255, green: 46/255, blue: 142/255, alpha: 1)
        
        if textField == emailTextField {
            viewEmail.layer.borderColor = pinkColor.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            viewEmail.layer.borderColor = UIColor.systemGray2.cgColor
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    

    
   
}
