//
//  HomeViewController.swift
//  YoutubeApp
//
//  Created by Artiom on 20.08.25.
//
import UIKit

protocol HomeViewProtocol: AnyObject {
    func reloadData()
}

final class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomeViewPresenterProtocol!
    
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(FilterCell.self, forCellWithReuseIdentifier: FilterCell.reuseIdentifier)
        $0.register(VideoCell.self, forCellWithReuseIdentifier: VideoCell.reuseIdentifier)
        $0.register(ShortCell.self, forCellWithReuseIdentifier: ShortCell.reuseIdentifier)
        
        $0.register(ShortsHeaderView.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: ShortsHeaderView.reuseIdentifier)
        
        $0.backgroundColor = .white
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))

    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:
                return self.setModeSection()
            case 1:
                return self.setVideoSection()
            case 2:
                return self.setShortsSection()
            default:
                return self.setVideoSection()
            }

        }
    }

    private func setModeSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(48),
            heightDimension: .absolute(30)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(48),
            heightDimension: .absolute(30)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 20)
        return section
    }
    
    private func setVideoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(303)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        return section
        
    }
    
    private func setShortsSection() ->NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .absolute(250)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 46, trailing: 20)
    
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .white
        setupNavigationBar()
    }

    
    func setupNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "youTubeLogo")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
        
        let profileBtn = UIButton(type: .custom)
        profileBtn.clipsToBounds = true
        profileBtn.imageView?.contentMode = .scaleAspectFill
        profileBtn.setImage(UIImage(named: "profileImg"), for: .normal)
        profileBtn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        profileBtn.layer.cornerRadius = 12
        profileBtn.contentHorizontalAlignment = .fill
        profileBtn.contentVerticalAlignment = .fill
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "loop")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)

        let notificationButton = UIButton(type: .system)
        notificationButton.setImage(UIImage(named: "notification")?.withRenderingMode(.alwaysOriginal), for: .normal)
        notificationButton.addTarget(self, action: #selector(notificationTapped), for: .touchUpInside)

        let broadcastButton = UIButton(type: .system)
        broadcastButton.setImage(UIImage(named: "broadcast")?.withRenderingMode(.alwaysOriginal), for: .normal)
        broadcastButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)


        let stackView = UIStackView(arrangedSubviews: [broadcastButton, notificationButton, searchButton, profileBtn])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .equalSpacing

        let barButton = UIBarButtonItem(customView: stackView)
        navigationItem.rightBarButtonItem = barButton
    }

    @objc func broadcastTapped() {
        print("broadcastTapped")
    }

    @objc func notificationTapped() {
        print("notificationTapped")
    }

    @objc func searchTapped() {
        print("searchTapped")
    }
    
    func reloadData() {
        self.collectionView.reloadData()
    }

}

