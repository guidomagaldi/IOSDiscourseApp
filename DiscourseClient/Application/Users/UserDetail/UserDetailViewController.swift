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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUserDetail()
        
    }

}

extension UserDetailViewController: UserDetailProtocol{
    func onUserFetched() {
        userId.text = "gato"
        userName.text = "\(viewModel.username)"
        
    }
    
    func onUserFetchedError() {
        showAlert(title: "No User Detail")
    }
    
    
}
