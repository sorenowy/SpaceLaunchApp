//
//  DataLoadingView.swift
//  SpaceLaunchApp
//
//  Created by Hubert Kuszyński on 09/07/2021.
//

import Foundation
import UIKit

class DataLoadingView: UIView{
    
    let blur = UIBlurEffect(style: .dark)
    var blurView: UIView = {
        let viewController = UIView()
        viewController.backgroundColor      = .black.withAlphaComponent(0.5)
        return viewController
    }()
    var spinner: UIActivityIndicatorView    = {
        let loadSpinner = UIActivityIndicatorView(style: .large)
        loadSpinner.hidesWhenStopped        = true
        loadSpinner.color                   = .white
        return loadSpinner
    }()
    
    init(){
        super.init(frame: UIScreen.main.bounds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareAndStartLoadingScreen(){
        spinner.center = CGPoint(x: self.bounds.midX,
                                 y: self.bounds.midY)
        blurView.frame = self.frame
        spinner.center = blurView.center
        blurView.addSubview(spinner)
        self.addSubview(blurView)
        spinner.startAnimating()
    }
    
    func stopLoading(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.spinner.stopAnimating()
            self.blurView.removeFromSuperview()
        }
    }
}
