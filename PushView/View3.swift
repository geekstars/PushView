//
//  View3.swift
//  PushView
//
//  Created by Hoàng Minh Thành on 8/23/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class View3: UIViewController {

    @IBOutlet weak var lbl_1: UILabel!
    @IBOutlet weak var lbl_2: UILabel!
    @IBOutlet weak var lbl_pheptinh: UILabel!
    @IBOutlet weak var lbl_right: UILabel!
    @IBOutlet weak var lbl_time: UILabel!
    @IBOutlet weak var lbl_wrong: UILabel!
    @IBOutlet weak var btn_1: UIButton!
    @IBOutlet weak var btn_2: UIButton!
    @IBOutlet weak var btn_3: UIButton!
    
    var pheptinh = 1;
    var dung = 0;
    var sai = 0;
    //Bien kq
    var kq : Float = 0.0;
    //Timer
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandom()
        pheptinh = setrdpheptinh()
        startTime()
    }
    @IBAction func btn_action(sender: UIButton) {
        
        if kq == Float((sender.titleLabel?.text)!)!{
            dung = dung + 1;
            lbl_right.text = "Right : \(dung)"
        }
        else{
            sai = sai + 1;
            lbl_wrong.text = "Wrong : \(sai)"
        }
        time = 20
        setRandom()
        pheptinh = setrdpheptinh()
    }
    
    func startTime(){
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(demthoigian), userInfo: nil, repeats: true)
    }
    //Ham dem thoi gian
    var time:Int = 20;
    func demthoigian(){
        time = time - 1
        lbl_time.text = "Time : \(time)";
        if time == 0{
            time = 20
            setRandom()
            pheptinh = setrdpheptinh()
        }
    }
    //Ham random phep tinh
    func setrdpheptinh() -> Int
    {
        return Int(arc4random_uniform(4)+1)
    }
    //ham random 2 so nguyen
    func setRandom(){
        // random so nguyen tu 0 - 3
        // vi cong them 1 nen la random tu 1 - 4
        let random1 = Int(arc4random_uniform(4)+1)
        let random2 = Int(arc4random_uniform(4)+1)
        if pheptinh == 1{
            lbl_pheptinh.text = "+"
            kq = Float(random1) + Float(random2);
        }
        if pheptinh == 2{
            lbl_pheptinh.text = "-"
            kq = Float(random1) - Float(random2);
        }
        if pheptinh == 3{
            lbl_pheptinh.text = "x"
            kq = Float(random1) * Float(random2);
        }
        if pheptinh == 4{
            lbl_pheptinh.text = "/"
            kq = Float(random1) / Float(random2);
        }
        lbl_1.text = String(random1)
        lbl_2.text = String(random2)
        setResult(random1, Randomb: random2)
    }
    // Ham hien thi ket qua
    func setResult(Randoma:Int,Randomb:Int){
        let rdvitri = Int(arc4random_uniform(2)+1)
        if rdvitri == 1
        {
            btn_3.setTitle(String(Randoma), forState: .Normal)
            btn_2.setTitle(String(Randomb), forState: .Normal)
            if pheptinh == 1
            {
                btn_1.setTitle(String(sum(Randoma,p2:Randomb)), forState: .Normal)
            }
            if pheptinh == 2
            {
                btn_1.setTitle(String(hieu(Randoma,p2:Randomb)), forState: .Normal)
            }
            if pheptinh == 3
            {
                btn_1.setTitle(String(tich(Randoma,p2:Randomb)), forState: .Normal)
            }
            if pheptinh == 4
            {
                btn_1.setTitle(String(format: "%.1f",thuong(Randoma,p2:Randomb)), forState: .Normal)
            }
        }
        if rdvitri == 2
        {
            btn_1.setTitle(String(Randoma), forState: .Normal)
            btn_3.setTitle(String(Randomb), forState: .Normal)
            if pheptinh == 1
            {
                btn_2.setTitle(String(sum(Randoma,p2:Randomb)), forState: .Normal)
            }
            if pheptinh == 2
            {
                btn_2.setTitle(String(hieu(Randoma,p2:Randomb)), forState: .Normal)
            }
            
            if pheptinh == 3
            {
                btn_2.setTitle(String(tich(Randoma,p2:Randomb)), forState: .Normal)
            }
            if pheptinh == 4
            {
                btn_2.setTitle(String(format: "%.1f",thuong(Randoma,p2:Randomb)), forState: .Normal)
            }
        }
        if rdvitri == 2
        {
            btn_1.setTitle(String(Randoma), forState: .Normal)
            btn_2.setTitle(String(Randomb), forState: .Normal)
            if pheptinh == 1
            {
                btn_3.setTitle(String(sum(Randoma,p2:Randomb)), forState: .Normal)
            }
            if pheptinh == 2
            {
                btn_3.setTitle(String(hieu(Randoma,p2:Randomb)), forState: .Normal)
            }
            
            if pheptinh == 3
            {
                btn_3.setTitle(String(tich(Randoma,p2:Randomb)), forState: .Normal)
            }
            if pheptinh == 4
            {
                btn_3.setTitle(String(format: "%.1f",thuong(Randoma,p2:Randomb)), forState: .Normal)
            }
        }
    }

    func sum(p1:Int,p2:Int) -> Int
    {
        return p1+p2
    }
    func hieu(p1:Int,p2:Int) -> Int
    {
        return p1-p2
    }
    func tich(p1:Int,p2:Int) -> Int
    {
        return p1*p2
    }
    func thuong(p1:Int,p2:Int) -> Float
    {
        return (Float(p1)/Float(p2))
    }
}
