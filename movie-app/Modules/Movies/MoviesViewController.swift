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
    
    private let segueIdentifierToMovieDetail = Constants.Segues.segueToMovieDetail
    private let movieSectionCellId = Constants.cellIds.movieSectionCellId
    private let sectionsTitles = Constants.Server.Movies.sectionsTitles
    private var moviesBySection = Constants.Server.Movies.moviesBySection
    private var viewModel: MovieviewModel!
    private var movieSelectedOnCollection:MovieData = MovieData.default
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        tableview.register(UINib(nibName: movieSectionCellId, bundle: nil), forCellReuseIdentifier: movieSectionCellId)
    }
    
    private func callToViewModelForUpdate(){
        activityIndicator.startAnimating()
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
            self.activityIndicator.stopAnimating()
            self.tableview.reloadData()
        }
    }
    
}

// MARK: - Navigation
extension MoviesViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueIdentifierToMovieDetail, let movieDetailViewController = segue.destination as? MoviesDetailsViewController{
            
            movieDetailViewController.movie = movieSelectedOnCollection
        }
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: movieSectionCellId, for: indexPath)
        
        
        if let cell = cell as? MovieSectionTableViewCell{
            
            cell.clousureMovieSelected = { movie in
                self.movieSelectedOnCollection = movie
            }
            
            cell.setupCellWith(title: sectionsTitles[indexPath.row], movies: moviesBySection)
        }
        
        return cell
    }
}
