//
//  Extentions.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import Foundation
import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant ?? 0).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop ?? 0).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        if let leftAnchor = leftAnchor {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: paddingLeft ?? 0).isActive = true
        }
    }
    
    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func addConstraintsToFillView(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: view.topAnchor,left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

extension UIViewController {
    
    func navigationControlerNavigationController(fullScreen: Bool ,rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.navigationBar.isTranslucent = false
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = .white
        nav.navigationBar.scrollEdgeAppearance = standardAppearance
        if fullScreen {
            nav.modalPresentationStyle = .fullScreen
        }
        
        return nav
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.navigationBar.isTranslucent = false
        if let image = image {
            nav.tabBarItem.image = image
        }
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = .white
        nav.navigationBar.scrollEdgeAppearance = standardAppearance
        
        return nav
    }
    
    func returnToKeyWindow(rootViewController: UIViewController) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let rootVC = window?.rootViewController
        guard let tab = rootVC as? MainTabBarController else { return }
        tab.authenticateUserAndConfigUI()
//        rootViewController.dismiss(animated: true, completion: nil)
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mainBlue = UIColor.rgb(red: 29, green: 161, blue: 242)
    static let customRed = UIColor.rgb(red: 220, green: 78, blue: 65)
    static let customPurple = UIColor.rgb(red: 128, green: 87, blue: 194)
}


extension UIViewController {
    func tabBarStyling() -> UITabBarAppearance {
        let tabBarApperance = UITabBarAppearance()
        tabBarApperance.configureWithOpaqueBackground()
        tabBarApperance.backgroundColor = UIColor.white
        
        return tabBarApperance
    }
    
    func navBarStyling() -> UINavigationBarAppearance {
        let navigationBarAppearance = UINavigationBarAppearance()
                        navigationBarAppearance.configureWithOpaqueBackground()
                        navigationBarAppearance.titleTextAttributes = [
                            NSAttributedString.Key.foregroundColor : UIColor.white
                        ]
                        navigationBarAppearance.backgroundColor = UIColor.white
        return navigationBarAppearance
    }
}
