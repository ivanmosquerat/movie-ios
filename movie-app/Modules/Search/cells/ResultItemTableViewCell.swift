//
//  ResultItemTableViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 19/12/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Kingfisher

class ResultItemTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWith(movie:MovieData){
        
        titleLabel.text = movie.title ?? "Title not available"
        voteLabel.text = "\(movie.voteAverage ?? 0.0)"
        genreLabel.text = movie.genres?.first?.name ?? "Genre not avaliable"
        yearLabel.text = movie.releaseDate
        
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        posterImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(movie.posterPath ?? "")"))
    }
    
}
