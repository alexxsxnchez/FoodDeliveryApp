//
//  ChefTabView.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-09-02.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

protocol ChefTabViewDelegate {
    func tabButtonTapped(menuTabSelected: Bool)
}

class ChefTabView: UIView {

    var delegate: ChefTabViewDelegate!
    var firstTabConstraint: NSLayoutConstraint!
    var secondTabConstaint: NSLayoutConstraint!
    
    let menuTab: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Menu", for: .normal)
        button.setTitleColor(UIColor.red, for: .selected)
        button.isSelected = true
        return button
    }()
    
    let reviewTab: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reviews", for: .normal)
        button.setTitleColor(UIColor.red, for: .selected)
        return button
    }()
    
    let tabLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        menuTab.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
        reviewTab.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
        
        
        labelStackView.addArrangedSubview(menuTab)
        labelStackView.addArrangedSubview(reviewTab)
        
        addSubview(labelStackView)
        addSubview(tabLine)
        addSubview(dividerLine)
        
        firstTabConstraint = tabLine.leadingAnchor.constraint(equalTo: leadingAnchor)
        secondTabConstaint = tabLine.leadingAnchor.constraint(equalTo: centerXAnchor)
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: dividerLine.leadingAnchor),
            labelStackView.centerXAnchor.constraint(equalTo: dividerLine.centerXAnchor),
            
            tabLine.topAnchor.constraint(equalTo: labelStackView.bottomAnchor),
            firstTabConstraint,
            tabLine.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            tabLine.heightAnchor.constraint(equalToConstant: 1),
            
            dividerLine.topAnchor.constraint(equalTo: tabLine.bottomAnchor),
            dividerLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            dividerLine.heightAnchor.constraint(equalToConstant: 1),
            dividerLine.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tabButtonTapped(_ sender: UIButton) {
        
        let isMenuTabSelected = sender == menuTab
        
        menuTab.isSelected = isMenuTabSelected
        reviewTab.isSelected = !isMenuTabSelected
        
        // if-else statement prevents both constaints becoming active at the same time
        if secondTabConstaint.isActive {
            secondTabConstaint.isActive = !isMenuTabSelected
            firstTabConstraint.isActive = isMenuTabSelected
        } else {
            firstTabConstraint.isActive = isMenuTabSelected
            secondTabConstaint.isActive = !isMenuTabSelected
        }
        
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
        delegate.tabButtonTapped(menuTabSelected: isMenuTabSelected)
    }

}
