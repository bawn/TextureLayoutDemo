//
//  Style6CellNode.swift
//  TextureLayoutDemo
//
//  Created by bawn on 2019/8/9.
//  Copyright © 2019 bawn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class Style6CellNode: ASCellNode {
    
    let coverImageNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .gray
        return node
    }()
    let otherNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .red
        return node
    }()
    
    
    override init() {
        super.init()
        
        addSubnode(coverImageNode)
        addSubnode(otherNode)
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        otherNode.style.preferredSize = CGSize(width: 100, height: 40)
        let coverLayout = ASRatioLayoutSpec(ratio: 0.5, child: coverImageNode)
        
        let otherLayout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10.0,
                                                                 left: 10.0,
                                                                 bottom: CGFloat(Float.infinity),
                                                                 right: CGFloat(Float.infinity)),
                                            child: otherNode)
        
        let contentLayout = ASOverlayLayoutSpec(child: coverLayout, overlay: otherLayout)
        return contentLayout
    }
}
