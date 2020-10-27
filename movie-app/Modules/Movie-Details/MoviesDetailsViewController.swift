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
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var castCollectionView: UICollectionView!
   
    
    // MARK: - Properties
    var movie:MovieData = MovieData.default
    var movieYearRelease:String = ""
    private var cellId = "ActorCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        setupUi()
        
    }
    
    // MARK: - Methods
    private func setupUi(){
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        posterImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(movie.posterPath!)"))
        titleLabel.text = movie.title
        
        // Set year
        movieYearRelease = movie.releaseDate ?? ""
        let range = movieYearRelease.index(movieYearRelease.endIndex, offsetBy: -6)..<movieYearRelease.endIndex
        movieYearRelease.removeSubrange(range)
        
        yearLabel.text = movieYearRelease
        durationLabel.text = """
        \(movie.runtime ?? 0)
        minutes
        """
        voteLabel.text = "\(movie.voteAverage ?? 0.0)"
        
        horizontalStackView.layer.cornerRadius = 8
        horizontalStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        horizontalStackView.isLayoutMarginsRelativeArrangement = true
        horizontalStackView.layer.masksToBounds = true
    }
    
    private func setupCastCollection(){}
    
}

// MARK: - UICollectionView delegate
extension MoviesDetailsViewController: UICollectionViewDelegate{
    
}

// MARK: - UICollectionView datasource
extension MoviesDetailsViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = castCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? ActorCollectionViewCell{
            //TODO: Set up los valores de la celda.
        }
        
        return cell
    }
    
    
}
