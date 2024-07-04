//
//  SlidingTabView.swift
//  Expand-CollapseHeaderWithTabs
//
//  Created by Faizan on 2024-07-03.
//  Copyright © 2024 solutionplus. All rights reserved.
//

import Foundation
import SwiftUI

class PagerView: UIView {

    private let scrollView: UIScrollView
    private let bottomView: UIView

    override init(frame: CGRect) {
        scrollView = UIScrollView()
        bottomView = UIView()

        super.init(frame: frame)
        setupScrollView()
        setupViews()
        setupGestureRecognizer()
    }

    required init?(coder: NSCoder) {
        scrollView = UIScrollView()
        bottomView = UIView()

        super.init(coder: coder)

        setupScrollView()
        setupViews()
        setupGestureRecognizer()
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .lightGray
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: 100, height: 72)
        scrollView.delegate = delegate
        addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }

    private func setupViews() {
        let firstView = UIView()
        firstView.backgroundColor = .red
        firstView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        scrollView.addSubview(firstView)

        let secondView = UIView()
        secondView.backgroundColor = .blue
        secondView.frame = CGRect(x: 50, y: 0, width: 50, height: 50)
        scrollView.addSubview(secondView)

        bottomView.frame = CGRect(x: 0, y: 45, width: 50, height: 5)
        bottomView.tag = 99
        bottomView.backgroundColor = .green
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(bottomView)
    }

    private func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scrollView.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: scrollView)
        if location.x <= 50 {
            print("First view tapped")
            animateBottomView(to: 0)
        } else if location.x <= 100 {
            print("Second view tapped")
            animateBottomView(to: 50)
        }
    }

    private func animateBottomView(to x: CGFloat) {
        for subview in scrollView.subviews {
            if subview.tag == 99 {
                UIView.animate(withDuration: 0.3) {
                    subview.frame.origin.x = x
                }
                break
            }
        }
    }
}

