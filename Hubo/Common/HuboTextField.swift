//
//  HuboTextField.swift
//  Hubo
//
//  Created by ភី ម៉ារ៉ាសុី on 2/17/18.
//  Copyright © 2018 ភី ម៉ារ៉ាសុី. All rights reserved.
//

import UIKit

@IBDesignable
public class HuboTextField: UITextField {

    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable public var underLineWidth: CGFloat = 0.0 {
        didSet {
            updateUnderLineFrame()
        }
    }

    @IBInspectable public var underLineColor: UIColor = .groupTableViewBackground {
        didSet {
            updateUnderLineUI()
        }
    }

    @IBInspectable public var placeholderColor: UIColor = .lightGray {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedStringKey.foregroundColor: placeholderColor])
        }
    }

    public override var placeholder: String? {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedStringKey.foregroundColor: placeholderColor])
        }
    }

    @IBInspectable public var leftMargin: CGFloat = 10.0 {
        didSet {
            setMargins()
        }
    }

    @IBInspectable public var rightMargin: CGFloat = 10.0 {
        didSet {
            setMargins()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        applyStyles()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyles()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        updateUnderLineFrame()
        updateAccessoryViewFrame()
    }

    private func applyStyles() {
        applyUnderLine()
        setMargins()
    }

    private var underLineLayer = CALayer()
    private func applyUnderLine() {
        if borderStyle == UITextBorderStyle.none {
            underLineLayer.removeFromSuperlayer()
            updateUnderLineFrame()
            updateUnderLineUI()
            layer.addSublayer(underLineLayer)
            layer.masksToBounds = true
        }
    }

    private func updateUnderLineFrame() {
        var rect = bounds
        rect.origin.y = bounds.height - underLineWidth
        rect.size.height = underLineWidth
        underLineLayer.frame = rect
    }

    private func updateUnderLineUI() {
        underLineLayer.backgroundColor = underLineColor.cgColor
    }

    private var leftAcessoryView = UIView()
    private var rightAcessoryView = UIView()
    private func setMargins() {

        leftView = nil
        leftViewMode = .never
        if leftMargin > 0 {
            if nil == leftView {
                leftAcessoryView.backgroundColor = .clear
                leftView = leftAcessoryView
                leftViewMode = .always
            }
        }
        updateAccessoryViewFrame()

        rightView = nil
        rightViewMode = .never
        if rightMargin > 0 {
            if nil == rightView {
                rightAcessoryView.backgroundColor = .clear
                rightView = rightAcessoryView
                rightViewMode = .always
            }
            updateAccessoryViewFrame()
        }
    }

    private func updateAccessoryViewFrame() {
        var leftRect = bounds
        leftRect.size.width = leftMargin
        leftAcessoryView.frame = leftRect

        var rightRect = bounds
        rightRect.size.width = rightMargin
        rightAcessoryView.frame = rightRect
    }

}

