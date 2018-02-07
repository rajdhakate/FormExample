//
//  TextField.swift
//  FormExample
//
//  Created by Webdior Mac - 2 on 07/02/18.
//  Copyright © 2018 Raj Dhakate. All rights reserved.
//

import UIKit

class TextField: UITableViewCell {
    
    var topSpace: CGFloat = 5.0 {
        didSet {
            topConstraint.constant = topSpace
        }
    }
    
    var bottomSpace: CGFloat = 5.0 {
        didSet {
            bottomConstraint.constant = bottomSpace
        }
    }
    
    var showLeftIcon: Bool = false {
        didSet {
            if showLeftIcon == false {
                leftIconWidthConstraint.constant = 0
                fieldLeftSpace.constant = 0
            }
        }
    }
    
    var showRightIcon: Bool = false {
        didSet {
            if  showRightIcon == false {
                rightIconWidthConstraint.constant = 0
                fieldRightSpace.constant = 0
            }
        }
    }
    
    var rightIconSize: CGFloat = 30 {
        didSet {
            rightIconWidthConstraint.constant = rightIconSize
            rightIconHeightConstraint.constant = rightIconSize
        }
    }
    
    var leftIconSize: CGFloat = 30 {
        didSet {
            leftIconWidthConstraint.constant = leftIconSize
            leftIconHeightConstraint.constant = leftIconSize
        }
    }
    
    var lineHeight: CGFloat = 1.0 {
        didSet {
            lineHeightConstraint.constant = lineHeight
        }
    }
    
    var lineCustomColor: UIColor = UIColor.lightGray {
        didSet {
            line.backgroundColor = lineCustomColor
        }
    }
    
    var leftIconName: String = "" {
        didSet {
            leftIcon.image = UIImage(named: leftIconName)
        }
    }
    
    var rightIconName: String = "" {
        didSet {
            rightIcon.image = UIImage(named: rightIconName)
        }
    }
    
    var fieldAlignment: NSTextAlignment = NSTextAlignment.left {
        didSet {
            field.textAlignment = fieldAlignment
        }
    }
    
    var buttonAlignment: UIControlContentHorizontalAlignment = UIControlContentHorizontalAlignment.right {
        didSet {
            button.contentHorizontalAlignment = buttonAlignment
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
    
    @IBOutlet private var fieldHeight: NSLayoutConstraint!
    @IBOutlet private var buttonHeight: NSLayoutConstraint!
    
    @IBOutlet private var rightIconHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var rightIconWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet private var leftIconHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var leftIconWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet private var lineHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
