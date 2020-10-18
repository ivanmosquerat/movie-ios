//
//  ItemSerieCollectionViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 12/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Kingfisher

class ItemSerieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCellWith(serie: SerieData){
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        titleLabel.text = serie.name
        voteLabel.text = "Rate: \(serie.voteAverage ?? 0.0)"
        posterImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(serie.posterPath!)"))
    }

}
