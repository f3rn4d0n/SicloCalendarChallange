//
//  LoginInteractor.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class LoginInteractor: LoginInteractorProtocolInput {
    
    var presenter:LoginInteractorProtocolOutput?
    
    func login(_ user: LoginEntity) {
        presenter!.loginSuccess()
    }
    

}
