//
//  VideoPresenter.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class VideoPresenter: VideoPresenterProtocol {
    var view:VideoViewProtocol?
    var routing:VideoRoutingProtocol?
    
    func requestForVideoUrl() -> URL {
        return  URL(string:GlobalValues.shared.videoURL)!
    }
    
    func goBack(){
        routing?.goBack()
    }

}
