//
//  GlobalValues.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class GlobalValues: NSObject {
    let calendarURL = "https://api.siclo.com/api/v2/plus/calendar"
    let videoURL = "https://drive.google.com/file/d/1MjhlX4Q_qvKKeDwB178TeMrnLrLIFw4k/view?usp=sharing"
    
    
    static let shared = GlobalValues()


    private override init() {
        
    }
}
