//
//  UIViewController+Extension.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 20/12/21.
//

import UIKit

extension UIViewController {
    
    func showLoading() {
        let loaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        loaderView.tag = 999
        loaderView.backgroundColor = .black.withAlphaComponent(0.3)
        
        let loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        loader.center = loaderView.center
        
        loader.style = .large
        loader.color = .black
        loader.startAnimating()
        
        loaderView.addSubview(loader)
        
        view.addSubview(loaderView)
    }
    
    func hideLoading() {
        view.viewWithTag(999)?.removeFromSuperview()
    }
    
    func showAlert(title: String, message: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
