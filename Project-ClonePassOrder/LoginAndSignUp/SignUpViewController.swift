//
//  SignUpEmailController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/16.
//

import UIKit

enum SignUpState {
    case email
    case password
    case passwordConfirm
    case phoneNumber
}

class SignUpViewController: UIViewController {
    
    //MARK: - 프로퍼티
    
    private var signUpState: SignUpState = .email
    private var textFieldText: String = "이메일"
    private var textFieldPlaceHolder: String = "passorder@gmail.com"
    private var phoneNumberConfirmTextField: UITextField?
    private let welcomeView: UIView = UIView().welcomeView()
    private let nextButton: UIButton = UIButton().nextButton()
    private var phoneNumberConfirmButton: UIButton?
    private lazy var textField: UITextField = UITextField().signUpTextField(
        text: textFieldText,
        placeholder: textFieldPlaceHolder
    )
    
    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviSetAttribute()
        setAtrribute()
        setLayout()
    }
    
    //MARK: - 셀렉터메서드
    
    @objc private func nextButtonTapped() {
        pushNextView()
    }
    @objc private func phoneNumberConfirmButtonTapped() {
        guard let phoneNumberConfirmTextField = phoneNumberConfirmTextField else {
            return
        }
        view.addSubview(phoneNumberConfirmTextField)
        phoneNumberConfirmTextField.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        nextButton.snp.removeConstraints()
        self.nextButtonSetLayout(
            view: view,
            button: nextButton,
            topView: phoneNumberConfirmTextField
        )
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        self.welcomViewSetLayout(view: view, welcomeView: welcomeView)
        if signUpState == .phoneNumber {
            guard let phoneNumberConfirmButton = phoneNumberConfirmButton else {
                return
            }
            [phoneNumberConfirmButton,textField].forEach {
                view.addSubview($0)
            }
            phoneNumberConfirmButton.snp.makeConstraints { make in
                make.top.equalTo(welcomeView.snp.bottom).offset(100)
                make.trailing.equalToSuperview().offset(-20)
                make.width.equalTo(80)
            }
            textField.snp.makeConstraints { make in
                make.top.equalTo(welcomeView.snp.bottom).offset(100)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalTo(phoneNumberConfirmButton.snp.leading).offset(-20)
            }
            self.nextButtonSetLayout(view: view, button: nextButton, topView: textField)
        } else {
            self.textFieldSetLayout(view: view, textField: textField, topView: welcomeView)
            self.nextButtonSetLayout(view: view, button: nextButton, topView: textField)
        }
    }
    private func setAtrribute() {
        view.backgroundColor = .systemBackground
        textField.delegate = self
        textField.becomeFirstResponder()
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        if signUpState == .phoneNumber {
            phoneNumberConfirmButton = UIButton().emailLoginButton(
                text: "확인",
                image: nil ,
                height: 40
            )
            guard let phoneNumberConfirmButton = phoneNumberConfirmButton else {
                return
            }
            phoneNumberConfirmTextField = UITextField().signUpTextField(
                text: "인증번호 입력",
                placeholder: "인증번호 6자리 입력"
            )
            phoneNumberConfirmButton.addTarget(
                self,
                action: #selector(phoneNumberConfirmButtonTapped),
                for: .touchUpInside
            )
        }
    }
    private func naviSetAttribute() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .black
    }
    private func pushNextView() {
        let vc = SignUpViewController()
        switch signUpState {
        case .email:
            vc.signUpState = .password
            vc.textFieldText = "비밀번호"
            vc.textFieldPlaceHolder = "영문 + 특수문자 + 숫자8자리이상"
            navigationController?.pushViewController(vc, animated: true)
        case .password:
            vc.signUpState = .passwordConfirm
            vc.textFieldText = "비밀번호 한번더 입력"
            vc.textFieldPlaceHolder = "비밀번호 한번더 입력"
            navigationController?.pushViewController(vc, animated: true)
        case .passwordConfirm:
            vc.signUpState = .phoneNumber
            vc.textFieldText = "휴대폰으로 인증"
            vc.textFieldPlaceHolder = "- 없이번호만입력"
            navigationController?.pushViewController(vc, animated: true)
        case .phoneNumber:
            let vc = AgreementViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//MARK: - 텍스트필드 델리게이트

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushNextView()
        return true
    }
}
