//
//  SeriesViewController.swift
//  movie-app
//
//  Created by Ivan Mosquera on 2/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit


class SeriesViewController: UIViewController {
    
    //MARK: - Properties
    private let cellId = "SectionSerieTableViewCell"
    private let sectionsTitles = ["Trending","Popular","Rated"]
    private var seriesBySection:[String:[SerieData]] = [
        "Trending":[SerieData](),
        "Popular":[SerieData](),
        "Rated":[SerieData](),
    ]
    private var viewModel: SerieViewModel!
    
    // MARK: - Outlets
    @IBOutlet weak var tableViewSeries: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        callToViewModelForUpdate()
    }
    
    private func setupUi(){
        tableViewSeries.delegate = self
        tableViewSeries.dataSource = self
        tableViewSeries.tableFooterView = UIView()
        tableViewSeries.allowsSelection = false
        tableViewSeries.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    private func callToViewModelForUpdate(){
        viewModel = SerieViewModel()
        
        viewModel.bindTrendingSerieToController = {
            self.seriesBySection["Trending"]?.append(contentsOf: self.viewModel.trendingSerieData)
            self.tableViewSeries.reloadData()
        }
        
        viewModel.bindPopularSerieToController = {
            self.seriesBySection["Popular"]?.append(contentsOf: self.viewModel.popularSerieData)
            self.tableViewSeries.reloadData()
        }
        
        viewModel.bindRatedSerieToController = {
            self.seriesBySection["Rated"]?.append(contentsOf: self.viewModel.ratedSerieData)
            self.tableViewSeries.reloadData()
        }
    }


}

// MARK: UITableViewDelegate
extension SeriesViewController: UITableViewDelegate{
    
}

// MARK: - UITableViewDataSource
extension SeriesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionsTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? SectionSerieTableViewCell{
            cell.setupCellWith(title: sectionsTitles[indexPath.row], series: seriesBySection)
        }
        
        return cell
    }
    
    
}
