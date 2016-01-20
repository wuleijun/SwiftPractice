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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

extension RJSignViewExampleVC:RJSignViewDelegate{
    func signViewDidSave(image: UIImage?) {
        displayImageView.image = image
    }
}
