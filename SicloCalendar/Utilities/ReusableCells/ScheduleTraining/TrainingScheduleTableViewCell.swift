//
//  TrainingScheduleTableViewCell.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class TrainingScheduleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var instructorImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var ranking: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUI(){
        self.backgroundColor = .clear
        backView.backgroundColor = .white
        backView.layer.borderColor = UIColor.gray.cgColor
        backView.layer.borderWidth = 2
        backView.layer.cornerRadius = 10
        instructorImg.layer.cornerRadius = instructorImg.frame.width / 2
        instructorImg.layer.borderColor = UIColor.lightGray.cgColor
        instructorImg.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func fillWith(schedule:ScheduleEntity){
        instructorImg.kf.setImage(
            with: URL(string: schedule.instructor.face_photo),
            placeholder: #imageLiteral(resourceName: "SIcloPlus"),
            options: [.transition(.fade(1))]
        )
        nameLbl.text = "\(schedule.instructor.nombre): sesión de \(schedule.tipo)"
        detailLbl.text = schedule.hour
        ranking.rating = Double(schedule.intensity)
    }
    
    func fillEmpty(){
        instructorImg.image =  #imageLiteral(resourceName: "SIcloPlus")
        nameLbl.text = "Cargando"
        detailLbl.text = "Cargando"
        ranking.rating = Double(0)
    }
    
    
}
