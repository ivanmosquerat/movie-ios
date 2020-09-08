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
    private var sections = ["Trending", "Popular", "Rated", "Latest", "Upcoming",]
    private let cellId = "MovieSectionTableViewCell"
    private var movies:[Movie] = []
    
    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    //MARK: - Actions
    
  
    //MARK: - LIfecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        
        getMovies()
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
    
    private func getMovies(){
        guard let endpoint = URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=744dc706fad11b55f470ebbec1761849") else { return }
        
        //SVProgressHUD.show()
        
        AF.request(endpoint, method: .get, parameters: nil).responseJSON{ response  in
            
            
            
            guard let reponseJson = response.value as? [String: Any], let results = reponseJson as? [String:Any],  let moviesResult = results["results"] as? [[String:Any]] else{
                return
            }
            
            
            
            //guard let dataFromService = response.data, let model: Movie = try? JSONDecoder().decode(Movie.self, from: dataFromService) else {
               // return
            //}
            
            DispatchQueue.main.async {
                for item in moviesResult {
                    
                    self.movies.append(Movie(id: item["id"] as! Int, title: item["title"] as! String, original_title: item["original_title"] as! String, overview: item["overview"] as! String, posterPath: item["poster_path"] as! String, voteAverage: item["vote_average"] as! Double))
                    
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
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        
        if let cell = cell as? MovieSectionTableViewCell{
            cell.setupCellWith(title: sections[indexPath.row],movies: movies)
        }
        
        return cell
    }
    
    
}
