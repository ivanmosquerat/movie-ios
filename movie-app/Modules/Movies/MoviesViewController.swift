//
//  MoviesViewController.swift
//  movie-app
//
//  Created by Ivan Mosquera on 2/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    // MARK: - Properties
    
    private let cellId = "MovieSectionTableViewCell"
    private let sectionsTitles = ["Trending","Popular","Rated","Upcoming"]
    
    private var moviesBySection:[String:[MovieData]] = [
        "Trending":[MovieData](),
        "Popular":[MovieData](),
        "Rated":[MovieData](),
        "Upcoming":[MovieData](),
    ]
    
    private var viewModel: MovieviewModel!
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    //MARK: - Actions
    
  
    //MARK: - LIfecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        callToViewModelForUpdate()
    }
    

    //MARK: - Private methods
    private func setupUi(){
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        tableview.allowsSelection = false
        tableview.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    private func callToViewModelForUpdate(){
        viewModel = MovieviewModel()
        
        viewModel.bindTrendingMovieToController = {
            self.moviesBySection["Trending"]?.append(contentsOf: self.viewModel.trendingMovieData)
            self.tableview.reloadData()
        }
        
        viewModel.bindPopularMovieController = {
            self.moviesBySection["Popular"]?.append(contentsOf: self.viewModel.popularMovieData)
            self.tableview.reloadData()
        }
        
        viewModel.bindRatedMovieController = {
            self.moviesBySection["Rated"]?.append(contentsOf: self.viewModel.ratedMovieData)
            self.tableview.reloadData()
        }
        
        viewModel.bindUpcomingMovieController = {
            self.moviesBySection["Upcoming"]?.append(contentsOf: self.viewModel.upcomingMovieData)
            self.tableview.reloadData()
        }
    }
    
    
}

// MARK: - Navigation
extension MoviesViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using segue.destination.
       // Pass the selected object to the new view controller.
   }
}

//MARK: - UITableViewDelegate
extension MoviesViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
}

//MARK: - UITableViewDataSource
extension MoviesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? MovieSectionTableViewCell{
            cell.setupCellWith(title: sectionsTitles[indexPath.row], movies: moviesBySection)
        }
        
        return cell
    }
}
