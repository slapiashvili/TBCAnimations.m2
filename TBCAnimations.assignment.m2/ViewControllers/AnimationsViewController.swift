//
//  ViewController.swift
//  TBCAnimations.assignment.m2
//
//  Created by Salome Lapiashvili on 13.11.23.
//

import UIKit

final class AnimationsViewController: UIViewController {
    //MARK: -properties
    private var label: UILabel?
    //MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupGradientView()
        setupLabel()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let label = label {
            Animator.animateLabel(label)
        }
    }
    //MARK: -private methods
    private func setupLabel() {
        label = UILabel()
        label?.text = "TBC IT Academy"
        label?.textColor = UIColor.tbcBlue
        label?.font = UIFont.boldSystemFont(ofSize: 25)
        label?.sizeToFit()
        
        label?.frame = CGRect(
            x: (view.bounds.width - label!.bounds.width) / 2,
            y: (view.bounds.height - label!.bounds.height) / 2,
            width: label!.bounds.width,
            height: label!.bounds.height
        )
        
        if let label = label {
            view.addSubview(label)
        }
    }
    
    private func setupGradientView() {
        let gradientView = UIView(frame: view.bounds)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.85, 1.0]
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.addSublayer(gradientLayer)
        view.addSubview(gradientView)
    }
    
    @objc private func viewTapped() {
        let secondAnimationsViewController = SecondAnimationsViewController()
        secondAnimationsViewController.modalTransitionStyle = .crossDissolve
        self.present(secondAnimationsViewController, animated: true, completion: nil)
    }
}

