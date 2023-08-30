//
//  SearchViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/28.
//
import UIKit


class SearchViewController: BaseViewController {
    
    
    let mainView = SearchView()
    let addVC = AddViewController()
    let imageList = ["pencil", "star", "person", "star.fill", "xmark", "person.circle"]
    
    var delegate: PassImageDelegate?
    var didSelectImageClosure: ((UIImage) -> Void)?
    var selectedImage: UIImage?
    var rawUrls: [String] = []
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addObserver보다 post가 먼저 신호를 보내면 addObserver가 신호를 받지 못한다!
        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserver(notification:)), name: NSNotification.Name("RecommandKeyword"), object: nil)
        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
            didSelectImageClosure = { [weak self] selectedImage in
                self?.addVC.mainView.photoImageView.image = selectedImage
                
                //self?.addphotoImageView.image = selectedImage
            }
            navigationController?.pushViewController(addVC, animated: true)
            
        
    }

    
    @objc func recommandKeywordNotificationObserver(notification: NSNotification) {
        print("recommandKeywordNotificationObserver")
        
    }
    
    override func configureView() { //addSubView
        super.configureView()
        
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        
        SearchPhotoAPI.shared.callRequest(query: query) { rawUrls in
            DispatchQueue.main.async {
                self.rawUrls = rawUrls
                self.mainView.collectionView.reloadData()
            }
        }
        
        searchBar.resignFirstResponder()
    }
}



extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rawUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.imageView.image = nil
        
        // 갤러리에서 가져온 이미지 설정
        if let selectedImage = selectedImage {
            cell.imageView.image = selectedImage
        }
        
        // 웹에서 가져온 이미지 설정
        if indexPath.item < rawUrls.count {
            if let imageUrl = URL(string: rawUrls[indexPath.item]) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl),
                       let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            cell.imageView.image = image
                        }
                    }
                }
            }
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(rawUrls[indexPath.item])
        
        //delegate?.receiveImage(image: UIImage(systemName: imageList[indexPath.item])!)
        //Notification을 통한 값전달
        //NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: ["name" : imageList[indexPath.item], "sample": "고래밥"])
        if let selectedImage = UIImage(systemName: imageList[indexPath.item]) {
                didSelectImageClosure?(selectedImage)
            }
        
        dismiss(animated: true)
    }
    
}


