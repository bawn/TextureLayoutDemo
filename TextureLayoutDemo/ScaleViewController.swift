//
//  ScaleViewController.swift
//  TextureLayoutDemo
//
//  Created by bawn on 2019/8/9.
//  Copyright © 2019 bawn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ScaleViewController: UIViewController {

    lazy var collectionNode: ASCollectionNode = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumLineSpacing = 1
        let node = ASCollectionNode(frame: view.bounds, collectionViewLayout: flowlayout)
        node.delegate = self
        node.dataSource = self
        return node
    }()
    
    let headNode = HeadNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubnode(collectionNode)
        collectionNode.view.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension ScaleViewController: ASCollectionDelegate, ASCollectionDataSource, ASCollectionDelegateFlowLayout {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeForItemAt indexPath: IndexPath) -> ASCellNode {
        let cell = ASCellNode()
        cell.backgroundColor = .cyan
        return cell
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRangeMake(CGSize(width: collectionNode.bounds.width, height: 44))
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, supplementaryElementKindsInSection section: Int) -> [String] {
        return [UICollectionView.elementKindSectionHeader, UICollectionView.elementKindSectionFooter]
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> ASCellNode {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return ASCellNode()
        }
        return headNode
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, sizeRangeForFooterInSection section: Int) -> ASSizeRange {
        return ASSizeRangeUnconstrained
    }

    func collectionNode(_ collectionNode: ASCollectionNode, sizeRangeForHeaderInSection section: Int) -> ASSizeRange {
        return ASSizeRangeUnconstrained
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        headNode.updateParallax(scrollView.contentOffset.y)
    }
    
}
