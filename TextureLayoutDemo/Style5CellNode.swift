//
//  Style5CellNode.swift
//  TextureLayoutDemo
//
//  Created by bawn on 2019/8/9.
//  Copyright © 2019 bawn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class Style5CellNode: ASCellNode {
    
    let displayNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .gray
        return node
    }()
    let textNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 1
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        node.attributedText = NSAttributedString(string: "文字内容文字内容文字内容文字内容文字内容文字内容文字内容文字内容文字内容", attributes: attributes)
        return node
    }()
    
    
    override init() {
        super.init()
        
        addSubnode(displayNode)
        addSubnode(textNode)
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        displayNode.style.preferredSize = CGSize(width: 42.0, height: 18.0)
        textNode.style.flexShrink = 1
        
        let contentLayout = ASStackLayoutSpec.horizontal()
        contentLayout.justifyContent = .spaceBetween
        contentLayout.alignItems = .start
        contentLayout.children = [textNode, displayNode]
        
        let insetLayout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0), child: contentLayout)
        
        return insetLayout
        
    }
}
