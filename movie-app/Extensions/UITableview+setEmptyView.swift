//
//  UITableview+setEmptyView.swift
//  movie-app
//
//  Created by Ivan Mosquera on 12/1/21.
//  Copyright © 2021 Ivan Mosquera. All rights reserved.
//

import Foundation
import UIKit

extension Extension where Base: UITableView{
    
    
    /// Set tableview content when it's empty.
    /// - Parameters:
    ///   - title: Title.
    ///   - messsage: Message description.
    func setEmptyView(title:String, messsage: String){
         let emptyView = UIView(frame:
                                    CGRect(x: self.base.center.x,
                                           y: self.base.center.y,
                                           width: self.base.bounds.size.width,
                                           height: self.base.bounds.size.height))
        
        let titleLabel = UILabel()
        let messageLabel = UILabel()
    
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        messageLabel.textColor = .darkGray
        messageLabel.font = .systemFont(ofSize: 17, weight: .regular)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        
    }
}
