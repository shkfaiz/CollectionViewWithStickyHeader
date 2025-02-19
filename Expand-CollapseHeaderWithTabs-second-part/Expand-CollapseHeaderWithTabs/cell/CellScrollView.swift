//
//  CellScrollView.swift
//  Expand-CollapseHeaderWithTabs
//
//  Created by yusef naser on 4/18/20.
//  Copyright © 2020 solutionplus. All rights reserved.
//

import UIKit

class CellScrollView : UICollectionViewCell {
    
    lazy var scrollView : UIScrollView = {
        let s = UIScrollView ()
        s.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: s.topAnchor , constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: s.leadingAnchor , constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: s.trailingAnchor , constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: s.bottomAnchor , constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalTo: s.widthAnchor , multiplier: 1).isActive = true
        containerView.heightAnchor.constraint(greaterThanOrEqualTo: s.heightAnchor , multiplier: 1.01).isActive = true
        return s

    }()
    
    let containerView  = UIView()

    
    private lazy var stackViews : UIStackView = {
       let s = UIStackView()
        s.axis = .vertical
        s.spacing = 20
        s.distribution = .fillEqually


        for i in 0..<50 {
            // Add the views to the stack view
            let view = UIView()
            view.heightAnchor.constraint(equalToConstant: 250).isActive = true
            if i % 2 == 0 {
                view.backgroundColor = .green
            } else {
                view.backgroundColor = .blue
            }
            s.addArrangedSubview(view)
        }
        
        return s
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    private func initViews () {
        addViews()
    }

    private func addViews () {
        
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: 0).isActive = true

        containerView.addSubview(stackViews)
        stackViews.translatesAutoresizingMaskIntoConstraints = false
        stackViews.topAnchor.constraint(equalTo: containerView.topAnchor , constant: 8 ).isActive = true
        stackViews.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 8).isActive = true
        stackViews.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: -8).isActive = true
        stackViews.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor , constant: -8).isActive = true
    }
    
}


