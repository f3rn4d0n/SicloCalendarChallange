//
//  VideoProtocol.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

protocol VideoViewProtocol{
    
}

protocol VideoPresenterProtocol{
    func requestForVideoUrl() -> URL
    func goBack()
}

protocol VideoRoutingProtocol{
    func goBack()
}
