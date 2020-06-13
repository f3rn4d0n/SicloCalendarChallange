//
//  LoginPresenter.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    
    var view:LoginViewProtocol?
    var interactor:LoginInteractorProtocolInput?
    var routing:LoginRoutingProtocol?
    
    func login(email: String, pass: String) {
        if email.isValidEmail(){
            if pass.count > 6{
                let user = LoginEntity(email:email, pass:pass)
                interactor!.login(user)
            }else{
                view!.showErrorDetail(error: "Favor de agregar una contraseña mayor a 6 caracteres")
            }
        }else{
            view!.showErrorDetail(error: "Favor de agregar un correo valido")
        }
    }
    
    func forgotPassword() {
        
    }
    
    func register() {
        
    }
}

extension LoginPresenter: LoginInteractorProtocolOutput{
    func errorServices(message: String) {
        view!.showErrorDetail(error: message)
    }
    
    func loginSuccess() {
        routing!.goToCalendar()
    }
}
