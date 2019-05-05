//
//  JoinViewController.swift
//  Toy-Contest
//
//  Created by LeeSeungsoo on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var nicknameView: UIView!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var nicknameViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var joinBtn: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logoText: UILabel!
    
    var check = true
    var constraintInitValue: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterForKeyboardNotifications()
    }
    
    func setupView() {
        nicknameView.layer.cornerRadius = nicknameView.frame.height / 2
        joinBtn.layer.cornerRadius = joinBtn.frame.height / 2
        joinBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        joinBtn.layer.shadowRadius = 6
        joinBtn.layer.shadowColor = UIColor.black.cgColor
        joinBtn.layer.shadowOpacity = 0.25
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
    
    @IBAction func backToLogin(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension JoinViewController: UIGestureRecognizerDelegate {
    func initGestureRecognizer() {
        let mainTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mainTap.delegate = self
        view.addGestureRecognizer(mainTap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.nicknameTextField.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: nicknameTextField))! {
            return false
        }
        return true
    }
}

extension JoinViewController {
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if check {
            if let info = notification.userInfo {
                let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
                let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
                self.constraintInitValue = self.nicknameViewConstraint.constant
                UIView.animate(withDuration: duration) { () -> Void in
                    self.nicknameViewConstraint.constant = -100
                    self.logoImage.alpha = 0
                    self.logoText.alpha = 0
                    self.view.layoutIfNeeded()
                }
            }
            check = false
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let info = notification.userInfo {
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            UIView.animate(withDuration: duration) { () -> Void in
                self.nicknameViewConstraint.constant = self.constraintInitValue
                self.logoImage.alpha = 1
                self.logoText.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
        check = true
    }
}
