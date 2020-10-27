//
//  ActorCollectionViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 27/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit

class ActorCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var photoImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    // MARK: - Properties
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWith(){
        // TODO: Recibe un tipo Actor y configura los valores de los componentes.
    }
}
