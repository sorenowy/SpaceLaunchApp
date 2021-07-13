//
//  RocketListTableView.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 13/07/2021.
//

import Foundation
import UIKit

class RocketListTableView: UIView {
    
    var tableList = UITableView()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        prepareList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareList(){
        self.addSubview(tableList)
        tableList.rowHeight = 200
        tableList.layer.cornerRadius = 10
        tableList.translatesAutoresizingMaskIntoConstraints = false
        tableList.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        tableList.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        tableList.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -30).isActive = true
        tableList.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
    }
}
