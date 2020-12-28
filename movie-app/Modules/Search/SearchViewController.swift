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
    private var resultsDataSource: [MovieData] = []
    private var apiService : ApiService!
    private var isSearchBarEmpty:Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    // MARK: - Outlets
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Actions
    

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
    }
    
    private func search(query:String){
        
        apiService.getSearchMovie(completion: {(searchResult) in
            
            self.resultsDataSource = searchResult
            
            DispatchQueue.main.async {
                self.resultsTableView.reloadData()
            }
            
        }, url: "\(MoviesConstants.search)", query: query)
    }
    
    
    
}

// MARK: - SearchBar
extension SearchViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if isSearchBarEmpty {
            
        }else{
            searchBar.resignFirstResponder()
            search(query: searchBar.text ?? "")
        }
        
    }
}

// MARK: - Navigation
extension SearchViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SeguesIds.segueToMovieDetail, let movieDetailInstance = segue.destination as? MoviesDetailsViewController {
            movieDetailInstance.movie = movieSelected
        }
    }
}

// MARK: - TableViewDelegate
extension SearchViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        movieSelected = resultsDataSource[indexPath.row]
        performSegue(withIdentifier: SeguesIds.segueToMovieDetail, sender: nil)
    }
}

// MARK: - TableViewDataSource
extension SearchViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.resultItemCellId, for: indexPath)
        
        if let cell = cell as? ResultItemTableViewCell{
            cell.setupCellWith(movie: resultsDataSource[indexPath.row])
        }
        
        return cell
    }
    
    
}
