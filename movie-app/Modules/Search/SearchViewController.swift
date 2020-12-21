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
        resultsTableView.register(UINib(nibName: Constants.cellIds.resultItemCellId, bundle: nil) , forCellReuseIdentifier: Constants.cellIds.resultItemCellId)
    }
    
    private func search(query:String){
        
        apiService.getSearchMovie(completion: {(searchResult) in
            
            self.resultsDataSource = searchResult
            
            DispatchQueue.main.async {
                self.resultsTableView.reloadData()
                //self.setupUi()
            }
            
        }, url: "\(Constants.Server.Movies.search)\(query)")
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

// MARK: - TableViewDelegate
extension SearchViewController:UITableViewDelegate{
    
}

// MARK: - TableViewDataSource
extension SearchViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIds.resultItemCellId, for: indexPath)
        
        if let cell = cell as? ResultItemTableViewCell{
            cell.setupCellWith(movie: resultsDataSource[indexPath.row])
        }
        
        return cell
    }
    
    
}
