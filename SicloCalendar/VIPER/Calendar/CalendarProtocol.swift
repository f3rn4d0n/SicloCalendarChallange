//
//  CalendarProtocol.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

protocol CalendarViewProtocol{
    func showErrorDetail(error:String)
    func updateCalendar()
}

protocol CalendarPresenterProtocol{
    func loadSchedules()
    func seeInstructor()
    func registerToSession(_ schedule:ScheduleEntity)
    /// Get number of days to workout
    /// - Returns: number of days
    func countSchedules() -> Int?
    /// Get name of day to work on
    /// - Parameter index: number of day to review
    /// - Returns: name of the day
    func getScheduleDayOf(index:Int) -> String?
    /// Get number of sessions
    /// - Parameter date: name of day to review
    /// - Returns: number of sessions
    func countScheduleBy(date:String) -> Int?
    func getSchedule(index:Int, of date:String) -> ScheduleEntity?
    
    func countInstructors() -> Int?
    func getInstructorOf(index:Int) -> InstructorEntity?
}

protocol CalendarInteractorProtocolInput{
    func requestSessions()
}

protocol CalendarInteractorProtocolOutput{
    func calendarLoaded(_ calendar:CalendarEntity)
    func errorServices(message:String)
}

protocol CalendarRoutingProtocol{
    func goToInstructorDetail()
}
