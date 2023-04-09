//
//  ViewController.swift
//  MyEggTimer
//
//  Created by Евгений on 09.04.2023.
//

import UIKit
import SnapKit
import SwiftUI
import AVFoundation

class ViewController: UIViewController {
    
    private let views = Views.shared
    private var timer: Timer?
    private var player: AVAudioPlayer?
    
    private var secondsPassed: Float = 0
    private var currentEggTime = Int()
    private var totalTime: Float = 0
    
    private let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720
    ]
    
    private let softTime = 5
    private let mediumTime = 7
    private let hardTime = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(hexString: "CBF2FC")
        
        addViews()
        
    }
    
    private func addViews() {
        addLabelViewStack()
        addMidStackEgg()
        addBotStackView()
        addVerticalStack()
        
        setStacks()
        makeTargets()
    }
    
    
    private func addLabelViewStack() {
        views.labelView.addSubview(views.labelText)
        views.topStackView.addArrangedSubview(views.labelView)
        view.addSubview(views.topStackView)
        
        views.labelText.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(views.labelView)
        }
    }
    
    private func addMidStackEgg() {
        views.softEggView.addSubview(views.softView)
        views.softEggView.addSubview(views.softEggButton)
        
        views.softView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(views.softEggView)
        }
        views.softEggButton.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(views.softView)
        }
        
        views.mediumEggView.addSubview(views.mediumView)
        views.mediumEggView.addSubview(views.mediumEggButton)
        views.mediumView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(views.mediumEggView)
        }
        views.mediumEggButton.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(views.mediumView)
        }
        
        views.hardEggView.addSubview(views.hardView)
        views.hardEggView.addSubview(views.hardEggButton)
        
        views.hardView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(views.hardEggView)
        }
        views.hardEggButton.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(views.hardView)
        }
        
        views.midStackView.addArrangedSubview(views.softEggView)
        views.midStackView.addArrangedSubview(views.mediumEggView)
        views.midStackView.addArrangedSubview(views.hardEggView)
        
        view.addSubview(views.midStackView)
    }
    
    private func makeTargets() {
        views.softEggButton.addTarget(self, action: #selector(startTimer(_ :)), for: .touchUpInside)
        views.mediumEggButton.addTarget(self, action: #selector(startTimer(_ :)), for: .touchUpInside)
        views.hardEggButton.addTarget(self, action: #selector(startTimer(_ :)), for: .touchUpInside)
    }
    
    private func addBotStackView() {
        let bottomView = UIView()
        bottomView.addSubview(views.progressView)
        views.botStackView.addArrangedSubview(bottomView)
        
        bottomView.snp.makeConstraints { make in
            make.top.trailing.bottom.trailing.equalToSuperview()
        }
        
        views.progressView.snp.makeConstraints { make in
            make.centerY.equalTo(bottomView)
            make.leading.trailing.equalTo(bottomView)
            make.height.equalTo(5)
        }
    }
    
    private func setStacks() {
        views.verticalStackView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func addVerticalStack() {
        view.addSubview(views.verticalStackView)
        views.verticalStackView.addArrangedSubview(views.topStackView)
        views.verticalStackView.addArrangedSubview(views.midStackView)
        views.verticalStackView.addArrangedSubview(views.botStackView)
    }
    
    @objc private func startTimer(_ sender: Any)  {
        totalTime = 0
        secondsPassed = 0
        
        let button = sender as? UIButton
        switch button?.titleLabel?.text {
        case "Soft":
            startTimer(duration: eggTimes["Soft"]!)
            views.labelText.text = "Soft"
        case "Medium":
            startTimer(duration: eggTimes["Medium"]!)
            views.labelText.text = "Medium"
        case "Hard":
            startTimer(duration: eggTimes["Hard"]!)
            views.labelText.text = "Hard"
        default:
            print("unknown")
        }
    }
    
    @objc private func updateCounter() {
        if secondsPassed < totalTime {
            currentEggTime -= 1
            secondsPassed += 1
            updateProgress()
        } else {
            timer?.invalidate()
            eggsDone()
            views.labelText.text = "Done!"
        }
    }
    
    private func startTimer(duration: Int) {
        totalTime = Float(duration)
        
        currentEggTime = duration
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateCounter),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func eggsDone() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    private func updateProgress() {
        let percent: Float = secondsPassed / totalTime
        views.progressView.progress = percent
    }
}
