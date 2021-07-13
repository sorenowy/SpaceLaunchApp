//
//  LaunchUpcomingDetails.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 08/07/2021.
//

import Foundation
import UIKit

struct LaunchUpcomingDetails: Decodable {
    var id: String
    var name: String
    var net: String
    var formattedNet: String{
        var date = Date()
        let resultDateFormatter = DateFormatter()
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        inputDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        date = inputDateFormatter.date(from: net) ?? Date()
        resultDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        resultDateFormatter.locale = Locale(identifier: "pl")
        return resultDateFormatter.string(from: date)
    }
    var status: LaunchUpcomingStatus
    var rocket: Rocket
    var launch_service_provider: LaunchServiceProvider
    var pad: Launchpad?
    var image: String?
}
