//
//  StringExtension.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

extension String{
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func getDate() -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.date(from:self)
    }
    
    func cuteDateFormat() -> String{
        let dateFormatter = DateFormatter()
        guard let date = self.getDate() else{
            return self
        }
        dateFormatter.dateFormat = "EEEE dd HH:mm"
        return dateFormatter.string(from: date)
    }
}
