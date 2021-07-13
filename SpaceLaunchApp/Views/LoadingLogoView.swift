//
//  LoadingLogoView.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 13/07/2021.
//

import Foundation
import UIKit

class LoadingLogoView: UIView {
    
    let logo = Constants.whiteLogo
    init(){
        super.init(frame: UIScreen.main.bounds)
        setLogoConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLogoConstraints(){
        self.addSubview(logo)
        logo.widthAnchor.constraint(equalToConstant: self.frame.width / 2).isActive = true
        logo.heightAnchor.constraint(equalToConstant: self.frame.width / 2).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
