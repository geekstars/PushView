//
//  ViewController.swift
//  PushView
//
//  Created by Hoàng Minh Thành on 8/23/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var lb_zing: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBAction func action_push(sender: UIButton) {
        let v2 = self.storyboard?.instantiateViewControllerWithIdentifier("V2") as! View2
        self.navigationController?.pushViewController(v2, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.alpha = 0
        lb_zing.alpha = 0
        lb_name.alpha = 0
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animateWithDuration(4, animations:
            {
                self.logo.alpha = 1
                UIView.animateWithDuration(8, animations: {
                    self.logo.transform = CGAffineTransformMakeRotation(CGFloat(360))
                })
        }) { (finished) in
            UIView.animateWithDuration(3, animations: {
                self.lb_zing.center = CGPointMake(self.logo.center.x, 120)
                self.lb_zing.alpha = 1
            }) { (finished) in
                UIView.animateWithDuration(3, animations: {
                    self.lb_name.center = CGPointMake(self.logo.center.x, 510)
                    self.lb_name.alpha = 1
                }) { (finished) in
                    let v2 = self.storyboard?.instantiateViewControllerWithIdentifier("V2") as! View2
                    self.navigationController?.pushViewController(v2, animated: true)
                    }
            }
        }
        
    }
}

