//
//  PMAlertController+Lottie.swift
//  PMAlertController
//
//  Created by Julien Goudet on 01/04/2019.
//  Copyright © 2019 Codeido. All rights reserved.
//

import Foundation
import Lottie



extension PMAlertController {
    
    @objc public convenience init(title: String, description: String, lottie: String? = nil, style: PMAlertControllerStyle) {
        
        self.init(title: title, description: description, image: nil, style: style)

        guard let _lottieRefName = lottie, let lottieAnimationModel = Animation.named(_lottieRefName) else { return }
        
        let animationView = AnimationView(animation: lottieAnimationModel)
        alertLottie.addSubview(animationView)

        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: alertLottie.topAnchor).isActive = true
        animationView.leadingAnchor.constraint(equalTo: alertLottie.layoutMarginsGuide.leadingAnchor).isActive = true
        animationView.trailingAnchor.constraint(equalTo: alertLottie.layoutMarginsGuide.trailingAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: alertLottie.bottomAnchor).isActive = true

        headerView.bringSubviewToFront(alertLottie)
        headerViewHeightConstraint.constant = 130
        
        
    }
    
    public func playLottie(loopMode: Lottie.LottieLoopMode = .playOnce, animationSpeed: CGFloat = 1) {
        guard let animationView = alertLottie.subviews.first as? AnimationView else { return }
        
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        
        animationView.play()
        
    }
    
    public func stopLottie() {
        guard let animationView = alertLottie.subviews.first as? AnimationView else { return }

        animationView.stop()
    }
    
}
