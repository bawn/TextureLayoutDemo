//
//  Style1CellNode.swift
//  TextureLayoutDemo
//
//  Created by bawn on 2019/8/2.
//  Copyright © 2019 bawn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class Style1CellNode: ASCellNode {
    let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "gradientPurpleHighlighted")
        return node
    }()
    let textNode: ASTextNode = {
        let node = ASTextNode()
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        node.attributedText = NSAttributedString(string: "文字内容", attributes: attributes)
        return node
    }()
    
    override init() {
        super.init()
        
        
        addSubnode(imageNode)
        addSubnode(textNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let imageLayout = ASWrapperLayoutSpec(layoutElement: imageNode)
        let textLayout = ASCenterLayoutSpec(centeringOptions: .XY,
                                            sizingOptions: .minimumXY,
                                            child: textNode)
        return ASOverlayLayoutSpec(child: imageLayout, overlay: textLayout)
    }
}
