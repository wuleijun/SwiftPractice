//
//  RJSignViewExample.swift
//  SwiftPractice
//
//  Created by 吴蕾君 on 16/1/20.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class RJSignViewExampleVC: UIViewController {

    @IBOutlet weak var signView: RJSignView!
    @IBOutlet weak var displayImageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RJSignView"
        signView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: -RJSignViewDelegate
extension RJSignViewExampleVC:RJSignViewDelegate{
    func signViewDidSave(image: UIImage?) {
        displayImageView.image = image
    }
}
