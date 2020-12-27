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
    private var serieItemCellId = Constants.cellIds.serieItemCellId
    var closureSerieSelected:((_ serie:SerieData) -> Void)?
    
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
        seriesCollectionView.register(UINib(nibName: serieItemCellId, bundle: nil), forCellWithReuseIdentifier: serieItemCellId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCellWith(title:String, series:[String:[SerieData]]){
        titleLabel.text = title
        self.series = series[title] ?? [SerieData]()
        seriesCollectionView.reloadData()
    }
    
}

// MARK: - Navigation
extension SectionSerieTableViewCell{
    
    var referenceSeriesTableViewController: SeriesViewController? {
        var parentResponder: UIResponder = self
        
        while parentResponder != nil{
            parentResponder = parentResponder.next!
            if let viewController = parentResponder as? SeriesViewController{
                
                return viewController
            }
        }
        return nil
    }
}

// MARK: - UICollectionViewDelegate
extension SectionSerieTableViewCell:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let tableController = referenceSeriesTableViewController{
            if closureSerieSelected != nil{
                closureSerieSelected!(self.series[indexPath.row])
            }
            tableController.performSegue(withIdentifier: Constants.Segues.segueToSerieDetail, sender: nil)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SectionSerieTableViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: serieItemCellId, for: indexPath)
        
        if let cell = cell as? ItemSerieCollectionViewCell{
            
            cell.setupCellWith(serie: series[indexPath.row])
        }
        
        return cell
    }
    
    
}
