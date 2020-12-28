//
//  MovieSectionTableViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 7/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit

class MovieSectionTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private var movies:[MovieData] = []
    private var movieItemCellId = CellIds.movieItemCellId
    var clousureMovieSelected:((_ movie:MovieData)-> Void)?
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Actions
    @IBAction func seeAllButtonAction(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: movieItemCellId, bundle: nil), forCellWithReuseIdentifier: movieItemCellId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupCellWith(title:String, movies:[String:[MovieData]]){
        titleLabel.text = title
        self.movies = movies[title] ?? [MovieData]()
        collectionView.reloadData()
    }
}

// MARK: - Navigation
extension MovieSectionTableViewCell{
    
    var referenceMoviesTableViewController: MoviesViewController? {
        
        var parentResponder: UIResponder = self
        while parentResponder != nil{
            parentResponder = parentResponder.next!
            if let viewController = parentResponder as? MoviesViewController {
                
                return viewController
            }
        }
        return nil
    }
    
}

// MARK: - UICollectionViewDelegate
extension MovieSectionTableViewCell:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let tableController = referenceMoviesTableViewController {
            
            if clousureMovieSelected != nil{
                clousureMovieSelected!(self.movies[indexPath.row])
            }
            
            tableController.performSegue(withIdentifier: SeguesIds.segueToMovieDetail, sender: nil)
        }
        
    }
}

// MARK: - UICollectionViewDataSource
extension MovieSectionTableViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieItemCellId, for: indexPath)
        
        if let cell = cell as? ItemMovieCollectionViewCell{
           
            cell.setupCellWith(movie: movies[indexPath.row])
        }
        
        return cell
    }
    
}





