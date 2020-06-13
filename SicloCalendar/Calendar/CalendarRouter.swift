//
//  CalendarRouter.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class CalendarRouter: CalendarRoutingProtocol {
  

var view: CalendarViewController = CalendarViewController()
let presenter = CalendarPresenter()
let interactor = CalendarInteractor()

init() {
    let storyboard = UIStoryboard(name: "CalendarStoryboard", bundle: nil)
    view = (storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as? CalendarViewController)!
    view.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    presenter.routing = self
    interactor.presenter = presenter
}
    
    func goToInstructorDetail() {
          
      }
      


}
