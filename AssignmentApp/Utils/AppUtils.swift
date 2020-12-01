//
//  AppUtils.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import UIKit
import MBProgressHUD

public class AppUtils {
        
    private static func windowScene() -> UIWindow?{
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            return sceneDelegate.window
        }
        return nil
    }
    
    static func showProgressIndicator() {
        if let window = windowScene() {
            MBProgressHUD.showAdded(to: window, animated: true)
        }
    }
    
    static func hideProgressIndicator() {
        if let window = windowScene() {
            MBProgressHUD.hide(for: window, animated: true)
        }
    }
}
