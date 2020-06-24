//
//  NewsController+Binder.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//
import Foundation
extension NewsController {
    func viewModelBinder() {
        guard let viewModel = newsViewModel else { return }
        viewModel.isFetchingAPI.bind { [weak self] (isUpdatingAPI) in
            guard let selfObject = self,let isUpdatingAPI = isUpdatingAPI else { return }
            selfObject.updateActivityIndicatorAnimation(isUpdatingAPI)
        }
    }
    
    func updateActivityIndicatorAnimation(_ shouldAnimate : Bool) {
        DispatchQueue.main.async {
            shouldAnimate ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = !shouldAnimate
        }
        
    }
}
