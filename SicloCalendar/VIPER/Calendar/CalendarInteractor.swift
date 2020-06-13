//
//  CalendarInteractor.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit
import Network

class CalendarInteractor: CalendarInteractorProtocolInput {
    
    var presenter: CalendarInteractorProtocolOutput?
    var dataTask: URLSessionDataTask?
    let monitor = NWPathMonitor()
    var internetEnable = true
    
    func requestSessions() {
        self.checkInternetConnection()
        if !internetEnable{
            self.presenter?.errorServices(message: "Favor de revisar tu conexión a internet" )
            return
        }
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: GlobalValues.shared.calendarURL) {
        urlComponents.queryItems = [
           URLQueryItem(name: "location", value: "603967"),
           URLQueryItem(name: "page_size", value: "-1")
        ]
          guard let url = urlComponents.url else {
            return
          }
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 15.0
        sessionConfig.timeoutIntervalForResource = 15.0
        let session = URLSession(configuration: sessionConfig)
          dataTask = session.dataTask(with: url) { [weak self] data, response, error in
            defer {
              self?.dataTask = nil
            }
            DispatchQueue.main.async {
                if let error = error {
                    self?.presenter?.errorServices(message: error.localizedDescription)
                } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    do{
                        let calendar = try JSONDecoder().decode(CalendarEntity.self, from: data)
                        self?.presenter?.calendarLoaded(calendar)
                    } catch let error{
                        self?.presenter?.errorServices(message: error.localizedDescription)
                    }
                }
            }
          }
          dataTask?.resume()
        }
    }
    
    func checkInternetConnection(){
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
            } else {
                print("No connection.")
            }
            print(path.isExpensive)
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}
