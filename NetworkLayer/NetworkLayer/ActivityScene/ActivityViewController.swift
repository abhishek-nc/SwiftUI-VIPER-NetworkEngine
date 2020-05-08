//
//  ActivityViewController.swift
//  NetworkLayer
//
//  Created by Abhishek Chandrashekar on 08/05/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {

    weak var presenter: ActivityInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getActivities()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
