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
    
    // MARK: - Properties
    var movie:MovieData = MovieData.default
    
    var path = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    private func setupUi(){
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        posterImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(movie.posterPath!)"))
    }
    

}
