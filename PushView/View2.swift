//
//  View2.swift
//  PushView
//
//  Created by Hoàng Minh Thành on 8/23/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class View2: UIViewController {

    @IBAction func action_pop(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBOutlet weak var tf_user: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var lb_thongbao: UILabel!
    var accounts = ["admin":"admin","user":"user"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Đăng Nhập"
    }
    
    func CheckUser() -> Int {
        let user = tf_user.text
        var dem = 0
        for us in accounts.keys
        {
            if us == user {
                dem = dem + 1
            }
        }
        return dem
    }
    @IBAction func action_dangki(sender: UIButton) {
        let user = String(tf_user.text!)
        let pass = String(tf_password.text!)
        if user == ""
        {
            lb_thongbao.text = "Bạn chưa nhập username mới"
        }
        else
        {
            if pass == ""
            {
                lb_thongbao.text = "Bạn chưa nhập mật khẩu"
            }
            else
            {
                if CheckUser() > 0
                {
                    lb_thongbao.text = "Tài khoản đã tồn tại"
                }
                else
                {
                    accounts["\(user)"] = "\(pass)"
                    lb_thongbao.text = "Đăng kí thành công"
                }
            }
        }
    }
    @IBAction func action_dangnhap(sender: UIButton) {
        let user = String(tf_user.text!)
        let pass = String(tf_password.text!)
        if user == ""
        {
            lb_thongbao.text = "Bạn chưa nhập username"
        }
        else
        {
            if pass == ""
            {
                lb_thongbao.text = "Bạn chưa nhập mật khẩu"
            }
            else
            {
                if let password = accounts[tf_user.text!]
                {
                    if password == tf_password.text
                    {
                        let v3 = self.storyboard?.instantiateViewControllerWithIdentifier("V3") as! View3
                        self.navigationController?.pushViewController(v3, animated: true)
                    }
                    else
                    {
                        lb_thongbao.text = "Mật khẩu không đúng"
                    }
                }
                else
                {
                    lb_thongbao.text = "Tài khoản không tồn tại"
                }
            }
        }

    }
}
