//
//  ViewController.swift
//  tomoEng11Kadai6
//
//  Created by 井本智博 on 2023/12/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var label: UILabel!
    @IBOutlet weak private var slider: UISlider!
    private var currentNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSlider()
        makeRandomInt()
    }

    private func setUpSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 100
    }

    @IBAction private func buttonPressed(_ sender: UIButton) {
        let sliderValueAsInt = Int(slider.value)
        if currentNumber == sliderValueAsInt {
            showAlert(message: "あたり！\nあなたの値は\(sliderValueAsInt)")
        } else {
            showAlert(message: "はずれ！\nあなたの値は\(sliderValueAsInt)")
        }
    }

    private func makeRandomInt() {
        currentNumber = Int.random(in: 0...100)
        label.text = String(currentNumber)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "再挑戦", style: .default){ (action) in
            self.makeRandomInt()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
