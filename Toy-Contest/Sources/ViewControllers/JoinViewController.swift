//
//  JoinViewController.swift
//  Toy-Contest
//
//  Created by LeeSeungsoo on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func join(_ sender: Any) {
        guard let nickname = nicknameTextField.text else { return }
        if nickname.isEmpty {
            simpleAlert(title: "입력 오류", message: "닉네임을 입력해주세요.", completion:  nil)
        } else {
            simpleAlert(title: "회원 가입 완료", message: "환영합니다!") { _ in
                self.dismiss(animated: true)
            }
        }
    }
    


}
