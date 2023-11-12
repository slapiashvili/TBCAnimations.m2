//
//  Animation.swift
//  TBCAnimations.assignment.m2
//
//  Created by Salome Lapiashvili on 13.11.23.
//

import UIKit

final class Animation {
    
    static func fadeInOut(view: UIView, duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            view.alpha = 2.0
        }) { _ in
            UIView.animate(withDuration: duration, animations: {
                view.alpha = 0.0
            })
        }
    }
    
    static func moveUpDown(view: UIView, distance: CGFloat, duration: TimeInterval) {
        UIView.animate(withDuration: duration, delay: 0, options: [.autoreverse, .repeat], animations: {
            view.center.y -= distance
        }) { _ in
            
        }
    }

}
