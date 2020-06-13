//
//  CalendarPresenter.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class CalendarPresenter: CalendarPresenterProtocol {
    
    
    var view:CalendarViewProtocol?
    var interactor:CalendarInteractorProtocolInput?
    var routing:CalendarRoutingProtocol?
    
    var calendar:CalendarEntity?
    
    func loadSchedules() {
        interactor?.requestSessions()
    }
    
    func seeInstructor() {
        routing?.goToInstructorDetail()
    }
    
    func registerToSession() {
        
    }
    
    func countInstructors() -> Int? {
        return calendar?.instructors.count
    }
    
    func countSchedules() -> Int? {
        return calendar?.calendar.keys.count
    }
    
    func getScheduleDayOf(index: Int) -> String? {
        var arr:[String] = []
        for day in calendar!.calendar.keys{
            arr.append(day)
        }
        return arr[index]
    }
    
    
    func registerToSession(_ schedule: ScheduleEntity) {
        if let date = schedule.fecha.getDate(){
            LocalNotificationManager.shared.scheduleNotification(
                title: "Unete a tu sesión de \(schedule.tipo)",
                body: "No te puedes perder tu clase con \(schedule.instructor.nombre), estamos apunto de comenzar",
                timeInterval: date.timeIntervalSinceNow,
                identifier: "\(schedule.id)")
        }
        LocalNotificationManager.shared.scheduleNotification(
        title: "Primera llamada para la sesión en vivo de \(schedule.tipo)",
        body: "Preparate para tu clase con \(schedule.instructor.nombre), te esperamos!",
        timeInterval: 5,
        identifier: "\(schedule.id)Test")
    }
    
    func countScheduleBy(date: String) -> Int? {
        return calendar?.calendar[date]?.count
    }
    
    func getSchedule(index: Int, of date: String) -> ScheduleEntity? {
        return calendar!.calendar[date]![index]
    }
    
    func getInstructorOf(index: Int) -> InstructorEntity? {
        return calendar?.instructors[index]
    }
}

extension CalendarPresenter: CalendarInteractorProtocolOutput{
    func calendarLoaded(_ calendar: CalendarEntity) {
        self.calendar = calendar
        view?.updateCalendar()
    }
    
    func errorServices(message: String) {
        view?.showErrorDetail(error: message)
    }
}
