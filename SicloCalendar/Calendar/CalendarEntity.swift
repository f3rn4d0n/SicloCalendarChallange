//
//  CalendarEntity.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

struct CalendarEntity: Codable {
    var calendar: [String:[ScheduleEntity]]
    var instructors: [InstructorEntity]
}

struct ScheduleEntity: Codable{
    var id:Int
    var fecha:String
    var textoEspecial:String
    var tipo:String
    var instructor:InstructorEntity
    var hour:String
    var duration:Int
    var intensity:Int
    var class_type:Int
}

struct InstructorEntity: Codable{
    var id:Int
    var nombre:String
    var full_photo:String
    var face_photo:String
}
