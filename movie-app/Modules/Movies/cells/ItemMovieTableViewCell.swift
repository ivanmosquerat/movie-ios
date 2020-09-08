//
//  ItemMovieTableViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 8/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit

class ItemMovieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWith(movie:Movie){
        titleLabel.text = movie.title
        voteLabel.text = "Rate: \(movie.voteAverage)"
    }
    
}
