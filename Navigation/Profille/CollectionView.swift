//
//  CollectionView.swift
//  Navigation
//
//  Created by Alexander Batyshev on 19.01.2023.
//

import UIKit

class CollectionView: UICollectionView {
    
    var photosCollection = ["photo1", "photo2", "photo3", "photo4", "photo5", "photo6", "photo7", "photo8", "photo9", "photo10", "photo11", "photo12", "photo13", "photo14", "photo15", "photo16", "photo17", "photo18", "photo19", "photo20", "photo21"]

    init() {
        let layoutCollectiomView = UICollectionViewFlowLayout()
        layoutCollectiomView.scrollDirection = .vertical
        layoutCollectiomView.minimumLineSpacing = 8
        layoutCollectiomView.minimumInteritemSpacing = 8
        layoutCollectiomView.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        super.init(frame: .zero, collectionViewLayout: layoutCollectiomView)
        register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.cellID)
        dataSource = self
        delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 32) / 3 , height: (UIScreen.main.bounds.width - 32) / 3)
    }
}

extension CollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosCollection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.cellID, for: indexPath) as! PhotosCollectionViewCell
        cell.photo.image = UIImage(named: photosCollection[indexPath.item])
        return cell
    }
}
