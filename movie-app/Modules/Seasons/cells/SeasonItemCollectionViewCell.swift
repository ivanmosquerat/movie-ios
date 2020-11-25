//
//  SeasonItemCollectionViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 25/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit

class SeasonItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var seasonNameLabel: UILabel!
    @IBOutlet weak var episodesNumberLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWith(season:Season){}
}
