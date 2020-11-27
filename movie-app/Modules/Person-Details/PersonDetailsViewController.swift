//
//  ActorDetailsViewController.swift
//  movie-app
//
//  Created by Ivan Mosquera on 28/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeBirthdayLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var biographyTextView: UITextView!
    
    // MARK: - Properties
    var personeSelectedId:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getDetails(){}
    
    func setupView(person:Person){}
}
