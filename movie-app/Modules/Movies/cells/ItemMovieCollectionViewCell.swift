//
//  ItemMovieCollectionViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 8/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Kingfisher

class ItemMovieCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCellWith(movie:MovieData){
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        titleLabel.text = movie.title
        voteLabel.text = "Rate: \(movie.voteAverage ?? 0.0)"
        posterImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(movie.posterPath!)"))
    }
    
    

}
