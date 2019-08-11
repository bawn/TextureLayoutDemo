//
//  HeadNode.swift
//  TextureLayoutDemo
//
//  Created by bawn on 2019/8/9.
//  Copyright © 2019 bawn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class HeadNode: ASCellNode {
    let imageHeight: CGFloat = 190
    var offset: CGFloat = 0.0
    let coverImageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "cat")
        return node
        
    }()
    
    let maskNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return node
    }()
    
    
    let topContentNode = ASDisplayNode()
    
    let titleNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 0
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        node.attributedText = NSAttributedString(string: "文字内容", attributes: attributes)
        return node
    }()
    
    override init() {
        super.init()
        
        clipsToBounds = false
        coverImageNode.addSubnode(maskNode)
        topContentNode.addSubnode(coverImageNode)
        addSubnode(topContentNode)
        addSubnode(titleNode)
        
        coverImageNode.forcedSize = CGSize(width: UIScreen.main.bounds.width, height: imageHeight)
        coverImageNode.layoutSpecBlock = {[unowned self]node, constrainedSize in
            return ASWrapperLayoutSpec(layoutElement: self.maskNode)
        }
        
        topContentNode.layoutSpecBlock = {[unowned self]node, constrainedSize in
            self.coverImageNode.style.preferredSize = CGSize(width: constrainedSize.max.width, height: self.imageHeight)
            let placehold = ASLayoutSpec()
            placehold.style.preferredSize = CGSize(width: constrainedSize.max.width, height: self.imageHeight)
            let insets = UIEdgeInsets(top: self.offset,
                                      left: 0,
                                      bottom: 0,
                                      right: 0)
            
            let scaleLayout = ASInsetLayoutSpec(insets: insets, child: self.coverImageNode)
            let otherLayout = ASOverlayLayoutSpec(child: placehold, overlay: scaleLayout)
            return otherLayout
        }
        
    }
    
    
    func updateParallax(_ offset: CGFloat) {
        self.offset = offset
        topContentNode.setNeedsLayout()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        titleNode.style.spacingAfter = 12
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 12,
                                 justifyContent: .start,
                                 alignItems: .start,
                                 children: [topContentNode, titleNode])
    }
}
