//
//  SearchViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/28.
//
import UIKit

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    let imageList = ["pencil", "star", "person", "star.fill", "xmark", "person.circle"]

    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addObserver보다 post가 먼저 신호를 보내면 addObserver가 신호를 받지 못한다!
        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserver(notification:)), name: NSNotification.Name("RecommandKeyword"), object: nil)
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
               
                                    
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(imageList[indexPath.item])
        
        NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: ["name" : imageList[indexPath.item], "sample": "고래밥"])
        
        dismiss(animated: true)
    }
    
    
    
}
