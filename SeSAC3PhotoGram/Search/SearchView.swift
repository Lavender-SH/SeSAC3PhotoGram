//
//  SearchView.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/28.
//

import UIKit


class SearchView: BaseView {
    
    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        return view
    }()
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
//      view.collectionViewLayout = UICollectionViewFlowLayout() 이렇게 하면 디폴트 값이 나와서 한줄에 6개가 나옴 내가한게 적용이 안되어짐
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()

    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let size = UIScreen.main.bounds.width - 40 //self.frame.width - 40
        layout.itemSize = CGSize(width: size / 4, height: size / 4)
        return layout
    }
    
    override func configureView() {
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    
    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
    
    
    
}
