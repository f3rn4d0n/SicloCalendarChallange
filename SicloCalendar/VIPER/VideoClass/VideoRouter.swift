//
//  VideoRouter.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class VideoRouter: VideoRoutingProtocol {
    
    var view: VideoViewController = VideoViewController()
    let presenter = VideoPresenter()
    
    init() {
        let storyboard = UIStoryboard(name: "VideoStoryboard", bundle: nil)
        view = (storyboard.instantiateViewController(withIdentifier: "VideoViewController") as? VideoViewController)!
        view.presenter = presenter
        presenter.routing = self
    }
    
    func goBack(){
        self.view.dismiss(animated: true)
    }
}
