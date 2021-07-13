//
//  RocketListCell.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 10/07/2021.
//

import Foundation
import UIKit

class RocketListCell: UITableViewCell {
    
    var rocketImage = UIImageView()
    var rocketName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    var startDate: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    var startStatus: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    var rocketAgencyName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(rocketImage)
        self.addSubview(rocketName)
        self.addSubview(startDate)
        self.addSubview(startStatus)
        self.addSubview(rocketAgencyName)
        setConstraints()
        setRocketNameConstraints()
        setRocketDateConstraints()
        setRocketStatusConstraints()
        setRocketAgencyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented - added as requirement")
    }
    
    func setData(rocketData: LaunchUpcomingDetails) {
        switch self.traitCollection.userInterfaceStyle {
        case .light, .unspecified:
            rocketImage.image = UIImage(named: "iconmonstr-rocket-19-240")
        case .dark:
            rocketImage.image = UIImage(named: "iconmonstr-rocket-19-240-w")
        }
            rocketName.text = rocketData.name
            startDate.text = rocketData.formattedNet
            startStatus.text = rocketData.status.name
            rocketAgencyName.text = rocketData.launch_service_provider.name
        }
    
    func setConstraints() {
        rocketImage.translatesAutoresizingMaskIntoConstraints = false
        rocketImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rocketImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        rocketImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rocketImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setRocketNameConstraints() {
        rocketName.translatesAutoresizingMaskIntoConstraints = false
        rocketName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20).isActive = true
        rocketName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150).isActive = true
        rocketName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rocketName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
    
    func setRocketDateConstraints() {
        startDate.translatesAutoresizingMaskIntoConstraints = false
        startDate.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20).isActive = true
        startDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150).isActive = true
        startDate.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startDate.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setRocketStatusConstraints() {
        startStatus.translatesAutoresizingMaskIntoConstraints = false
        startStatus.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 55).isActive = true
        startStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        startStatus.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startStatus.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    func setRocketAgencyConstraints(){
        rocketAgencyName.translatesAutoresizingMaskIntoConstraints = false
        rocketAgencyName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -75).isActive = true
        rocketAgencyName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        rocketAgencyName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rocketAgencyName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}

