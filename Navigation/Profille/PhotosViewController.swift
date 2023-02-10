//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Alexander Batyshev on 19.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layoutCollectiomView = UICollectionViewFlowLayout()
        layoutCollectiomView.scrollDirection = .vertical
        layoutCollectiomView.minimumLineSpacing = 8
        layoutCollectiomView.minimumInteritemSpacing = 8
        layoutCollectiomView.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutCollectiomView)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.cellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    let transparentView: UIView = {
        var transperentView = UIView()
        transperentView.backgroundColor = .black
        transperentView.alpha = 0
        return transperentView
    }()

    let photoView: UIImageView = {
        var photoView = UIImageView()
        photoView.clipsToBounds = true
        photoView.contentMode = .scaleAspectFill
        photoView.alpha = 0.0
        return photoView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closePhoto))
        navigationItem.rightBarButtonItem?.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = true
        self.view.addSubview(collectionView)
        self.view.addSubview(transparentView)
        self.view.addSubview(photoView)
        createCollectionViewConstraints()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    private func createCollectionViewConstraints() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        photoView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            transparentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transparentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photoView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            photoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 32) / 3 , height: (UIScreen.main.bounds.width - 32) / 3)
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosCollection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.cellID, for: indexPath) as! PhotosCollectionViewCell
        cell.photo.image = UIImage(named: photosCollection[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        photoView.image = UIImage(named: photosCollection[indexPath.row])

        navigationItem.rightBarButtonItem?.isHidden = false
        UIView.animate(withDuration: 1) { [self] in
            photoView.alpha = 1
            transparentView.alpha = 0.7
        }
    }

    @objc func closePhoto(){
        navigationItem.rightBarButtonItem?.isHidden = true
        UIView.animate(withDuration: 1) { [self] in
            photoView.alpha = 0
            transparentView.alpha = 0
        }
    }
}
