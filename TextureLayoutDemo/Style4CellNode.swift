//
//  Style4CellNode.swift
//  TextureLayoutDemo
//
//  Created by bawn on 2019/8/9.
//  Copyright © 2019 bawn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class Style4CellNode: ASCellNode {
    
    let node1: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .gray
        return node
    }()
    let node2: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .gray
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
    
    override init() {
        super.init()
        
        backgroundColor = .purple
        addSubnode(node1)
        addSubnode(node2)
        addSubnode(node3)
        addSubnode(node4)
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        node1.style.height = ASDimensionMake(20.0)
        var imageLayoutArray = [ASLayoutElement]()
        
        [node2, node3, node4].forEach { (node) in
            let layout = ASRatioLayoutSpec(ratio: 2.0/3.0, child: node)
            layout.style.flexGrow = 1 // 相当于宽度相等
            imageLayoutArray.append(layout)
        }
        
        let imageLayout = ASStackLayoutSpec.horizontal()
        imageLayout.justifyContent = .start
        imageLayout.alignItems = .start
        imageLayout.spacing = 14.0
        imageLayout.children = imageLayoutArray
        
        let contentLayout = ASStackLayoutSpec.vertical()
        contentLayout.justifyContent = .start
        contentLayout.alignItems = .stretch
        contentLayout.spacing = 22.0
        contentLayout.children = [self.node1, imageLayout]
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 22.0, left: 16.0, bottom: 22.0, right: 16.0), child: contentLayout)
    }
}
