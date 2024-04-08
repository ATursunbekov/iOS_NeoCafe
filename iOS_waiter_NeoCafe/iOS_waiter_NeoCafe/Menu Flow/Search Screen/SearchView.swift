//
//  SearchView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 02/04/24.
//

import UIKit
import SnapKit

// TODO: -
class SearchView: UIView {
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// TODO: -
protocol SearchViewModelProtocol {
}

class SearchViewModel: SearchViewModelProtocol {
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// TODO: -
class SearchViewController: UIViewController {
    var viewModel: SearchViewModelProtocol
    let contentView = SearchView()
    
    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupTargets()
//        setupDelegates()
//        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
//        ordersView.collectionView.reloadData()
    }
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
