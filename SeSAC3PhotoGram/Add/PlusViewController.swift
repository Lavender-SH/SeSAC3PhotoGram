//
//  PlusViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/29.
//

//import UIKit
//
//class PlusViewController: BaseViewController {
//
//    let textField2 = {
//        let view = UITextView()
//        //view.placeholder = "오늘 좋니?"
//        view.backgroundColor = .lightGray
//        return view
//    }()
//
//    let sampleView = {
//        let view = UIView()
//        view.backgroundColor = .yellow
//        return view
//    }()
//
//    let greenView = {
//        let view = UIView()
//        view.backgroundColor = .systemGreen
//        return view
//    }()
//
//    var dataPass: ((String) -> Void)?
//
//    deinit {
//        print("deinit", self)
//    }
//
//    func setAnimation() {
//        //시작
//        sampleView.alpha = 0
//        greenView.alpha = 0
//        UIView.animate.(withDuration: 1, delay: 2, options: [.repeat, .autoreverse]
//        self.sampeView.alpha =
//        self.sampleViewl.backgroundColor = .blue
//        UIView.animate(withDuration: 3) {
//            self.sampleView.alpha = 1
//        }
//                        //끝
//}
//
//                        override func configureView() {
//            super.configureView()
//
//            view.addSubview(textField2)
//            view.addSubview(sampleView)
//            view.addSubview(greenView)
//            setAnimation()
//        }
//
//                        override func setConstraints() {
//
//            greenView.snp.makeConstraints { make in
//                make.size.equalTo(100)
//                make.center.equalTo(view).offset(80)
//
//            }
//            sampleView.snp.makeConstraints { make in
//                make.size.equalTo(100)
//                make.center.equalTo(view)
//            }
//
//            textField2.snp.makeConstraints { make in
//                make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
//                make.height.equalTo(250)
//            }
//        }
//
//                        override func viewDidDisappear(_ animated: Bool) {
//            super.viewDidDisappear(animated)
//
//            //Closure - 2
//            dataPass?(textField2.text!)
//
//
//        }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//            DispatchQueue.main.async {
//                self.greenView.alpha = 1.0
//                UIView.animate(withDuration: 0.3) {
//                    self.greenView.alpha = 0.5
//                }
//
//            }
//
//        }
//                        }
//    override func touchesEnded(T##Set<UITouch>, with: T##UIEvent?)
//                        dispatchque
//
//
//                        }
                        
                        
                        
import UIKit
class ContentViewController: BaseViewController {
    
    let textField = {
        let view = UITextView()
        view.backgroundColor = .brown
        //    view.placeholder = ” 제목을 입력해주세요”
        //    view.layer.cornerRadius = 10
        //    view.clipsToBounds = true
        //    view.layer.borderColor = UIColor.black.cgColor
        //    view.layer.borderWidth = 1
        return view
    }()
    
    let yellowView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let pinkView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    // Closure - 1
    var completionHandler: ((String) -> Void)?
    var dataPass: ((String) -> Void)?
    
    func setAnimation() {
        // 시작
        yellowView.alpha = 0
        pinkView.alpha = 0
        // 끝
        UIView.animate(withDuration: 1, delay: 2, options: .curveLinear) {
            self.yellowView.alpha = 1
            self.yellowView.backgroundColor = .systemBlue
        } completion: { bool in
            UIView.animate(withDuration: 1) {
                self.pinkView.alpha = 1
            }
        }
    }
    
    override func configureView() {
        super.configureView()
        view.addSubview(textField)
        view.addSubview(yellowView)
        view.addSubview(pinkView)
        setAnimation()
    }
    
    override func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(200)
        }
        yellowView.snp.makeConstraints {
            $0.size.equalTo(150)
            $0.center.equalTo(view)
        }
        pinkView.snp.makeConstraints { make in
            make.size.equalTo(150)
            make.center.equalTo(view).offset(80)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Closure - 2
        completionHandler?(textField.text!)
    }
    
    deinit {
        print("메모리 해제", self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.pinkView.alpha = 1.0
            UIView.animate(withDuration: 0.3) {
                self.pinkView.alpha = 0.5
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.pinkView.alpha = 0.5
            UIView.animate(withDuration: 0.3) {
                self.pinkView.alpha = 1.0
            }
        }
    }
}

