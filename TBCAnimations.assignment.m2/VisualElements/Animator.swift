//
//  Animation.swift
//  TBCAnimations.assignment.m2
//
//  Created by Salome Lapiashvili on 13.11.23.
//

import UIKit

final class Animator {
    
    static func animateLabel(_ label: UILabel) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
            label.transform = CGAffineTransform(translationX: 0, y: -60)
            label.alpha = 1.0
        }) { (_) in
            UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseInOut, animations: {
                label.transform = .identity
                label.alpha = 0.0
            }) { (_) in
                animateLabel(label)
            }
        }
    }
    
    static func rotateAndAppearAnimation(_ label: UILabel) {
        label.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        label.alpha = 0.0
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.autoreverse, .repeat], animations: {
            label.transform = .identity
            label.alpha = 1.0
        }, completion: nil)
    }
    
    static func startContinuousCrossFade(parentView: UIView, fromColors: [UIColor], toColors: [UIColor], duration: TimeInterval = 2.0) {
        Timer.scheduledTimer(withTimeInterval: duration * 2.0, repeats: true) { (_) in
            crossFadeToNewGradient(parentView: parentView, fromColors: fromColors, toColors: toColors, duration: duration)
        }
    }
    
    static func crossFadeToNewGradient(parentView: UIView, fromColors: [UIColor], toColors: [UIColor], duration: TimeInterval) {
        let newGradientLayer = CAGradientLayer()
        newGradientLayer.colors = toColors.map { $0.cgColor }
        newGradientLayer.locations = [0.0, 1.0]
        newGradientLayer.frame = parentView.bounds
        
        let newGradientView = UIView(frame: parentView.bounds)
        newGradientView.layer.addSublayer(newGradientLayer)
        parentView.addSubview(newGradientView)
        newGradientView.alpha = 0.0
        
        UIView.animate(withDuration: duration, animations: {
            newGradientView.alpha = 1.0
        }) { (_) in
            newGradientView.removeFromSuperview()
            crossFadeToNewGradient(parentView: parentView, fromColors: toColors, toColors: fromColors, duration: duration)
        }
    }
}
