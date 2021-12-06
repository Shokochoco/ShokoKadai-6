//
//  ViewController.swift
//  Kadai-6
//
//  Created by 鈴木淳子 on 2021/12/04.
//

import UIKit

enum AlertMessage {
    static let correct = "あたり！"
    static let incorrect = "はずれ！"
}

final class ViewController: UIViewController {
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!
    private var answer = 0 // 値の保持はプロパティで行う

    override func viewDidLoad() {
        super.viewDidLoad()
        createRandomNumber()
    }

    @IBAction private func judgeButtonTapped(_ sender: Any) {
        if answer == Int(slider.value) {
            actionAlert(message: AlertMessage.correct)
        } else {
            actionAlert(message: AlertMessage.incorrect)
        }
    }

    private func createRandomNumber() {
        answer = Int.random(in: 1...100)
        numberLabel.text = String(answer)
    }

    private func actionAlert(message: String) {
        let alert = UIAlertController(
            title: "結果",
            message: "\(message)\nあなたの値：\(Int(slider.value))",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { [weak self] _ in
            self?.createRandomNumber()
        }))
        present(alert, animated: true, completion: nil)
    }
}
