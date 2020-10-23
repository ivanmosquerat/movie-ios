//
//  MoviesDetailsViewController.swift
//  movie-app
//
//  Created by Ivan Mosquera on 20/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    // MARK: - Properties
    var movie:MovieData = MovieData.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        
    }
    
    // MARK: - Methods
    private func setupUi(){
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        posterImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(movie.posterPath!)"))
        
        titleLabel.text = movie.title
        yearLabel.text = movie.releaseDate
        //genreLabel.text = movie.genres
        durationLabel.text = "\(movie.runtime ?? 0) minutes"
        voteLabel.text = "\(movie.voteAverage!)"
    }
    

}
