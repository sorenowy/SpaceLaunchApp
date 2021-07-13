//
//  RocketConfiguration.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 08/07/2021.
//

import Foundation

struct RocketConfiguration: Decodable {
    var full_name: String? {
        let name = self.full_name ?? "rakieta nieznana"
        return name
    }
}
