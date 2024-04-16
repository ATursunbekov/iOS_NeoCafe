////
////  NewOrderSearchViewModel.swift
////  iOS_waiter_NeoCafe
////
////  Created by iPak Tulane on 28/03/24.
////
//
//import Foundation
//
//protocol NewOrderSearchViewModelDelegate: AnyObject {
//    func searchProductResponse()
//}
//
//protocol NewOrderSearchViewModelProtocol {
//    var popScreen: EmptyCompletion? {get set}
//    var foundProducts: [PopularProductModel] {get set}
//    var goToDetailScreen: ((PopularProductModel) -> Void)? {get set}
//    var delegate: NewOrderSearchViewModelDelegate? {get set}
//    func searchProducts(text: String)
//}
//
//class NewOrderSearchViewModel: NewOrderSearchViewModelProtocol {
//
//    var popScreen: EmptyCompletion?
//    var goToDetailScreen: ((PopularProductModel) -> Void)?
//    
//    var foundProducts: [PopularProductModel] = []
//    var delegate: NewOrderSearchViewModelDelegate?
//    
//    @InjectionInjected(\.networkService) var networkService
//    
//    func searchProducts(text: String) {
//        networkService.sendRequest(successModelType: MenuCategoryProducts.self, endpoint: MultiTarget(MenuAPI.getSearchProducts(text))) { [weak self] result in
//            guard let self else { return }
//            switch result {
//            case .success(let response):
//                DispatchQueue.main.async {
//                    self.delegate?.searchProductResponse()
//                }
//                foundProducts = response.responses
//                print("Success: \(response.allCount)")
//            case .failure(let error):
//                print("handle error: \(error)")
//            }
//        }
//    }
//}
