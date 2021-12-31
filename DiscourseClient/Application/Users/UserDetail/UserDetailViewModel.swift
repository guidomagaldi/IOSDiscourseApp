//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

protocol UserDetailProtocol: AnyObject{
    //para pasar el user entero lo paso como parametro
    func onUserFetched(user: UserDetail)
    func onUserFetchedError()
}

final class UserDetailViewModel: ViewModel {
    
    private var user = [UserDetail]()
    //Le asigno el delegate que va a estar en el view controller
    weak var delegate : UserDetailProtocol?
    var username: String
    var userId : Int?
    let coordinator: UserDetailCoordinator
    
    
    init(username: String, coordinator: UserDetailCoordinator) {
        self.username = username
        
        self.coordinator = coordinator
    }
    
    func fetchUserDetail() {
        let userDetailRequest = UserDetailRequest(username: username)
        session.request(request: userDetailRequest) { [weak self] result in
            guard let self = self else { return }
            switch result{
                case .success(let response):
                    guard let response = response else { return }
                    self.delegate?.onUserFetched(user: response.user)
                    print(response)
                case.failure(let error):
                    self.delegate?.onUserFetchedError()
                    print(error.localizedDescription)
            }
            
        }
    }
}
