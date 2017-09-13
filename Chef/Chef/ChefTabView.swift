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
    static let color = UIColor(red: 205/255, green: 200/255, blue: 200/255, alpha: 1.0)
    
    fileprivate let menuTab: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Menu", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.setTitleColor(UIColor.red, for: .selected)
        button.isSelected = true
        //button.backgroundColor = .blue
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        return button
    }()
    
    fileprivate let reviewTab: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reviews", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.setTitleColor(UIColor.red, for: .selected)
        //button.backgroundColor = .yellow
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        return button
    }()
    
    fileprivate let tabLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    fileprivate let dividerLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }()
    
    fileprivate let buttonStackView: UIStackView = {
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
        
        buttonStackView.addArrangedSubview(menuTab)
        buttonStackView.addArrangedSubview(reviewTab)
        
        addSubview(buttonStackView)
        addSubview(tabLine)
        addSubview(dividerLine)
        
        firstTabConstraint = tabLine.leadingAnchor.constraint(equalTo: leadingAnchor)
        secondTabConstaint = tabLine.leadingAnchor.constraint(equalTo: centerXAnchor)
        
        NSLayoutConstraint.activate([
            
            // buttons
            buttonStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: dividerLine.leadingAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: dividerLine.centerXAnchor),
            //buttonStackView.heightAnchor.constraint(equalTo: menuTab.heightAnchor, multiplier: 1.5),
            
            // coloured tab line
            tabLine.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            firstTabConstraint,
            tabLine.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            tabLine.heightAnchor.constraint(equalToConstant: 1),
            
            // divider line
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
        animateTabSelection(isMenuTabSelected: isMenuTabSelected)
        delegate.tabButtonTapped(menuTabSelected: isMenuTabSelected)
    }
    
    func animateTabSelection(isMenuTabSelected: Bool) {
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
    }

}
