//
//  Spinner.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 30/08/2022.
//

import UIKit


var spinnerView: UIView?

extension UIViewController {
    
    func showSpinner() {
        
        spinnerView = UIView.init(frame: view.bounds)
        spinnerView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let spinner = UIActivityIndicatorView.init(style: .medium)
        spinner.color = .red
        spinner.center = spinnerView!.center
        spinner.startAnimating()
        
        DispatchQueue.main.async {
            spinnerView?.addSubview(spinner)
            self.view.addSubview(spinnerView!)
        }
        
    }
    
    func removeSpinner() {
        
        DispatchQueue.main.async {
            spinnerView?.removeFromSuperview()
            spinnerView = nil
        }
    }
    
}
