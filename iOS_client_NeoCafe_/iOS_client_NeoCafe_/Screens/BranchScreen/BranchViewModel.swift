//
//  BranchViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/3/24.
//

import Foundation

protocol BranchViewModelDelegate: AnyObject {
    func getAllBranchesResponse()
}

protocol BranchNameDelegate: AnyObject {
    func updateBranchNames()
}

protocol BranchViewModelProtocol {
    var branches: [BranchResponses] { get set }
    var delegate: BranchViewModelDelegate? { get set }
    var branchNames: [String] { get set }
    var nameDelegate: BranchNameDelegate? { get set }
    var navigateToBranchDetail: ((BranchResponses) -> Void)? { get set }

    func getAllBranches()
    func getBranchNames()
}

class BranchViewModel: BranchViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var navigateToBranchDetail: ((BranchResponses) -> Void)?
    var branches: [BranchResponses] = []
    var delegate: BranchViewModelDelegate?

    func getAllBranches() {
        networkService.sendRequest(successModelType: BranchModel.self, endpoint: MultiTarget(BranchAPI.getAllFilials)) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                branches = response.responses
                delegate?.getAllBranchesResponse()
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }

    var branchNames: [String] = []
    var nameDelegate: BranchNameDelegate?

    func getBranchNames() {
        networkService.sendRequest(successModelType: [String].self, endpoint: MultiTarget(BranchAPI.getAllNames)) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                branchNames = response
                nameDelegate?.updateBranchNames()
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }
}
