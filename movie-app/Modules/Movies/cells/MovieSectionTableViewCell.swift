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
    private var cellId = "ItemMovieCollectionViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Actions
    @IBAction func seeAllButtonAction(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCellWith(title:String, movies:[String:[MovieData]]){
        titleLabel.text = title
        self.movies = movies[title] ?? [MovieData]()
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension MovieSectionTableViewCell:UICollectionViewDelegate{
    
}

// MARK: - UICollectionViewDataSource
extension MovieSectionTableViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? ItemMovieCollectionViewCell{
            
            cell.setupCellWith(movie: movies[indexPath.row])
        }
        
        return cell
    }
    
    
}





