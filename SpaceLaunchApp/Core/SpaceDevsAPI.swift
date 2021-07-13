//
//  SpaceDevsAPI.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 08/07/2021.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class SpaceDevsAPI {
    
    var limitCount = 20
    var offsetCount = 0
    var isLoading = true
    var launchUpcoming = LaunchUpcoming()
    var selectedIdDetails = RocketSelectedId()
    
    func loadData() {
        let parameters = ["limit": String(limitCount), "offset": String(offsetCount)
        ]
        let request = AF.request(Constants.url, method: .get, parameters: parameters).validate()
        
        request.responseDecodable(of: LaunchUpcoming.self){
            (response) in
            switch response.result {
            case .success:
                let launchData = response.value!
                self.launchUpcoming = launchData
                self.limitCount = self.offsetCount
                self.offsetCount += 20
                print("Validation successful")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadIdData(id: String) {
        var url = Constants.url
        url += id
        
        let request = AF.request(url).validate()
        request.responseDecodable(of: RocketSelectedId.self) {
            (response) in
            switch response.result {
            case .success:
                let details = response.value!
                self.selectedIdDetails = details
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadImage(selected: LaunchUpcomingDetails) -> UIImageView
    {
        let result = UIImageView()
        let url = URL(string: selected.image!)
        
        result.af.setImage(withURL: url!)
        
        return result
    }
}
