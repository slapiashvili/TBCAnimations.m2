//
//  SecondAnimationsViewController.swift
//  TBCAnimations.assignment.m2
//
//  Created by Salome Lapiashvili on 13.11.23.
//

import UIKit

final class SecondAnimationsViewController: UIViewController {
    //MARK: -properties
    private var gradientView: UIView?
    private var label: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupGradientBackground()
        view.backgroundColor = .white
    }
    //MARK: -lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let label = label {
            Animator.rotateAndAppearAnimation(label)
        }
        
        if let view = self.view {
            Animator.crossFadeToNewGradient(parentView: view, fromColors: [UIColor.tbcPurple, UIColor.tbcRed], toColors: [UIColor.tbcGreen, UIColor.tbcYellow], duration: 2.0)
        }
    }
    
    //MARK: -private methods
    private func setupLabel() {
        label = UILabel()
        label?.text = "TBC IT Academy"
        label?.textColor = UIColor.black
        label?.font = UIFont.boldSystemFont(ofSize: 25)
        label?.sizeToFit()
        
        label?.frame = CGRect(
            x: (view.frame.width - label!.frame.width) / 2,
            y: (view.frame.height - label!.frame.height) / 2,
            width: label!.frame.width,
            height: label!.frame.height
        )
        
        if let label = label {
            view.addSubview(label)
        }
    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.tbcPurple.cgColor, UIColor.tbcRed.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
