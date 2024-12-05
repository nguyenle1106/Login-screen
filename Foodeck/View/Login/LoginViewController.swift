//
//  LoginViewController.swift
//  Foodeck
//
//  Created by Nguyen Le on 29/8/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var StackViewButoon: UIStackView!
    @IBOutlet weak var btLoginviaGoogle: UIButton!
    @IBOutlet weak var btLoginviaFacebook: UIButton!
    @IBOutlet weak var btLoginviaApple: UIButton!
    @IBOutlet weak var btLoginviaEmail: UIButton!
    @IBOutlet weak var btCreateAccount: UIStackView!
    
    @IBOutlet weak var labeLinkClick: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Thiết lập hành động cho nút "Login via Email"
        clickLoginViaEmail()
        
        // Thiết lập liên kết có thể nhấp vào trong UITextView
        setupTextViewWithLink()
    }
    
    func clickLoginViaEmail() {
        view.addSubview(StackViewButoon)
        
        btLoginviaEmail.addTarget(self, action: #selector(clickLogoinEmail), for: .touchUpInside)
    }

    @objc func clickLogoinEmail(_ sender: Any?) {
        let vc = LoginviaEmailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func CreateAnAccount(_ sender: Any) {
        let vc = CreateAnAccountViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setupTextViewWithLink() {
        // Đoạn văn bản với link
        let text = "By signing up, you are agreeing to our Terms & Conditions"
        let attributedString = NSMutableAttributedString(string: text)
        
        // Đặt phạm vi cho "Terms & Conditions"
        var termsRange = (text as NSString).range(of: "Terms & Conditions")
        
        // Thêm thuộc tính liên kết
        attributedString.addAttribute(.link, value: "https://www.example.com/terms", range: termsRange)
        
        // Thiết lập thuộc tính cho UITextView
        labeLinkClick.attributedText = attributedString
        labeLinkClick.font = UIFont.systemFont(ofSize: 14)
        labeLinkClick.textColor = .gray
        labeLinkClick.textAlignment = .left
        labeLinkClick.isEditable = false // Không cho phép chỉnh sửa, ngăn bàn phím hiện lên
        labeLinkClick.isScrollEnabled = false
        labeLinkClick.backgroundColor = .clear
        
        // Thiết lập xử lý link
        labeLinkClick.delegate = self
        labeLinkClick.isSelectable = true
        labeLinkClick.isUserInteractionEnabled = true
        labeLinkClick.linkTextAttributes = [
            .foregroundColor: UIColor(red: 233/255, green: 46/255, blue: 142/255, alpha: 1.0),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
}

// MARK: - UITextViewDelegate

extension LoginViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        // Xử lý khi người dùng nhấn vào liên kết "Terms & Conditions"
        if URL.absoluteString == "https://www.example.com/terms" {
            // Mở liên kết trong trình duyệt hoặc điều hướng đến màn hình khác
            print("Terms & Conditions link clicked")
        }
        return true
    }
}

