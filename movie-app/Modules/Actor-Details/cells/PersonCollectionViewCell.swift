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
//    var personSelected:CastMember = CastMember.default
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWith(personSelected:CastMember){
        photoImageview.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(personSelected.profilePath ?? "")"))
        nameLabel.text = personSelected.name
        characterLabel.text = personSelected.character
        
    }
}
