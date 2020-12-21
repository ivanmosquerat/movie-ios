//
//  ActorDetailsViewController.swift
//  movie-app
//
//  Created by Ivan Mosquera on 28/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit
import Kingfisher

class PersonDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var personSelectedId = 0
    private var apiService:ApiService!
    
    // MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeBirthdayLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var biographyTextView: UITextView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(closeModally))
        
        apiService = ApiService()
        getDetails(personId: personSelectedId )
    }
    
    
    
    func getDetails(personId:Int){
        apiService.getPersonDetails(completion: {(person) in
            
            debugPrint(person.name)
            DispatchQueue.main.async {
                self.setupView(person: person)
            }
            
            
        }, url: "\(EndPoints.Person.personBase)\(personId )\(EndPoints.apiKey)")
    }
    
    func setupView(person:Person){
        //nameLabel.text = person.name ?? "N/A"
//        placeBirthdayLabel.text = person.placeOfBirth
//        birthdayLabel.text = person.birthday
//        biographyTextView.text = person.biography
//
//        profileImageView.kf.setImage(with: URL(string: "\(EndPoints.imageUrlBase)\(person.profilePath ?? "")"))
    }
    
    @objc func closeModally(){
        self.dismiss(animated: true, completion: nil)
    }
}
