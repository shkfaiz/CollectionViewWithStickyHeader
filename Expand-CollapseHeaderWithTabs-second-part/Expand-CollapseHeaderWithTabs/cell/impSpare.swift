////
////  impSpare.swift
////  Expand-CollapseHeaderWithTabs
////
////  Created by Faizan on 2024-07-03.
////  Copyright © 2024 solutionplus. All rights reserved.
////
//
//import Foundation
////
////  ViewController.swift
////  Expand-CollapseHeaderWithTabs
////
////  Created by yusef naser on 4/18/20.
////  Copyright © 2020 solutionplus. All rights reserved.
////
//
//import UIKit
//
//class HeaderView: UICollectionReusableView {}
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var heightView : NSLayoutConstraint!
//    @IBOutlet weak var viewHeader: UIView!
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    let headerViewMaxHeight: CGFloat = 250
//    let headerViewMinHeight: CGFloat = -150
//
//    @IBOutlet weak var headerTopConstraint: NSLayoutConstraint!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(CellScrollView.self, forCellWithReuseIdentifier: "cellScroll")
//        collectionView.register(CellTableView.self, forCellWithReuseIdentifier: "cellTable")
//
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//        }
//
//        viewHeader.isUserInteractionEnabled = true
//
//        // Set up the top constraint for the header view
//        viewHeader.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            headerTopConstraint,
//            viewHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            viewHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            viewHeader.heightAnchor.constraint(equalToConstant: headerViewMaxHeight)
//        ])
//    }
//
//}
//
//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.row == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellScroll", for: indexPath) as! CellScrollView
//            cell.scrollView.delegate = self
//            cell.scrollView.setContentOffset(.zero, animated: false)
//            return cell
//        } else if indexPath.row == 1 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTable", for: indexPath) as! CellTableView
//            cell.tableView.delegate = self
//            cell.tableView.dataSource = self
//            cell.tableView.setContentOffset(.zero, animated: false)
//            return cell
//        }
//        return UICollectionViewCell()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//    }
//}
//
//
//extension ViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let y = scrollView.contentOffset.y
//        let newHeaderTopConstraint = headerTopConstraint.constant - y
//        if newHeaderTopConstraint > 0 {
//            headerTopConstraint.constant = 0
//        } else if newHeaderTopConstraint <= headerViewMinHeight {
//            headerTopConstraint.constant = headerViewMinHeight
//        } else {
//            headerTopConstraint.constant = newHeaderTopConstraint
//            scrollView.contentOffset.y = 0 // block scroll view
//        }
//    }
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "index : \(indexPath.row)"
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//}
