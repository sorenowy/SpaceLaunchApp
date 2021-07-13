//
//  RocketListViewController.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 09/07/2021.
//

import Foundation
import UIKit

class RocketDetailsViewController: UIViewController {
    
    var api = SpaceDevsAPI()
    var rocketDetails: LaunchUpcomingDetails?
    var rocketDetailsView = RocketView()
    var loadingScreen = DataLoadingView()
    var webUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingScreen = DataLoadingView()
        self.view.backgroundColor = .white
        self.view.addSubview(rocketDetailsView)
        self.view.addSubview(loadingScreen)
        self.loadingScreen.prepareAndStartLoadingScreen()
        api.loadIdData(id: rocketDetails!.id)
        rocketDetailsView.rocketImage = api.loadImage(selected: rocketDetails!)
        rocketDetailsView.setViewConstraints()
        rocketDetailsView.setData(data: rocketDetails!)
        rocketDetailsView.videoButton.addTarget(self, action: #selector(loadVideo), for: .touchUpInside)
        rocketDetailsView.returnButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.validateURL(url: (self.api.selectedIdDetails.vidURLs?.first?.url) ?? "")
            self.loadingScreen.stopLoading()
            self.loadingScreen.removeFromSuperview()
        }
    }
    
    func validateURL(url: String) {
        guard url != ""
        else{
            rocketDetailsView.videoButton.isHidden = true
            return
        }
        self.webUrl = URL(string: url)
        rocketDetailsView.videoButton.isHidden = false
    }
    
    @objc func loadVideo() {
        UIApplication.shared.open(self.webUrl!)
    }
    
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
}
