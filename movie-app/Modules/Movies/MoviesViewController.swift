//
//  MoviesViewController.swift
//  movie-app
//
//  Created by Ivan Mosquera on 2/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class MoviesViewController: UIViewController {
    // MARK: - Properties
    
    private let cellId = "MovieSectionTableViewCell"
    private let sectionsTitles = ["Trending","Popular","Rated","Upcoming"]
    private var sections:[String:[Movie]] = [
        "Trending":[Movie](),
        "Popular":[Movie](),
        "Rated":[Movie](),
        "Upcoming":[Movie](),
    ]
    
    private var trendingMovies:[Movie] = []
    private var popularMovies:[Movie] = []
    private var ratedgMovies:[Movie] = []
    private var latestMovies:[Movie] = []
    private var upcomingMovies:[Movie] = []
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    //MARK: - Actions
    
  
    //MARK: - LIfecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        getTrendingMovies()
        getPopularMovies()
        // Do any additional setup after loading the view.
    }
    

    //MARK: - Private methods
    private func setupUi(){
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        tableview.allowsSelection = false
        tableview.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    private func getTrendingMovies(){
        guard let endpoint = URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=744dc706fad11b55f470ebbec1761849") else { return }
        
    
        AF.request(endpoint, method: .get, parameters: nil).responseJSON{ response  in
            
            
            guard let reponseJson = response.value as? [String: Any], let results = reponseJson as? [String:Any],  let moviesResult = results["results"] as? [[String:Any]] else{
                return
            }
            
            
            DispatchQueue.main.async {
                for item in moviesResult {
                    
                    self.sections["Trending"]?.append(Movie(id: item["id"] as! Int, title: item["title"] as! String, original_title: item["original_title"] as! String, overview: item["overview"] as! String, posterPath: item["poster_path"] as! String, voteAverage: item["vote_average"] as! Double))
                }
                self.tableview.reloadData()
            }
        }
    }
    
    private func getPopularMovies(){
        guard let endpoint = URL(string: "\(EndPoints.domain)\(EndPoints.popularMovie)\(EndPoints.apiKey)") else {
            return
        }
        
        AF.request(endpoint, method: .get, parameters: nil).responseJSON{ response in
            
            guard let responseJson = response.value as? [String:Any], let results = responseJson as? [String:Any], let moviesResult = results["results"] as? [[String:Any]] else {
                return
            }
            
            DispatchQueue.main.async {
                for item in moviesResult {
                    self.sections["Popular"]?.append(Movie(id: item["id"] as! Int, title: item["title"] as! String, original_title: item["original_title"] as! String, overview: item["overview"] as! String, posterPath: item["poster_path"] as! String, voteAverage: item["vote_average"] as! Double))
                }
                
                
                self.tableview.reloadData()
            }
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
            cell.setupCellWith(title: sectionsTitles[indexPath.row], movies: sections)
            
        }
        return cell
    }
}
