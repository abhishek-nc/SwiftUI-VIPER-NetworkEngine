//
//  ActivityPresenter.swift
//  NetworkLayer
//
//  Created by Abhishek Chandrashekar on 08/05/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation
import SwiftUI

class ActivityPresenter {
    
    var interactor = ActivityInteractor()
    var view: ActivityView?
    
    init() {
        interactor.presenter = self
    }
    
    func getActivity() {
        interactor.getActivities()
    }
    
    func showError(error:NLError) {
        
    }
    
    func showActivties(activity:Activity) {
        view?.activity = activity
    }
    
}

class ActivityInteractor {
    var activity : Activity?
    weak var presenter : ActivityPresenter?
    
    
    func getActivities()  {
        ActivityServiceWorker.fetchActivities { (result, error) in
            guard let _activity = result, error != nil else {
                self.presenter?.showError(error: error!)
                return
            }
            self.activity = _activity
            self.presenter?.showActivties(activity: _activity)
        }
    }

}
