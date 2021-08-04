//
//  ViewController.swift
//  jfxdemo
//
//  Created by 程言方 on 2021/8/3.
//

import UIKit
import liberate
import hhVDoctorSDK
import QMUIKit

class ViewController: UIViewController {

    @IBOutlet weak var mUserTokenEdit: UITextField!
    @IBOutlet weak var mDevelopSwitch: UISwitch!
    
    let DefaultUserToken = "69831AA2CD985438D1DB957A1D079FB13F0D04F68EA2608F6783B874E4F50EEF"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "解放行Demo"
        initView()
    }

    private func initView() {
        mUserTokenEdit.text = DefaultUserToken
        mDevelopSwitch.setOn(BaseConfig.developState(), animated: true)
        mDevelopSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
    }
    
    @objc func switchChanged() {
        BaseConfig.setDevelopState(mDevelopSwitch.isOn)
    }

    @IBAction func onClickLogin(_ sender: Any) {
        if let userToken = mUserTokenEdit.text,!userToken.isEmpty {
            HHMSDK.default.login(userToken: userToken) { [weak self] in
                if let error = $0 {
                    let e = "登录失败：\(error)"
                    
                    self?.showError(e)
                    print(e)
                } else {
                    let succ = "登录成功:\(HHMSDK.default.userToken ?? "")"
                    self?.showSuccess(succ)
                    print(succ)
                }
            }
        } else {
            showError("请输入userToken")
        }
        
    }
    
    @IBAction func onClickLiberate(_ sender: Any) {
        if let nav = self.navigationController {
            HHLiberate.rescue(nav)
        }
    }
    
    @IBAction func onClickCall(_ sender: Any) {
        if let nav = self.navigationController {
            HHLiberate.callDcotor(nav, userExt: "call ext")
        } else {
            
        }
        
    }
    
    func showSuccess(_ mes:String) {
        if let v = self.view {
            QMUITips.showSucceed(mes,in: v)
        }
    }
    
    func showError(_ mes:String) {
        if let v = self.view {
            QMUITips.showError(mes,in: v)
        }
    }
}

