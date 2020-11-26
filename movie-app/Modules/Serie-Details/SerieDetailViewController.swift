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
    private let cellSeasonID = "SeasonItemCollectionViewCell"
    var serie:SerieData = SerieData.default
    //private var serieCredits:SerieCredits = SerieCredits.default
    private var seasonsDatasource:[Season] = []
    private var castDataSource:[CastMember] = []
    private var crewDataSource:[CrewMember] = []
    private var apiService : ApiService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionsView()
        getSerieDetails(serieId: serie.id ?? 0)
    }
    
    private func setupUi(){
        //Labels
        titleLabel.text = serie.name
        languageLabel.text = "\(setupLanguage(serie: serie))"
        inProductionLabel.text = serie.inProduction ?? true ? "In production" : "Finished"
        genreLabel.text = serie.genres?.first?.name ?? "N/A"
        seasonsLabel.text =
            """
            \(serie.seasons?.count ?? 1)
            Seasons
            """
        voteLabel.text = "\(serie.voteAverage ?? 0.0)"
        setupViewVote(vote: serie.voteAverage ?? 0.0)
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
    }
    
    private func getSerieDetails(serieId: Int){
        apiService.getSerieDetails(completion: {(serieData) in
            self.serie = serieData
            
            DispatchQueue.main.async {
                self.setupUi()
            }
        }, url: "\(EndPoints.Series.serieBase)\(serieId)\(EndPoints.apiKey)")
    }
    
    private func getSeasonList(){}
    
    private func getSeasonDetail(id:Int){}
    
    private func setupLanguage(serie:SerieData) -> String {
        
        var languageText = "N/A"
        for language in LanguagesFlags{
            if (language.key == serie.originalLanguage){
                languageText = language.value
            }
        }
        
        return languageText
    }
    
    private func setupViewVote(vote:Double){
        voteView.layer.cornerRadius = voteView.frame.height / 2
        voteView.layer.borderWidth = 4
        voteView.layer.borderColor = UIColor(named: "secondary")?.cgColor
        voteView.layer.masksToBounds = true
    }
    
}

// MARK: - CollectionViewDelegate

// MARK: - CollectionViewDataSource

