//
//  SplashViewController.swift
//  Foodeck
//
//  Created by Nguyen Le on 29/8/24.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var logo_Splash: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogo()
        navigateToLogin()

    }
    func setupLogo() {
            logo_Splash.image = UIImage(named: "BG")
            logo_Splash.contentMode = .scaleToFill
    }
    
    func navigateToLogin() {
            // Tạo độ trễ 3 giây trước khi chuyển sang màn hình Login
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                let vc = LoginViewController()
                self.navigationController?.viewControllers = [vc]
            }
        }
        
    @IBAction func button_Splash(_ sender: Any) {
            let vc = LoginViewController()
        self.navigationController?.viewControllers = [vc]
    }

}
