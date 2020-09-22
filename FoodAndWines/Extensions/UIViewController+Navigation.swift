//
//  UIViewController+Navigation.swift
//  Aeryus
//
//  Created by Wang Gang on 9/12/18.
//  Copyright © 2018 Aeryus. All rights reserved.
//

import UIKit

let BlurEffectViewTag = 9900

extension UIViewController {
    
    /**
     If current UIViewController is root view controller, dismiss UINavigationController.
     Otherwise, pop current UIViewController.
     */
    func dismissViewController(animated: Bool) {
        DispatchQueue.main.async {
            let vcArray = self.navigationController?.viewControllers
            if vcArray?.count == 1 {
                self.navigationController?.dismiss(animated: animated, completion: nil)
            } else {
                self.navigationController?.popViewController(animated: animated)
            }
        }
    }
    
    //MARK: - Navigation functions
    func popAndPushViewController(vc: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            var vcArray = self.navigationController?.viewControllers
            vcArray!.removeLast()
            vcArray!.append(vc)
            self.navigationController?.setViewControllers(vcArray!, animated: animated)
        }
    }
    
    func presentNavController(rootVC: UIViewController) {
        DispatchQueue.main.async {
            let nvc = UINavigationController(rootViewController: rootVC)
            nvc.navigationBar.isHidden = true
            self.navigationController?.present(nvc, animated: true, completion: nil)
        }
    }
    
    func push(viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async {
            
            let animation = CATransition()
            animation.duration = 0.5
            animation.type = CATransitionType.push
            animation.subtype = CATransitionSubtype.fromRight
            self.navigationController?.view.layer.add(animation, forKey: nil)
            self.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    /** Hide navigation bar */
    func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func showBlurView() {
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        blurEffectView.tag = BlurEffectViewTag
        view.addSubview(blurEffectView)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = 0.0
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveLinear], animations: {
            blurEffectView.alpha = 1.0
        })
    }
    
    func hideBlurView() {
        if let blurView = view.viewWithTag(BlurEffectViewTag) {
            blurView.removeFromSuperview()
        }
    }
}
