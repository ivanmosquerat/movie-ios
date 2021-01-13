//
//  SerieDetailViewController.swift
//  movie-app
//
//  Created by Ivan Mosquera on 21/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Kingfisher

class SerieDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var inProductionLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var seasonsLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var seasonsCollectionView: UICollectionView!
    @IBOutlet weak var castCollectionView: UICollectionView!
    @IBOutlet weak var crewCollectionView: UICollectionView!
    @IBOutlet weak var voteView: UIView!
    
    
    // MARK: - Properties
    private var serieYearRelease:String = ""
    private let seasonCellId = CellIds.seasonCellId
    private var personCellId = CellIds.personCellId
    var serie:SerieData = SerieData.default
    private var serieCredits:MovieCredits = MovieCredits.default
    private var seasonsDatasource:[Season] = []
    private var castDataSource:[CastMember] = []
    private var crewDataSource:[CrewMember] = []
    private var apiService : ApiService!
    private var personSelectedId : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionsView()
        getSerieDetails(serieId: serie.id ?? 0)
        getSerieCredits(serieId: serie.id ?? 0)
    }
    
    private func setupUi(){
        //Labels
        titleLabel.text = serie.name
        languageLabel.text = "\(Utilities().setupLanguageLabel(originalLanguage: serie.originalLanguage ?? "en"))"
        inProductionLabel.text = serie.inProduction ?? true ? "In production" : "Finished"
        genreLabel.text = serie.genres?.first?.name ?? "N/A"
        seasonsLabel.text =
            """
            \(serie.seasons?.count ?? 1)
            Seasons
            """
        voteLabel.text = "\(serie.voteAverage ?? 0.0)"
        setupViewVote()
        
        overviewTextView.text = serie.overview ?? "Overview not avaliable."
        
        //ImageView
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        posterImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(serie.posterPath!)"))
        
        //HorizontalStack
        infoStackView.layer.cornerRadius = 8
        infoStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        infoStackView.isLayoutMarginsRelativeArrangement = true
        infoStackView.layer.masksToBounds = true
        
        //Set year
        serieYearRelease = serie.firstAirDate ?? ""
        let range = serieYearRelease.index(serieYearRelease.endIndex,
                                           offsetBy: -6)..<serieYearRelease.endIndex
        serieYearRelease.removeSubrange(range)
        yearLabel.text = serieYearRelease
    }
    
    private func setupCollectionsView(){
        apiService = ApiService()
        seasonsCollectionView.delegate = self
        seasonsCollectionView.dataSource = self
        seasonsCollectionView.register(UINib(nibName: seasonCellId, bundle: nil), forCellWithReuseIdentifier: seasonCellId)
        
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.register(UINib(nibName: personCellId, bundle: nil), forCellWithReuseIdentifier: personCellId)
        
        crewCollectionView.delegate = self
        crewCollectionView.dataSource = self
        crewCollectionView.register(UINib(nibName: personCellId, bundle: nil), forCellWithReuseIdentifier: personCellId)
    }
    
    private func getSerieDetails(serieId: Int){
        apiService.getSerieDetails(completion: {(serieData) in
            self.serie = serieData
            
            DispatchQueue.main.async {
                self.setupUi()
                self.seasonsDatasource = self.serie.seasons ?? []
                self.seasonsCollectionView.reloadData()
            }
        }, url: "\(EndPoints.Series.serieBase)\(serieId)\(EndPoints.apiKey)")
    }
    
    private func getSerieCredits(serieId:Int){
        apiService.getMovieCredits(completion: {(serieCredits) in
            self.serieCredits = serieCredits
            
            DispatchQueue.main.async {
                self.setupCastCollectionView(serieCredits: self.serieCredits)
                self.setupCrewCollectionView(serieCredits: self.serieCredits)
                self.castCollectionView.reloadData()
                self.crewCollectionView.reloadData()
            }
        }, url: "\(EndPoints.Series.serieBase)\(serieId)\(EndPoints.Series.serieCredits)\(EndPoints.apiKey)")
    }
    
    private func setupCastCollectionView(serieCredits:MovieCredits){
        if let castArray = serieCredits.cast{
            for cast in castArray{
                castDataSource.append(CastMember(id: cast.id, castId: cast.castId, gender: cast.gender, order: cast.order, character: cast.character, creditId: cast.creditId, name: cast.name, profilePath: cast.profilePath))
            }
        }
        
        
    }
    
    private func setupCrewCollectionView(serieCredits:MovieCredits){
        if let crewArray = serieCredits.crew{
            for crew in crewArray{
                crewDataSource.append(CrewMember(id: crew.id, gender: crew.gender, department: crew.department, job: crew.job, creditId: crew.creditId, name: crew.name, profilePath: crew.profilePath))
            }
        }
        
        
    }
    
    
    private func setupViewVote(){
        voteView.layer.cornerRadius = voteView.frame.height / 2
        voteView.layer.borderWidth = 4
        voteView.layer.borderColor = UIColor(named: "secondary")?.cgColor
        voteView.layer.masksToBounds = true
    }
    
}

// MARK: - Navigatio
extension SerieDetailViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SeguesIds.segueToPersonDetail, let personDetailViewController = segue.destination as? PersonDetailsViewController{
            
            personDetailViewController.personSelectedId = personSelectedId
        }
    }
}

// MARK: - CollectionViewDelegate
extension SerieDetailViewController:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.castCollectionView{
            
            personSelectedId = castDataSource[indexPath.row].id ?? 0
        }else if collectionView == self.crewCollectionView{
            
            personSelectedId = crewDataSource[indexPath.row].id ?? 0
        }else{
            return
        }
        
        performSegue(withIdentifier: SeguesIds.segueToPersonDetail, sender: nil)
    }
}

// MARK: - CollectionViewDataSource
extension SerieDetailViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.seasonsCollectionView && !seasonsDatasource.isEmpty{
            
            collectionView.myExtension.restore()
            return seasonsDatasource.count
            
        }else if collectionView == self.castCollectionView && !castDataSource.isEmpty{
            
            collectionView.myExtension.restore()
            return castDataSource.count
            
        }else if collectionView == self.crewCollectionView && !crewDataSource.isEmpty{
            
            collectionView.myExtension.restore()
            return crewDataSource.count
            
        }else{
            
            collectionView.myExtension.setEmptyView(title: "Data no available.", messsage: "Data no available.")
            
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.seasonsCollectionView{
            
            let cell = seasonsCollectionView.dequeueReusableCell(withReuseIdentifier: seasonCellId, for: indexPath)
            
            if let cell = cell as? SeasonItemCollectionViewCell{
                
                cell.setupCellWith(season: seasonsDatasource[indexPath.row])
            }
            
            return cell
            
        }else{
            
            let cell = castCollectionView.dequeueReusableCell(withReuseIdentifier: personCellId, for: indexPath)
            
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
}
