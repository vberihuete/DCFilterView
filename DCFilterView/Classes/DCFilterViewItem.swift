//
//  TopTabItem.swift
//  testtable
//
//  Created by Vincent Berihuete on 8/30/18.
//  Copyright © 2018 Vincent Berihuete. All rights reserved.
//

import UIKit


/// This class represents a DCFilterViewItem normally to be used inside a stackview
/// in order to create a proper object you must use the initializer
/// init(identifier:, label:, color:, selected:) each parameter does what its name describes
public class DCFilterViewItem: UIStackView {
    
    let title = UILabel()
    let bottomView = UIView()
    let bottomViewContainer = UIStackView()
    
    public var delegate: DCFilterViewItemDelegate?
    
    public var number: Int = 0
    public var selected: Bool = false
    
    
    // MARK: - init
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public init(identifier number: Int, label text: String, color: UIColor = UIColor.black){
        super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 40))
        self.number = number
        setup(label: text, color: color)
    }
    
    
    
    // MARK: - setup
    
    /// The initial setup of views. Does the layout
    ///
    /// - Parameters:
    ///   - text: The text to be displayed in the item
    ///   - color: The color to use on it
    ///   - selected: Initial selection state
    private func setup(label text: String = "Item %", color: UIColor = UIColor.black){
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = 10
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tap)))
        
        self.title.text = text
        self.title.textColor = color
        self.title.textAlignment = .center
        
        
        self.addArrangedSubview(self.title)
        self.addArrangedSubview(self.bottomViewContainer)
        
        self.bottomView.backgroundColor = color
        self.addConstraint(NSLayoutConstraint(item: self.bottomViewContainer, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 5))
        
        self.bottomViewContainer.axis = .vertical
        self.bottomViewContainer.alignment = .leading
        self.bottomViewContainer.addArrangedSubview(bottomView)
    }
    
    
    // MARK: - actions
    
    
    /// Triggered when view is tapped
    ///
    /// - Parameter sender: The sender
    @objc private func tap(sender: Any){
        delegate?.tapAction(of: number)
    }
    
    
    
    /// Marks the view as selected
    ///
    /// - Parameter color: The color for the selected text and bottom view
    
    
    /// Marks the view as selected
    ///
    /// - Parameters:
    ///   - animationT: The duration of the selection animation in seconds, defualt value is 0.2s
    ///   - color: The color to represent the selected state, default value is UIColor.red
    ///   - animationOrigin: The origin of the animation .left or .right
    func markSelected(in animationT: TimeInterval = 0.2, with color: UIColor = UIColor.red, from animationOrigin: DCFilterViewAnimationSide = .left){
        self.bottomView.backgroundColor = color
        self.title.textColor = color
        self.bottomViewContainer.alignment = animationOrigin == .left ? .leading : .trailing
        self.selected = true
        UIView.animate(withDuration: animationT, delay: 0, options: [UIView.AnimationOptions.curveEaseOut], animations: {
            self.bottomViewContainer.alignment = .fill
        })
    }
    
    
    /// Marks the view as un selected
    ///
    /// - Parameters:
    ///   - animationT: The duration of the selection animation in seconds, defualt value is 0.2s
    ///   - color: The color to represent the selected state, default value is UIColor.black
    ///   - animationOrigin: The origin of the animation .left or .right
    func markUnselected(in animationT: TimeInterval = 0.2, with color: UIColor = UIColor.black, from animationOrigin: DCFilterViewAnimationSide = .right){
        //        self.bottomView.backgroundColor = color
        self.title.textColor = color
        self.selected = false
        UIView.animate(withDuration: animationT){
            self.bottomViewContainer.alignment = animationOrigin == .right ? .leading : .trailing
        }
    }
    
    
}

public protocol DCFilterViewItemDelegate{
    /// The delegate tap action of a given top item number
    ///
    /// - Parameter number: The item number to reflect the action
    func tapAction(of number: Int)
}


/// Enum to say from which side the tab item animation should come from
///
/// - right: When comming from right they will grow to the left. This is the default for selecting
/// - left: When comming from left they will grow to the right. This is the default for unselecting
enum DCFilterViewAnimationSide{
    case right
    case left
}


