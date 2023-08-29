//
//  InstagramViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/29.
//

import UIKit
import SnapKit
//Protocol  값 전달 1
protocol NickNameDataDelegate {
    func NickNameData(name: String)
}

class InstagramViewController: UIViewController, UITextFieldDelegate {
    
 
    let nameLabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = .white
        label.textAlignment = .left
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    let nameButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let nickNameLabel = {
        let label = UILabel()
        label.text = "닉네임"
        label.textColor = .white
        label.textAlignment = .left
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    let nickNameButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(secondButtonTapped), for: .touchUpInside)
        return button
    }()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(nameLabel)
        view.addSubview(nameButton)
        view.addSubview(nickNameLabel)
        view.addSubview(nickNameButton)
        navigationItem.title = "프로필 편집"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: nil)
        constraints()
    }
    
    @objc func buttonTapped() {
        let vc = NameSettingViewController()
        vc.nameComplitionHandler = { fff in
            self.nameButton.setTitle(fff, for: .normal)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Protocol  값 전달 5
    @objc func secondButtonTapped() {
        let nickNameVC = NickNameViewController()
        nickNameVC.nickNameDelegate = self
        navigationController?.pushViewController(nickNameVC, animated: true)
    }

    
    
    func constraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(200)
            make.leading.equalTo(view).offset(10)
            //make.trailing.equalTo(nameButton.snp.leading).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        nameButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(200)
            make.leading.equalTo(nameLabel.snp.trailing).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(30)
        }
        nickNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            //make.trailing.equalTo(nickNameButton.snp.leading).offset(-10)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        nickNameButton.snp.makeConstraints { make in
            make.top.equalTo(nameButton.snp.bottom).offset(10)
            make.leading.equalTo(nickNameLabel.snp.trailing).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(30)
        }
        
        
    }
}

//Protocol  값 전달 4
extension InstagramViewController: NickNameDataDelegate {
    func NickNameData(name: String) {
        nickNameButton.setTitle(name, for: .normal)    }
    

}

