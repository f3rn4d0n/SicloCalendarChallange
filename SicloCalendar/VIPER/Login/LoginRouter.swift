//
//  LoginRouter.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class LoginRouter: LoginRoutingProtocol {
    
    var view: LoginViewController = LoginViewController()
    let presenter = LoginPresenter()
    let interactor = LoginInteractor()
    var navigationController: UINavigationController?
    
    init() {
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        view = (storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController)!
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.routing = self
        interactor.presenter = presenter
        navigationController = UINavigationController(rootViewController: view)
    }
    
    func goToCalendar() {
        let routing = CalendarRouter()
        routing.view.modalPresentationStyle = .fullScreen
//        view.present(routing.view, animated: true, completion: nil)
        view.navigationController?.pushViewController(routing.view, animated: true)
    }
}
