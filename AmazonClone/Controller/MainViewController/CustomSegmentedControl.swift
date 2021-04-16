//
//  CustomSegmentedControl.swift
//  AmazonClone
//
//  Created by ADMIN on 13/04/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSegmentedControl: UIControl {
    var buttons = [UIButton]()
    var selector: UIView!

    var selectedSegmentedIndex = 0

    @IBInspectable
    var commaSeparatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }

    @IBInspectable
    var textColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }

    @IBInspectable
    var selectorColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }

    @IBInspectable
    var selectedTextColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }

        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")

        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(segmentButtonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }

        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 10, y: frame.height - 3, width: selectorWidth - 20, height: 3))
        selector.backgroundColor = selectorColor
        addSubview(selector)

        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually

        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }

    @objc func segmentButtonTapped(button: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() where btn == button {
            selectedSegmentedIndex = buttonIndex

            let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.selector.frame.origin.x = selectorStartPosition + 10
            }
        }
        sendActions(for: .valueChanged)
    }
}
