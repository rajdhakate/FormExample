//
//  TextField.swift
//  FormExample
//
//  Created by Webdior Mac - 2 on 07/02/18.
//  Copyright © 2018 Raj Dhakate. All rights reserved.
//

import UIKit

class TextField: UITableViewCell {
    
    // Field Top Space in CGFloat (default 5.0)
    var topSpace: CGFloat = 5.0 {
        didSet {
            topConstraint.constant = topSpace
        }
    }
    
    // Field Bottom Space in CGFloat (default 5.0)
    var bottomSpace: CGFloat = 5.0 {
        didSet {
            bottomConstraint.constant = bottomSpace
        }
    }
    
    // Field height in CGFloat (default 30.0)
    var fieldHeight: CGFloat = 30.0 {
        didSet {
            fieldHeightConstraint.constant = fieldHeight
            field.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        }
    }
    
    // Left icon visibility in Bool (default hidden)
    var showLeftIcon: Bool = false {
        didSet {
            if showLeftIcon == false {
                leftIconWidthConstraint.constant = 0
                fieldLeftSpace.constant = 0
            } else {
                leftIconWidthConstraint.constant = leftIconSize
                leftIconHeightConstraint.constant = leftIconSize
                fieldLeftSpace.constant = 8
            }
        }
    }
    
    // Right icon visibility in Bool (default hidden)
    var showRightIcon: Bool = false {
        didSet {
            if  showRightIcon == false {
                rightIconWidthConstraint.constant = 0
                fieldRightSpace.constant = 0
            } else {
                rightIconWidthConstraint.constant = rightIconSize
                rightIconHeightConstraint.constant = rightIconSize
                fieldRightSpace.constant = 8
            }
        }
    }
    
    // Left icon size in CGFloat (default 30)
    var leftIconSize: CGFloat = 30 {
        didSet {
            if showRightIcon {
                leftIconWidthConstraint.constant = leftIconSize
                leftIconHeightConstraint.constant = leftIconSize
            }
        }
    }
    
    // Right icon size in CGFloat (default 30)
    var rightIconSize: CGFloat = 30 {
        didSet {
            if showLeftIcon {
                rightIconWidthConstraint.constant = rightIconSize
                rightIconHeightConstraint.constant = rightIconSize
            }
        }
    }
    
    // Line height in CGFloat (default 1.0)
    var lineHeight: CGFloat = 1.0 {
        didSet {
            lineHeightConstraint.constant = lineHeight
        }
    }
    
    // Line color in UIColor (default .lightGray)
    var lineCustomColor: UIColor = UIColor.lightGray {
        didSet {
            line.backgroundColor = lineCustomColor
        }
    }
    
    // Left Icon name in String (default "")
    var leftIconName: String = "" {
        didSet {
            leftIcon.image = UIImage(named: leftIconName)
        }
    }
    
    // Right Icon name in String (default "")
    var rightIconName: String = "" {
        didSet {
            rightIcon.image = UIImage(named: rightIconName)
        }
    }
    
    // Field Alighnment (default .left)
    var fieldAlignment: NSTextAlignment = NSTextAlignment.left {
        didSet {
            field.textAlignment = fieldAlignment
        }
    }
    
    // Button Alighnment (default .right)
    var buttonAlignment: UIControlContentHorizontalAlignment = UIControlContentHorizontalAlignment.right {
        didSet {
            button.contentHorizontalAlignment = buttonAlignment
        }
    }
    
    // Field Placehodler (default "Placeholder")
    var placeholderText: String = "Placeholder" {
        didSet {
            field.text = placeholderText
            field.textColor = .lightGray
        }
    }
    
    @IBOutlet var field: UITextView!
    @IBOutlet var button: UIButton!
    @IBOutlet private var leftIcon: UIImageView!
    @IBOutlet private var rightIcon: UIImageView!
    @IBOutlet private var line: UILabel!
    
    @IBOutlet private var fieldRightSpace: NSLayoutConstraint!
    @IBOutlet private var fieldLeftSpace: NSLayoutConstraint!
    
    @IBOutlet private var topConstraint: NSLayoutConstraint!
    @IBOutlet private var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet private var fieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var buttonHeight: NSLayoutConstraint!
    
    @IBOutlet private var rightIconHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var rightIconWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet private var leftIconHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var leftIconWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet private var lineHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        field.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        field.layer.cornerRadius = 3
        field.textAlignment = fieldAlignment
        button.contentHorizontalAlignment = buttonAlignment
        
        if showLeftIcon == false {
            leftIconWidthConstraint.constant = 0
            fieldLeftSpace.constant = 0
        } else {
            leftIconWidthConstraint.constant = leftIconSize
            leftIconHeightConstraint.constant = leftIconSize
        }
        
        if showRightIcon == false  {
            rightIconWidthConstraint.constant = 0
            fieldRightSpace.constant = 0
        } else {
            rightIconWidthConstraint.constant = rightIconSize
            rightIconHeightConstraint.constant = rightIconSize
        }
        
        if placeholderText.count > 0 {
            field.text = placeholderText
            field.textColor = .lightGray
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        var topCorrect = field.bounds.size.height/2.0
//        var topCorrect = (field.bounds.size.height - field.contentSize.height * field.zoomScale)/2.0
        topCorrect = (topCorrect < 0.0 ? 0.0 : topCorrect)
        field.contentOffset = CGPoint(x: 0, y: +topCorrect)
//        field.contentOffset = (CGPoint){.x = 0, .y = -topCorrect}
    }
}
