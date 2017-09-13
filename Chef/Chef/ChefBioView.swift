//
//  ChefBioView.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-28.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

protocol ChefBioViewDelegate {
    func buttonTapped()
}

class ChefBioView: UIView {
    
    // MARK: - Properties
    var delegate : ChefBioViewDelegate!
    
    // MARK: - Properties
    fileprivate let minNumberOfLines = 3
    fileprivate var isExpanded = false
    
    // MARK: - UI Elements
    fileprivate let expandingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    fileprivate let dummyLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0.0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .justified
        return label
    }()
    
    fileprivate let actualLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    fileprivate let moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Read more...", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(expandingView)
        expandingView.addSubview(actualLabel)
        expandingView.addSubview(dummyLabel)
        addSubview(moreButton)
        dummyLabel.numberOfLines = minNumberOfLines
        moreButton.addTarget(self, action: #selector(moreButtonTapped(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            // ExpandingView
            expandingView.topAnchor.constraint(equalTo: topAnchor),
            expandingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            expandingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // DummyLabel
            dummyLabel.topAnchor.constraint(equalTo: expandingView.topAnchor),
            dummyLabel.leadingAnchor.constraint(equalTo: expandingView.leadingAnchor),
            dummyLabel.trailingAnchor.constraint(equalTo: expandingView.trailingAnchor),
            dummyLabel.bottomAnchor.constraint(equalTo: expandingView.bottomAnchor),
            
            // ActualLabel
            actualLabel.topAnchor.constraint(equalTo: expandingView.topAnchor),
            actualLabel.leadingAnchor.constraint(equalTo: expandingView.leadingAnchor),
            actualLabel.trailingAnchor.constraint(equalTo: expandingView.trailingAnchor),
            
            // MoreButton
            moreButton.topAnchor.constraint(equalTo: expandingView.bottomAnchor),
            moreButton.trailingAnchor.constraint(equalTo: expandingView.trailingAnchor),
            moreButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    func setText(to text: String) {
        dummyLabel.text = text
        actualLabel.text = text
        print(actualLabel.font.lineHeight)
        //if actualLabel.font.lineHeight * minNumberOfLines
        let textHeight = text.height(withConstrainedWidth: 200, font: dummyLabel.font)
        if textHeight <= dummyLabel.intrinsicContentSize.height {
            moreButton.isHidden = true
        }
        
        print(textHeight)
        print(dummyLabel.intrinsicContentSize.height)
        
    }
    
    func moreButtonTapped(_ sender: UIButton) {
        isExpanded = !isExpanded
        let numberOfLines = isExpanded ? 0 : minNumberOfLines
        dummyLabel.numberOfLines = numberOfLines
        let title = isExpanded ? "Read less..." : "Read more..."
        moreButton.setTitle(title, for: .normal)
        delegate.buttonTapped()
    }
}
