//
//  LoginProtocol.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

protocol LoginViewProtocol{
    func showErrorDetail(error:String)
}

protocol LoginPresenterProtocol{
    func login(email:String, pass:String)
    func forgotPassword()
    func register()
}

protocol LoginInteractorProtocolInput{
    func login(_ user:LoginEntity)
}

protocol LoginInteractorProtocolOutput{
    func errorServices(message:String)
    func loginSuccess()
}

protocol LoginRoutingProtocol{
    func goToCalendar()
}
