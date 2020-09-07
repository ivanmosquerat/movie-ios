//
//  MovieSectionTableViewCell.swift
//  movie-app
//
//  Created by Ivan Mosquera on 7/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import UIKit

class MovieSectionTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moviesTableView: UITableView!
    
    
    // MARK: - Actions
    @IBAction func seeAllButtonAction(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCellWith(title:String){
        titleLabel.text = title
    }
}
