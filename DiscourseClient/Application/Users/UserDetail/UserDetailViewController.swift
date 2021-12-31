//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userName: UILabel!
    

    let viewModel: UserDetailViewModel
    
    init(viewModel: UserDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: "UserDetailViewController", bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUserDetail()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
        
    }

}

extension UserDetailViewController: UserDetailProtocol{
    func onUserFetched(user: UserDetail) {
        userId.text = "\(user.id)"
        userName.text = "\(user.username)"
        hideLoading()
    }
    
 
    
    func onUserFetchedError() {
        showAlert(title: "No User Detail")
    }
    
    
}
