//
//  ViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/28.
//

import UIKit
import SeSACFramework

//Protocol 값전달. 1.
protocol PassDataDelegate {
    func receiveData(date: Date)
}

protocol PassImageDelegate {
    func receiveImage(image: UIImage)
    
//    if let name = notification.userInfo?["name"] as? String {
//        mainView.photoImageView.image = UIImage(systemName: name)
//    }
}

class AddViewController: BaseViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var networkManager = SearchPhotoAPI.shared
    
    let realView = AddView()
    
    override func loadView() { //viewDidLoad보다 먼저 호출됨, super 메서드 호출 x
        self.view = realView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configureView()
        //setConstraints()
//        ClassOpenExample.privateExample()
//        ClassPublicExample.publicExample()
//        ClassInternalExample.
        
        APIService.shared.callRequeset()
//        SearchPhotoAPI.shared.callRequest(query: "universe") { rawUrls in
//            if let firstRawUrl = rawUrls.first {
//                DispatchQueue.global().async {
//                    if let imageUrl = URL(string: firstRawUrl),
//                       let imageData = try? Data(contentsOf: imageUrl),
//                       let image = UIImage(data: imageData) {
//                        DispatchQueue.main.async {
//                            self.mainView.photoImageView.image = image
//                        }
//                    }
//                }
//            }
//        }
    
        
    }
    deinit {
        print("deinit", self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        //NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: NSNotification.Name("SelectImage"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //NotificationCenter.default.removeObserver(self, name: NSNotification.Name("SelectImage"), object: nil)
    }
    
//    @objc func selectImageNotificationObserver(notification: NSNotification) {
//        print(#function)
//        print("selectImageNotificationObserver")
//        print(notification.userInfo?["name"])
//        print(notification.userInfo?["sample"])
//
//        if let name = notification.userInfo?["name"] as? String {
//            realView.photoImageView.image = UIImage(systemName: name)
//        }
//    }
    //⭐️⭐️⭐️⭐️⭐️
    @objc func searchButtonClicked() {
//        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]
//        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word": word.randomElement()!])
        
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let galleryAction = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            
            //self.navigationController?.pushViewController(SearchViewController(), animated: true)
        }
        //⭐️⭐️⭐️⭐️⭐️⭐️⭐️
        let webSearchAction = UIAlertAction(title: "웹에서 검색하기", style: .default) { _ in
            //let vc = SearchViewController()
//            vc.didSelectImageClosure { data in
//            }
            let searchVC = SearchViewController()
            searchVC.didSelectImageClosure = { webSelectedImage in
            searchVC.webSelectedImage = webSelectedImage
                self.realView.photoImageView.image = webSelectedImage
            }

            self.navigationController?.pushViewController(searchVC, animated: true)
            
           
        }
    
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        actionSheet.addAction(galleryAction)
        actionSheet.addAction(webSearchAction)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            picker.dismiss(animated: true, completion: nil)
            
            let searchVC = SearchViewController()
            searchVC.selectedImage = selectedImage
            print(selectedImage)
            
            realView.photoImageView.image = selectedImage
            //navigationController?.pushViewController(searchVC, animated: true)
        }
    }
    
    
    
    override func configureView() { //addSubView
        super.configureView()
        print("Add ConfigureView")
        view.backgroundColor = .white
        realView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        realView.dateButton.addTarget(self, action: #selector(dateButtonClicked), for: .touchUpInside)
        realView.searchProtocolButton.addTarget(self, action: #selector(searchProtocolButtonClicked), for: .touchUpInside)
        realView.titleButton.addTarget(self, action: #selector(titleButtonClicked), for: .touchUpInside)
        realView.plusButton.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
        
        APIService.shared.callRequeset()
        
    }
    
//    func presentSearchViewController() {
//        let searchVC = SearchViewController()
//        searchVC.didSelectImageClosure = { [weak self] selectedImage in
//            self?.mainView.photoImageView.image = selectedImage
//        }
//        //navigationController?.pushViewController(searchVC, animated: true)
//        
//    }
    
    @objc func plusButtonClicked() {
        let vc = ContentViewController()
        vc.dataPass = { gg in
            self.realView.plusButton.setTitle(gg, for: .normal)
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    //Closure - 3
    @objc func titleButtonClicked() {
        let vc = TitleViewController()
        vc.completionHandler = { title, age, push in
            self.realView.titleButton.setTitle(title, for: .normal)
            print("completionHandler", age, push)
            
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func dateButtonClicked() {
        //Protocol 값 전달 5
//        let vc = DateViewController()
//        vc.delegate = self
//        navigationController?.pushViewController(vc, animated: true)
        
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func searchProtocolButtonClicked() {
        let vc = SearchViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    
    override func setConstraints() { //제약조건
        super.setConstraints()
        print("Add SetConstraitns")

    }
    
}

//Protocol 값 전달 4
extension AddViewController: PassDataDelegate {
    func receiveData(date: Date) {
        realView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
    }
    

}

extension AddViewController: PassImageDelegate {
    func receiveImage(image: UIImage) {
        realView.photoImageView.image = image
    }
        
    }
    



