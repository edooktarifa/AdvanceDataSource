//
//  DetailViewController.swift
//  AdvanceDataSource
//
//  Created by Phincon on 20/04/23.
//

import UIKit

class DetailViewController: UIViewController {

    var handler: ((Int) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        handler = {
            [weak self] _ in
            print(self)
        }
    }

}
