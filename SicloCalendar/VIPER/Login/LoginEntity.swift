//
//  LoginEntity.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

struct LoginEntity: Codable {
    var email:String
    var pass: String
    
    init(email: String, pass: String) {
        self.email = email
        self.pass = pass
    }
}

