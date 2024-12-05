import UIKit

class CreateAnAccountViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var setupStackViewNameEmailPhonePassword: UIStackView!

    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewPassword: UIView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create an account"
        //self.navigationItem.hidesBackButton = true
        setupView()

        // Thiết lập delegate cho các UITextField
//        nameTextField.delegate = self
//        emailTextField.delegate = self
//        phoneTextField.delegate = self
//        passwordTextField.delegate = self
        [emailTextField, passwordTextField,nameTextField,phoneTextField].forEach { textField in
                    textField?.delegate = self
                    textField?.isEnabled = true
    }
    }
    
    
    @IBAction func buttonBack(_ sender: Any) {
        //let vc = LoginviaEmailViewController()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func LoginHome(_ sender: Any) {
        let vc = OTPViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func LoginInsted(_ sender: Any) {
        let vc = LoginviaEmailViewController()
        self.navigationController?.pushViewController(vc,animated: true)
    }
    

    func setupView() {
        setupFieldView(view: viewEmail)
        setupFieldView(view: viewName)
        setupFieldView(view: viewPhone)
        setupFieldView(view: viewPassword)
    }
    
    func setupFieldView(view: UIView) {
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray2.cgColor
        view.layer.masksToBounds = true
        view.backgroundColor = .white
    }
    
    // Hiển thị bàn phím khi nhấn vào UITextField và ẩn bàn phím khi nhấn Enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //Ản bàn phím
        return true
    }
    
    // Ẩn bàn phím khi chạm ra ngoài UITextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // Kết thức chỉnh sửa và ẩn bàn phím
    }

    
    // Delegate method khi bắt đầu chỉnh sửa (focus)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let pinkColor = UIColor(red: 233/255, green: 46/255, blue: 142/255, alpha: 1)
        
        if textField == nameTextField {
            viewName.layer.borderColor = pinkColor.cgColor
        } else if textField == emailTextField {
            viewEmail.layer.borderColor = pinkColor.cgColor
        } else if textField == phoneTextField {
            viewPhone.layer.borderColor = pinkColor.cgColor
        } else if textField == passwordTextField {
            viewPassword.layer.borderColor = pinkColor.cgColor
        }
    }


    // Delegate method khi kết thúc chỉnh sửa (unfocus)
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            viewName.layer.borderColor = UIColor.systemGray2.cgColor
        } else if textField == emailTextField {
            viewEmail.layer.borderColor = UIColor.systemGray2.cgColor
        } else if textField == phoneTextField {
            viewPhone.layer.borderColor = UIColor.systemGray2.cgColor
        } else if textField == passwordTextField {
            viewPassword.layer.borderColor = UIColor.systemGray2.cgColor
        }
    }
    
    
    

   
}

