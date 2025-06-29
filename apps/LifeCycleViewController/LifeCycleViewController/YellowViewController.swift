//
//  YellowViewController.swift
//  LifeCycleViewController
//
//  Created by Debash on 07.05.2018.
//  Copyright © 2018 swiftbook.ru. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! GreenViewController
        dvc.someProperties = "someProperties"
    }

}

