//
//  ViewController.swift
//  Kadai-6
//
//  Created by 鈴木淳子 on 2021/12/04.
//

import UIKit

enum AlertMessage: String {
    case correct
    case incorrect

    var message: String {
        switch self {
        case .correct:
            return "あたり！"
        case .incorrect:
            return "はずれ！"
        }
    }
}

final class ViewController: UIViewController {
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        createRandomNumber()
    }

    @IBAction private func judgeButtonTapped(_ sender: Any) {
        let sliderNum = Int(slider.value)
        let sliderValue = String(sliderNum)
        if numberLabel.text == sliderValue {
            actionAlert(message: AlertMessage.correct.message, selectedNum: sliderValue)
        } else {
            actionAlert(message: AlertMessage.incorrect.message, selectedNum: sliderValue)
        }
    }

    private func createRandomNumber() {
        let randomNum = Int.random(in: 1...100)
        numberLabel.text = String(randomNum)
    }

    private func actionAlert(message: String, selectedNum: String) {
        let alert = UIAlertController(title: "結果", message: "\(message)\nあなたの値：\(selectedNum)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { _ in
            self.createRandomNumber()
        }))
        present(alert, animated: true, completion: nil)
    }
}
