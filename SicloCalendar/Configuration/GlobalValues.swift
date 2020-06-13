//
//  GlobalValues.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class GlobalValues: NSObject {
    let baseURL = "https://api.siclo.com/api/v2/plus/"
    let calendarURL = "https://api.siclo.com/api/v2/plus/" + "calendar"
    
    static let shared = GlobalValues()


    private override init() {
        
    }
}
