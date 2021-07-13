//
//  SelectedIdRocket.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 11/07/2021.
//

import Foundation

struct RocketSelectedId: Decodable {
    
    var vidURLs: [URLDetails]?
    
    init(){
        vidURLs = nil
    }
}
