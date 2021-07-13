//
//  ViewController.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 08/07/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let api = SpaceDevsAPI()
    var titleView = TitleLabelView()
    var customTableView = RocketListTableView()
    let logoView = LoadingLogoView()
    let dataLoadingView = DataLoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constants.backgroundColor
        self.view.addSubview(logoView)
        api.loadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.logoView.removeFromSuperview()
            self.view.addSubview(self.titleView)
            self.view.addSubview(self.customTableView)
            self.setupTable()
        }
    }
    
    private func setupTable(){
        customTableView.tableList.delegate = self
        customTableView.tableList.dataSource = self
        customTableView.tableList.register(RocketListCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        self.api.isLoading = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard api.launchUpcoming.results?.count != nil
        else {
            return 0
        }
        return api.launchUpcoming.results!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! RocketListCell
        api.launchUpcoming.results?.sort(by: {$0.formattedNet > $1.formattedNet})
        let rocketData = api.launchUpcoming.results![indexPath.row]
        cell.setData(rocketData: rocketData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        customTableView.tableList.deselectRow(at: indexPath, animated: true)
        let destination = RocketDetailsViewController()
        destination.modalPresentationStyle = .fullScreen
        destination.api = api
        destination.rocketDetails = api.launchUpcoming.results![indexPath.row]
        self.present(destination, animated: true, completion: nil)
    }
}

