//
//  NameSettingViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/29.
//

import UIKit
import SnapKit
class NameSettingViewController: UIViewController, UITextFieldDelegate {
    
    let nameTextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요"
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    //1
    var nameComplitionHandler: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        view.backgroundColor = .black
        view.addSubview(nameTextField)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(saveButtonClicked))
        setConstraints()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //2
        nameComplitionHandler?(nameTextField.text!)
    }
    
    @objc func saveButtonClicked() {
        print(#function)
        nameComplitionHandler?(nameTextField.text!)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    func setConstraints() {
        nameTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
    }


}

