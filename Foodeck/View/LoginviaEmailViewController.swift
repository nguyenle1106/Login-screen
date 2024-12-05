import UIKit

class LoginviaEmailViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var TitleLable: UILabel!
    @IBOutlet weak var viewEmailAndPassword: UIStackView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login via email"
    
        setupViewEmailAndPassword()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.isEnabled = true
        passwordTextField.isEnabled = true
//        [emailTextField, passwordTextField].forEach { textField in
//                    textField?.delegate = self
//                    textField?.isEnabled = true
    }
    
     func clickBack(_ sender: Any) {
        let vc = LoginViewController()
        self.navigationController?.popViewController( animated: true)
    }
    
    func setupViewEmailAndPassword() {
        viewEmail.layer.cornerRadius = 15
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.systemGray2.cgColor
        viewEmail.layer.masksToBounds = true
        viewEmail.backgroundColor = .white
                
        viewPassword.layer.cornerRadius = 15
        viewPassword.layer.borderWidth = 1
        viewPassword.layer.borderColor = UIColor.systemGray2.cgColor
        viewPassword.layer.masksToBounds = true
        viewPassword.backgroundColor = .white
    }
    
    //hiển thị bàn phím khi nhấn vào UITextfied
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //hiển thị bàn phím ghi enter
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Màu bo viền khi nhấn vào email hoặc password
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let pinkColor = UIColor(red: 233/255, green: 46/255, blue: 142/255, alpha: 1)
        
        if textField == emailTextField {
            viewEmail.layer.borderColor = pinkColor.cgColor
        } else if textField == passwordTextField {
            viewPassword.layer.borderColor = pinkColor.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            viewEmail.layer.borderColor = UIColor.systemGray2.cgColor
        } else if textField == passwordTextField {
            viewPassword.layer.borderColor = UIColor.systemGray2.cgColor
        }
    }
    
    
    @IBAction func activeButtonLogin(_ sender: Any) {
        // Gọi phương thức validate để kiểm tra email và mật khẩu
        if validateEmailAndPassword() {
            let vc = HomeViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Hiển thị cảnh báo nếu email hoặc mật khẩu không hợp lệ
            showAlert(message: "Invalid email or password.")
        }
    }
    
    @IBAction func activeButtonCreateAccount(_ sender: Any) {
        let vc = CreateAnAccountViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func validateEmailAndPassword() -> Bool {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return false
        }
        
        // Kiểm tra định dạng email
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let isEmailValid = emailPredicate.evaluate(with: email)
        
        // Kiểm tra độ dài mật khẩu
        let isPasswordValid = password.count >= 8
        
        return isEmailValid && isPasswordValid
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

//    func setupEmailTextFileWithLable() {
//        // tạo UIView chứa cả UILabel và UITextField
//
//        containerView.layer.borderWidth = 1
//        containerView.layer.cornerRadius = 15
//        containerView.layer.borderColor = UIColor.systemGray2.cgColor
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//
//        // tạo UILabel cho chữ "Email"
//        let emailLabel = UILabel()
//        emailLabel.text = "Email"
//        emailLabel.textColor = .systemGray2
//        emailLabel.textAlignment = .left
//        emailLabel.font = UIFont.systemFont(ofSize: 14)
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        containerView.addSubview(emailLabel)
//
//        // tạo UITextField cho nhập email
//        let emailTextField = UITextField()
//        emailTextField.textColor = .black
//        emailTextField.font = UIFont.systemFont(ofSize: 18)
//        emailTextField.translatesAutoresizingMaskIntoConstraints = false
//        containerView.addSubview(emailTextField)
//
//        // thêm Auto Layout cho emailLabel và emailTextField trong containerView
//        NSLayoutConstraint.activate([
//            emailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            emailLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
//
//            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 0),
//            emailTextField.heightAnchor.constraint(equalToConstant: 30),
//            emailTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
//        ])
//    }
