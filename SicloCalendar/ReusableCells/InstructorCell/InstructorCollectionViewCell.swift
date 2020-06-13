//
//  InstructorCollectionViewCell.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit
import Kingfisher

class InstructorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var instructorImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUI(){
        self.backgroundColor = .clear
        instructorImg.layer.cornerRadius = instructorImg.frame.height / 2
        instructorImg.layer.borderColor = UIColor.lightGray.cgColor
        instructorImg.layer.borderWidth = 1
        instructorImg.layoutIfNeeded()
    }

    func fillWith(instructor:InstructorEntity){
        instructorImg.kf.setImage(
            with: URL(string: instructor.face_photo),
            placeholder: #imageLiteral(resourceName: "SIcloPlus"),
            options: [.transition(.fade(1))]
        )
        nameLbl.text = instructor.nombre
    }
    
    func fillEmpty(){
        instructorImg.image =  #imageLiteral(resourceName: "SIcloPlus")
        nameLbl.text = "Cargando"
    }

}
