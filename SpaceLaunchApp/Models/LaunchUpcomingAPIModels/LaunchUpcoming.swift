//
//  LaunchUpcoming.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 08/07/2021.
//

import Foundation

struct LaunchUpcoming: Decodable {
    
    var results: [LaunchUpcomingDetails]?
    
    init(){
        results = nil
    }
}
