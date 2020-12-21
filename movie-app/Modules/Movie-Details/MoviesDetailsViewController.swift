//
//  MoviesDetailsViewController.swift
//  movie-app
//
//  Created by Ivan Mosquera on 20/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var castCollectionView: UICollectionView!
    @IBOutlet weak var crewCollectionView: UICollectionView!
    @IBOutlet weak var voteView: UIView!
    
    
    // MARK: - Properties
    var movie:MovieData = MovieData.default
    var movieYearRelease:String = ""
    var movieCredits: MovieCredits =  MovieCredits.default
    var castDataSource : [CastMember] = []
    var crewDataSource : [CrewMember] = []
    var personSelectedId:Int = 0
    
    
    var vc:PersonDetailsViewController!
    private var cellId = "PersonCollectionViewCell"
    private var apiService : ApiService!
    private let segueIdentifierToPerosnDetail = "showPersonDetail"
    var closure:((_ id:Int) -> Void )?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
//        vc = PersonDetailsViewController()
        

        setCollectionsView()
        getMovieDetails(movieId: movie.id ?? 0)
        getMovieCredits(movieId: movie.id ?? 0)
        //setupUi()
    }
    
    // MARK: - Methods
    private func setCollectionsView(){
        apiService = ApiService()
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        crewCollectionView.delegate = self
        crewCollectionView.dataSource = self
        castCollectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        crewCollectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    private func setupUi(){
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        posterImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(movie.posterPath!)"))
        titleLabel.text = movie.title
        
        // Set year
        movieYearRelease = movie.releaseDate ?? ""
        let range = movieYearRelease.index(movieYearRelease.endIndex, offsetBy: -6)..<movieYearRelease.endIndex
        movieYearRelease.removeSubrange(range)
        
        yearLabel.text = movieYearRelease
        durationLabel.text = """
        \(movie.runtime ?? 0)
        minutes
        """
        voteLabel.text = "\(movie.voteAverage ?? 0.0)"
        setupViewVote(vote: movie.voteAverage ?? 0.0)
        
        horizontalStackView.layer.cornerRadius = 8
        horizontalStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        horizontalStackView.isLayoutMarginsRelativeArrangement = true
        horizontalStackView.layer.masksToBounds = true
        
        overviewTextView.text = movie.overview ?? "Overview not avaliable"
        
        languageLabel.text = "\(setupLanguage(movie: movie))"
        
        statusLabel.text = movie.status ?? "Status not avaliable"
        
        
        setupGenreChips(movie: movie)
    }
    
    private func getMovieDetails(movieId:Int){
        apiService.getMovieDetails(completion: {(movieData) in
            self.movie = movieData
            
            DispatchQueue.main.async {
                self.setupUi()
            }
        }, url: "\(EndPoints.Movies.movieBase)\(movieId)\(EndPoints.apiKey)")
    }
    
    private func getMovieCredits(movieId:Int){
        apiService.getMovieCredits(completion: {(movieCredits) in
            self.movieCredits = movieCredits
            
            DispatchQueue.main.async {
                self.setupCastCollection(movieCredits: self.movieCredits)
                self.setupCrewCollection(movieCredits: self.movieCredits)
                self.castCollectionView.reloadData()
                self.crewCollectionView.reloadData()
            }
            
        }, url: "\(EndPoints.Movies.movieBase)\(movieId)\(EndPoints.Movies.movieCredits)\(EndPoints.apiKey)")
    }
    
    private func setupViewVote(vote:Double){
        voteView.layer.cornerRadius = voteView.frame.height / 2
        voteView.layer.borderWidth = 4
        voteView.layer.borderColor = UIColor(named: "secondary")?.cgColor
        voteView.layer.masksToBounds = true
    }
    
    private func setupGenreChips(movie:MovieData){
        genreLabel.text = movie.genres?.first?.name ?? "N/A"
    }
    
    private func setupLanguage(movie:MovieData) -> String {
        
        var languageText = "N/A"
        for language in LanguagesFlags{
            if (language.key == movie.originalLanguage){
                languageText = language.value
            }
        }
        
        return languageText
    }
    
    private func setupCastCollection(movieCredits:MovieCredits){
        if let castArray = movieCredits.cast {
            for cast in castArray {
                castDataSource.append(CastMember(id: cast.id, castId: cast.castId, gender: cast.gender, order: cast.order, character: cast.character, creditId: cast.creditId, name: cast.name, profilePath: cast.profilePath))
            }
        }
    }
    
    private func setupCrewCollection(movieCredits:MovieCredits){
        if let crewArray = movieCredits.crew {
            for crew in crewArray {
                crewDataSource.append(CrewMember(id: crew.id, gender: crew.gender, department: crew.department, job: crew.job, creditId: crew.creditId, name: crew.name, profilePath: crew.profilePath))
            }
        }
    }
    

}

// MARK: - Navigation
extension MoviesDetailsViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == segueIdentifierToPerosnDetail, let personDetailViewController = segue.destination as? PersonDetailsViewController{
//
//            personDetailViewController.personSelectedId = personSelectedId
//        }
    }
}

// MARK: - UICollectionView delegate
extension MoviesDetailsViewController: UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
//        let personDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "PersonDetailsViewController") as! PersonDetailsViewController
//
//        if collectionView == self.castCollectionView{
//            personSelectedId = castDataSource[indexPath.row].id ?? 0
//
//        }else{
//            personSelectedId = crewDataSource[indexPath.row].id ?? 0
//        }
//
//
//        personDetailViewController.personSelectedId = personSelectedId
//        personDetailViewController.modalPresentationStyle = .pageSheet
//
//        self.present(personDetailViewController, animated: true, completion: nil)
//        //performSegue(withIdentifier: segueIdentifierToPerosnDetail, sender: nil)
    }
}

// MARK: - UICollectionView datasource
extension MoviesDetailsViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView ==  self.castCollectionView {
            return castDataSource.count
        }else{
            return crewDataSource.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = castCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? PersonCollectionViewCell{
            if collectionView == self.castCollectionView{
                cell.setupCellWithCastMember(personSelected: castDataSource[indexPath.row])
            }else{
                cell.setupCellWithCrewMember(personSelected: crewDataSource[indexPath.row])
            }
        }
        
        return cell
    }
    
    
}
