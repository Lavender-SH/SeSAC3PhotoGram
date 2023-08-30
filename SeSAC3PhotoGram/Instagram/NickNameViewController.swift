//
//  NickNameViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/29.
//

import UIKit

class NickNameViewController: UIViewController, UITextFieldDelegate {
    //Protocol  값 전달 2
    var nickNameDelegate: NickNameDataDelegate?
    var instaVC = InstagramViewController()
    
    let NickNameTextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요"
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.textColor = .white
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        NickNameTextField.delegate = self
        view.backgroundColor = .black
        view.addSubview(NickNameTextField)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(saveButtonClickedTwo))
        setConstraints()
        

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Protocol  값 전달 3.
        nickNameDelegate?.NickNameData(name: NickNameTextField.text!)
        
    }
    
    @objc func saveButtonClickedTwo() {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func setConstraints() {
        NickNameTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
    }
    
}

