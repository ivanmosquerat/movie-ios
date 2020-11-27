//
//  SeasonItemCollectionViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 25/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Kingfisher

class SeasonItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var episodesNumberLabel: UILabel!
    
    // MARK: - Properties
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWith(season:Season){
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        
        if(season.posterPath != nil){
            posterImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(season.posterPath ?? "")"))
        }else{
            posterImageView.image = UIImage(named: "season_default")
        }
        seasonNumberLabel.text = "Season \(season.seasonNumber ?? 1)"
        episodesNumberLabel.text = "\(season.episodeCount ?? 0) Episodes"
    }
}
