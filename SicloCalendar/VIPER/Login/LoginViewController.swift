//
//  LoginViewController.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController{
    
    @IBOutlet weak var loginSectionView: UIView!
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var loginRegisterButton: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var emailTopConstraint: NSLayoutConstraint!
    var presenter:LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        loginSectionView.layer.cornerRadius = 10
        avatarImg.layer.cornerRadius = avatarImg.frame.width / 2
        emailTxtField.layer.cornerRadius = 5
        passTxtField.layer.cornerRadius = 5
        loginRegisterButton.layer.cornerRadius = 5
        
        if segmentedController.isHidden{
            emailTopConstraint.constant = -20
        }else{
            emailTopConstraint.constant = 20
        }
    }
    
    func updateUI(){
        
    }
    
    @IBAction func signInChanged(_ sender: Any) {
        switch segmentedController.selectedSegmentIndex
        {
        case 0: break
        case 1: break
        default: break
        }
    }
    
    @IBAction func loginRegisterAction(sender: UIButton) {
        presenter!.login(email:emailTxtField.text!, pass:passTxtField.text!)
    }
    
    @IBAction func forgotPasswordAction(sender: UIButton) {
        presenter!.forgotPassword()
    }
}

extension LoginViewController: NVActivityIndicatorViewable{
    func launchProgress(){
        startAnimating(CGSize.init(width: 50, height: 50),
                       message: "Wait a moment please",
                       messageFont: UIFont.boldSystemFont(ofSize: 12),
                       type: .ballRotate,
                       color: .white,
                       padding: 0.0,
                       displayTimeThreshold: 10,
                       minimumDisplayTime: 2,
                       backgroundColor: #colorLiteral(red: 0.1842391789, green: 0.1748405397, blue: 0.2493930459, alpha: 1),
                       textColor: .white)
    }
}

extension LoginViewController: LoginViewProtocol{
    func showErrorDetail(error: String) {
        self.stopAnimating()
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let accept = UIAlertAction(title: "Aceptar", style: .default) { (_) in}
        alert.addAction(accept)
        present(alert, animated: true, completion: nil)
    }
}
