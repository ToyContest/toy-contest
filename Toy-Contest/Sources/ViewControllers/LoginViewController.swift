//
//  LoginViewController.swift
//  Toy-Contest
//
//  Created by LeeSeungsoo on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logoConstraint: NSLayoutConstraint!
    @IBOutlet weak var nicknameView: UIView!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var nicknameViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginBtn: UIButton!
    
    var timer: Timer!
    var logoConstraintInitValue: CGFloat = 0
    var constraintInitValue: CGFloat = 0
    var check = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
        self.addTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterForKeyboardNotifications()
        self.invalidTimer()
    }
    
    func setupView() {
        nicknameView.layer.cornerRadius = nicknameView.frame.height / 2
        loginBtn.layer.cornerRadius = loginBtn.frame.height / 2
        loginBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        loginBtn.layer.shadowRadius = 6
        loginBtn.layer.shadowColor = UIColor.black.cgColor
        loginBtn.layer.shadowOpacity = 0.25
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    @objc func login() {
        guard let nickname = nicknameTextField.text else { return }
        if nickname.isEmpty {
            simpleAlert(title: "입력 오류", message: "닉네임을 입력해주세요.", completion:  nil)
        } else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "category") as? SelectCategoryViewController {
                present(vc, animated: true)
            }
        }
    }
    
    @IBAction func goToJoinView(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "join") as? JoinViewController {
            present(vc, animated: true)
        }
    }
    
    func addTimer() {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(3.7), target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
    func invalidTimer() {
        timer.invalidate()
    }
    
    @objc func handleTimer() {
        print("ddd")
        UIView.animate(withDuration: 1.7, delay: 0, options: .curveEaseInOut, animations: {
            self.logoImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (_) in
            UIView.animate(withDuration: 1.7, delay: 0.1, options: .curveEaseInOut, animations: {
                self.logoImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
        self.view.layoutIfNeeded()
        
    }

}

extension LoginViewController: UIGestureRecognizerDelegate {
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

extension LoginViewController {
    
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
                self.view.layoutIfNeeded()
            }
        }
        check = true
    }
}
