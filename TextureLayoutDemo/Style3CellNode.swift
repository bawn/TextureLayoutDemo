//
//  Style3CellNode.swift
//  TextureLayoutDemo
//
//  Created by bawn on 2019/8/9.
//  Copyright © 2019 bawn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class Style3CellNode: ASCellNode {
    let node1: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .gray
        return node
    }()
    let node2: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .red
        node.cornerRadius = 4
        return node
    }()
    
    let node3: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .gray
        node.cornerRadius = 4
        return node
    }()
    
    let node4: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .gray
        node.cornerRadius = 4
        return node
    }()
    
    let node5: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .gray
        node.cornerRadius = 4
        return node
    }()

    
    override init() {
        super.init()
        
        addSubnode(node1)
        addSubnode(node2)
        addSubnode(node3)
        addSubnode(node4)
        addSubnode(node5)
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        node1.style.preferredSize = CGSize(width: constrainedSize.max.width, height: 136)
        
        
        node2.style.preferredSize = CGSize(width: 58, height: 25)
        node2.style.layoutPosition = CGPoint(x: 14.0, y: 95.0)
        
        node3.style.height = ASDimensionMake(37.0)
        node4.style.preferredSize = CGSize(width: 80, height: 20)
        node5.style.preferredSize = CGSize(width: 80, height: 20)
        
        node4.style.spacingBefore = 14.0
        node5.style.spacingAfter = 14.0
        
        let absoluteLayout = ASAbsoluteLayoutSpec(children: [node2])
        
        let overlyLayout = ASOverlayLayoutSpec(child: self.node1, overlay: absoluteLayout)
        
        let insetLayout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14), child: node3)
        insetLayout.style.spacingBefore = 13.0
        insetLayout.style.spacingAfter = 25.0
        
        
        let bottomLayout = ASStackLayoutSpec.horizontal()
        bottomLayout.justifyContent = .spaceBetween
        bottomLayout.alignItems = .start
        bottomLayout.children = [node4, node5]
        bottomLayout.style.spacingAfter = 10.0
        //        bottomLayout.style.width = ASDimensionMake(constrainedSize.max.width)
        
        
        let stackLayout = ASStackLayoutSpec.vertical()
        stackLayout.justifyContent = .start
        stackLayout.alignItems = .stretch
        stackLayout.children = [overlyLayout, insetLayout, bottomLayout]
        
        return stackLayout
    }
}

