//
//  OTPViewController.swift
//  Foodeck
//
//  Created by Nguyen Le on 5/9/24.
//

import UIKit

class OTPViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var stackOTP: UIStackView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "OTP"
        setupView()
        
        [textField1,textField2,textField3,textField4].forEach{textField in
            textField?.delegate = self
            textField?.isEnabled = true
        }
    }
    func setupView(){
        setupFieldView(view: view1)
        setupFieldView(view: view2)
        setupFieldView(view: view3)
        setupFieldView(view: view4)

    }
    
    func setupFieldView(view: UIView){
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray2.cgColor
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func buttonConfirmForgotPassWord(_ sender: Any) {
        let vc = ForgotPassWordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
}
