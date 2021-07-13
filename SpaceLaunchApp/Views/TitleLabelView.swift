//
//  TitleLabelView.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 13/07/2021.
//

import Foundation
import UIKit

class TitleLabelView: UIView {
    
    var titleLabel = Constants.titleLabel
    
    init(){
        super.init(frame: UIScreen.main.bounds)
        setupTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleConstraints(){
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}
