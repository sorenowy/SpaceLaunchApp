//
//  Constants.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 09/07/2021.
//

import Foundation
import UIKit

struct Constants {
    
    static let url = "https://ll.thespacedevs.com/2.0.0/launch/upcoming/"
    static let cellIdentifier = "cell"
    static let backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    static var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "SpaceAPI"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        return label
    }()
    static var whiteLogo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named:"iconmonstr-rocket-19-240")
        let templateImage = logo.image?.withRenderingMode(.alwaysTemplate)
        logo.image = templateImage
        logo.tintColor = .white
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    static var blackLogo: UIImageView = {
       let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named:"iconmonstr-rocket-19-240")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
}
