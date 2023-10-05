//
//  ContactsViewController.swift
//  ContactsSketch
//
//  Created by 1234 on 05.10.2023.
//

import UIKit

class ContactsViewController: UIViewController {
    
    let profile = User(fullname: "Aleksey Khlestkin", imageString: "human1", firstCharacter: "A", id: 20)
    let favoriteUsers = Bundle.main.decode([User].self, from: "favouriteUsers.json")
    let contactsUsers = Bundle.main.decode([User].self, from: "contactUsers.json")
    
    let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonItemTapped))
    
    let groupsBarButtonItem = UIBarButtonItem(title: "Groups", style: .plain, target: self, action: #selector(groupsBarButtonItemTapped))
    
    enum Section: Int {
        case profile
        case favorites
        case contacts
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, User>? = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<Section, User>? = nil
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBar()
        setupCollectionView()
        createDataSource()
        reloadData()
    }
    
    private func setupNavigationBar() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        navigationItem.leftBarButtonItem = groupsBarButtonItem
        navigationItem.rightBarButtonItem = addBarButtonItem
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Contacts"
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .gray
        view.addSubview(collectionView)
        
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: "ProfileCell")
        collectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: "FavoriteCell")
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: "ContactCell")
    }
    
    private func reloadData() {
        currentSnapshot = NSDiffableDataSourceSnapshot<Section, User>()
        
        currentSnapshot?.appendSections([.profile, .favorites, .contacts])
        currentSnapshot?.appendItems([profile], toSection: .profile)
        currentSnapshot?.appendItems(favoriteUsers, toSection: .favorites)
        currentSnapshot?.appendItems(contactsUsers, toSection: .contacts)
        
        dataSource?.apply(currentSnapshot!, animatingDifferences: true)
    }
    
    // MARK: - DataSource
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, User>(collectionView: collectionView, cellProvider: { collectionView, indexPath, user in
            
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section type") }
            
            switch section {
            case .profile:
                return self.configure(collectionView: collectionView, cellType: ProfileCell.self, with: user, for: indexPath)
            case .favorites:
                return self.configure(collectionView: collectionView, cellType: FavoriteCell.self, with: user, for: indexPath)
            case .contacts:
                return self.configure(collectionView: collectionView, cellType: ContactCell.self, with: user, for: indexPath)
            }
        })
    }
}



// MARK: - Actions
extension ContactsViewController {
    @objc func addBarButtonItemTapped() {
        print(#function)
    }
    @objc func groupsBarButtonItemTapped() {
        print(#function)
    }
}

// MARK: - UISearchBarDelegate
extension ContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

