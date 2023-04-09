//
//  Views.swift
//  MyEggTimer
//
//  Created by Евгений on 09.04.2023.
//

import UIKit

class Views {
    static let shared = Views()
    
    lazy var labelText: UILabel = {
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.contentMode = .left
        
        return label
    }()
    
    lazy var softEggButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Soft", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    lazy var mediumEggButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Medium", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    lazy var hardEggButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hard", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    lazy var softView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "soft_egg")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    lazy var mediumView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "medium_egg")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    lazy var hardView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "hard_egg")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    let verticalStackView: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = 40
        
        return verticalStack
    }()
    
    let topStackView = UIStackView()
    let midStackView: UIStackView = {
        let midStackView = UIStackView()
        midStackView.axis = .horizontal
        midStackView.distribution = .fillEqually
        midStackView.spacing = 20
        
        return midStackView
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressViewStyle = .bar
        progressView.progressTintColor = .systemYellow
        progressView.trackTintColor = .systemGray
        progressView.progress = 0
        
        return progressView
    }()
    
    let botStackView = UIStackView()
    
    let labelView = UIView()
    let softEggView = UIView()
    let mediumEggView = UIView()
    let hardEggView = UIView()
  
}

