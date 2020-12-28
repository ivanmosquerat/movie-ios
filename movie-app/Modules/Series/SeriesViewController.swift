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
    private let segueIndetifierToSerieDetail = SeguesIds.segueToSerieDetail
    private let serieSectionCellId = CellIds.serieSectionCellId
    private let sectionsTitles = SeriesConstants.sectionsTitles
    private var seriesBySection = SeriesConstants.seriesBySection
    private var viewModel: SerieViewModel!
    private var serieSelectedOnCollection:SerieData = SerieData.default
    
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
        tableViewSeries.register(UINib(nibName: serieSectionCellId, bundle: nil), forCellReuseIdentifier: serieSectionCellId)
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

// MARK: - Navigation
extension SeriesViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIndetifierToSerieDetail, let serieDetailViewController = segue.destination as? SerieDetailViewController{
            
            serieDetailViewController.serie = serieSelectedOnCollection
        }
    }
}

// MARK: - UITableViewDelegate
extension SeriesViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
}

// MARK: - UITableViewDataSource
extension SeriesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionsTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: serieSectionCellId, for: indexPath)
        
        if let cell = cell as? SectionSerieTableViewCell{
            
            cell.closureSerieSelected = { serie in
                self.serieSelectedOnCollection = serie
            }
            
            cell.setupCellWith(title: sectionsTitles[indexPath.row], series: seriesBySection)
        }
        
        return cell
    }
    
    
}
