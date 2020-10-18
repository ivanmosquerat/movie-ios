//
//  SectionSerieTableViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 12/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit



class SectionSerieTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private var series:[SerieData] = []
    private var cellId = "ItemSerieCollectionViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    

    // MARK: - Actions
    @IBAction func seeAllButtonAction(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        seriesCollectionView.delegate = self
        seriesCollectionView.dataSource = self
        seriesCollectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWith(title:String, series:[String:[SerieData]]){
        titleLabel.text = title
        self.series = series[title] ?? [SerieData]()
        seriesCollectionView.reloadData()
    }
    
}

// MARK: - UICollectionViewDelegate
extension SectionSerieTableViewCell:UICollectionViewDelegate{
    
}

// MARK: - UICollectionViewDataSource
extension SectionSerieTableViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? ItemSerieCollectionViewCell{
            
            cell.setupCellWith(serie: series[indexPath.row])
        }
        
        return cell
    }
    
    
}
