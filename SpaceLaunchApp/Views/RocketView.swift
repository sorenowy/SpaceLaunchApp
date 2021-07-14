//
//  rocketViewList.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 09/07/2021.
//

import Foundation
import UIKit

class RocketView: UIView {
    
    var rocketImage = UIImageView()
    var rocketLogo = UIImageView()
    var videoButton = UIButton()
    var returnButton = UIButton()
    var rocketName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    var startDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    var startStatus: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    var rocketAgencyName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    var rocketLaunchpadName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        switch self.traitCollection.userInterfaceStyle {
        case .light, .unspecified:
            self.rocketLogo = Constants.blackLogo
            self.backgroundColor = .white
        case .dark:
            self.rocketLogo = Constants.whiteLogo
            self.backgroundColor = .black
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(data: LaunchUpcomingDetails){
        // add rocket logo and image
        rocketName.text = data.name // dodać walidacje "Brak"
        startStatus.text = data.status.name
        startDate.text = data.formattedNet
        rocketAgencyName.text = data.launch_service_provider.name
        rocketLaunchpadName.text = data.pad!.location!.name
        videoButton.setTitle("Rocket Video", for: .normal)
        videoButton.backgroundColor = .blue
        returnButton.setTitle("Powrót", for: .normal)
        returnButton.backgroundColor = .gray
    }
    
    func setViewConstraints() {
        addSubview(rocketLogo)
        addSubview(rocketName)
        addSubview(rocketAgencyName)
        addSubview(rocketLaunchpadName)
        addSubview(videoButton)
        addSubview(rocketImage)
        addSubview(returnButton)
        addSubview(startDate)
        addSubview(startStatus)
        
        rocketLogo.translatesAutoresizingMaskIntoConstraints = false
        rocketLogo.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        rocketLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        rocketLogo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rocketLogo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        rocketName.translatesAutoresizingMaskIntoConstraints = false
        rocketName.topAnchor.constraint(equalTo: topAnchor, constant: 180).isActive = true
        rocketName.leadingAnchor.constraint(equalTo: rocketLogo.leadingAnchor).isActive = true
        rocketName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        rocketName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        rocketAgencyName.translatesAutoresizingMaskIntoConstraints = false
        rocketAgencyName.topAnchor.constraint(equalTo: topAnchor, constant: 250).isActive = true
        rocketAgencyName.leadingAnchor.constraint(equalTo: rocketLogo.leadingAnchor).isActive = true
        rocketAgencyName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        rocketAgencyName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        rocketLaunchpadName.translatesAutoresizingMaskIntoConstraints = false
        rocketLaunchpadName.topAnchor.constraint(equalTo: topAnchor, constant: 300).isActive = true
        rocketLaunchpadName.leadingAnchor.constraint(equalTo: rocketLogo.leadingAnchor ).isActive = true
        rocketLaunchpadName.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -10).isActive = true
        rocketLaunchpadName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        startDate.translatesAutoresizingMaskIntoConstraints = false
        startDate.topAnchor.constraint(equalTo: topAnchor, constant: 350).isActive = true
        startDate.leadingAnchor.constraint(equalTo: rocketLogo.leadingAnchor).isActive = true
        startDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        startDate.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        startStatus.translatesAutoresizingMaskIntoConstraints = false
        startStatus.topAnchor.constraint(equalTo: topAnchor, constant: 400).isActive = true
        startStatus.leadingAnchor.constraint(equalTo: rocketLogo.leadingAnchor).isActive = true
        startStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        startStatus.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        rocketImage.translatesAutoresizingMaskIntoConstraints = false
        rocketImage.topAnchor.constraint(equalTo: topAnchor, constant: 480).isActive = true
        rocketImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        rocketImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        rocketImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        
        videoButton.translatesAutoresizingMaskIntoConstraints = false
        videoButton.topAnchor.constraint(equalTo: topAnchor, constant: 700).isActive = true
        videoButton.leadingAnchor.constraint(equalTo: rocketLogo.leadingAnchor).isActive = true
        videoButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 150).isActive = true
        videoButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        returnButton.topAnchor.constraint(equalTo: topAnchor, constant: 700).isActive = true
        returnButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        returnButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        returnButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -150).isActive = true
    }
}
