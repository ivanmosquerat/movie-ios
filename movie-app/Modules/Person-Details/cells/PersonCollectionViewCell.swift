//
//  ActorCollectionViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 27/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Kingfisher

class PersonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var photoImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    // MARK: - Properties
    var personSelected:CastMember = CastMember.default
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWithCastMember(personSelected:CastMember){
        
        photoImageview.layer.cornerRadius = 5
        photoImageview.layer.masksToBounds = true
        
        if(personSelected.profilePath != nil){
            photoImageview.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(personSelected.profilePath ?? "")"))
        }else{
            photoImageview.image = UIImage(named: "person_default")
        }
        
        nameLabel.text = personSelected.name
        characterLabel.text = personSelected.character
        
    }
    
    func setupCellWithCrewMember(personSelected:CrewMember){
        
        photoImageview.layer.cornerRadius = 5
        photoImageview.layer.masksToBounds = true
        
        if (personSelected.profilePath != nil){
            photoImageview.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(personSelected.profilePath ?? "")"))
        }else{
            photoImageview.image = UIImage(named: "person_default")
        }
        
        
        nameLabel.text = personSelected.name
        characterLabel.text = personSelected.job
        
    }
}
