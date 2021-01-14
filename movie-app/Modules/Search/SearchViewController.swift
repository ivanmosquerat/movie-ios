//
//  SearchViewController.swift
//  movie-app
//
//  Created by Ivan Mosquera on 2/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties
    private var movieSelected: MovieData = MovieData.default
    private var serieSelected: SerieData = SerieData.default
    private var resultsMoviesDataSource: [MovieData] = []
    private var resultsSeriesDataSource: [SerieData] = []
    private var apiService : ApiService!
    private var isSearchBarEmpty:Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    // MARK: - Outlets
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultsSegmentedControl: UISegmentedControl!
    
    // MARK: - Actions
    @IBAction func resultsSegmentedControl(_ sender: Any) {
        
        switch resultsSegmentedControl.selectedSegmentIndex{
        
        case 0:
            resultsTableView.reloadData()
        case 1:
            resultsTableView.reloadData()
            
        default:
            break
        }
    }
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    
    // MARK: - Methods
    
    private func setupUi(){
        apiService = ApiService()
        
        searchBar.delegate = self
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.tableFooterView = UIView()
        resultsTableView.register(UINib(nibName: CellIds.resultItemCellId, bundle: nil) , forCellReuseIdentifier: CellIds.resultItemCellId)
        
        resultsSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
    }
    
    private func searchMovies(query:String){
        
        apiService.getSearchMovie(completion: {(searchResult) in
            
            self.resultsMoviesDataSource = searchResult
            
            DispatchQueue.main.async {
                self.resultsTableView.reloadData()
            }
            
        }, url: "\(MoviesConstants.search)", query: query)
    }
    
    private func searchSeries(query:String){
        
        apiService.getSearchSerie(completion: {(searchResult) in
            self.resultsSeriesDataSource = searchResult
            
            DispatchQueue.main.async {
                self.resultsTableView.reloadData()
            }
            
        }, url: "\(SeriesConstants.search)", query: query)
    }
    
    
}

// MARK: - SearchBar
extension SearchViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if isSearchBarEmpty {
            
        }else{
            searchBar.resignFirstResponder()
            searchMovies(query: searchBar.text ?? "")
            searchSeries(query: searchBar.text ?? "")
        }
        
    }
}

// MARK: - Navigation
extension SearchViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SeguesIds.segueToMovieDetail, let movieDetailInstance = segue.destination as? MoviesDetailsViewController {
            movieDetailInstance.movie = movieSelected
        }
        
        if segue.identifier == SeguesIds.segueToSerieDetail, let serieDetailInstance = segue.destination as? SerieDetailViewController {
            
            serieDetailInstance.serie = serieSelected
        }
    }
}

// MARK: - TableViewDelegate
extension SearchViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if resultsSegmentedControl.selectedSegmentIndex == 0{
            
            movieSelected = resultsMoviesDataSource[indexPath.row]
            performSegue(withIdentifier: SeguesIds.segueToMovieDetail, sender: nil)
            
        }else{
            
            serieSelected = resultsSeriesDataSource[indexPath.row]
            performSegue(withIdentifier: SeguesIds.segueToSerieDetail, sender: nil)
        }
    }
}

// MARK: - TableViewDataSource
extension SearchViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !resultsMoviesDataSource.isEmpty{
            
            tableView.myExtension.restore()
            return resultsMoviesDataSource.count
            
        }else if !resultsSeriesDataSource.isEmpty{
            
            tableView.myExtension.restore()
            return resultsSeriesDataSource.count
            
        }else{
            
            tableView.myExtension.setEmptyView(title: "No results", messsage: "No results.")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.resultItemCellId, for: indexPath)
        
        if let cell = cell as? ResultItemTableViewCell{
            
            if resultsSegmentedControl.selectedSegmentIndex == 0{
                cell.setupCellWithMovie(movie: resultsMoviesDataSource[indexPath.row])
            }else{
                cell.setupCellWithSerie(serie: resultsSeriesDataSource[indexPath.row])
            }
        }
        return cell
    }
    
    
}
