//
//  Style2CellNode.swift
//  TextureLayoutDemo
//
//  Created by bawn on 2019/8/2.
//  Copyright © 2019 bawn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class Style2CellNode: ASCellNode {
    let coverImageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "gradientPurpleHighlighted")
        return node
    }()
    let titleNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 0
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        node.attributedText = NSAttributedString(string: "文字内容文字内容文字内容文字内容文字内容文字内容文字内容文字内容文字内容", attributes: attributes)
        return node
    }()
    
    let subTitleNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 0
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        node.attributedText = NSAttributedString(string: "文字内容文字内容文字内容文字内容文字内容文字内容文字内容文字内容文字内容", attributes: attributes)
        return node
    }()
    
    
    let dateTextNode: ASTextNode = {
        let node = ASTextNode()
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        node.attributedText = NSAttributedString(string: "昨天", attributes: attributes)
        return node
    }()
    
    let shareNumberNode: ASTextNode = {
        let node = ASTextNode()
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        node.attributedText = NSAttributedString(string: "12", attributes: attributes)
        return node
    }()
    
    let likeNumberNode: ASTextNode = {
        let node = ASTextNode()
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        node.attributedText = NSAttributedString(string: "29", attributes: attributes)
        return node
    }()
    
    let shareImageNode = ASImageNode()
    let likeImageNode = ASImageNode()
    
    override init() {
        super.init()
        
        shareImageNode.backgroundColor = .gray
        likeImageNode.backgroundColor = .gray
        
        addSubnode(coverImageNode)
        addSubnode(titleNode)
        addSubnode(subTitleNode)
        addSubnode(dateTextNode)
        addSubnode(likeImageNode)
        addSubnode(likeNumberNode)
        addSubnode(shareImageNode)
        addSubnode(shareNumberNode)
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        shareImageNode.style.preferredSize = CGSize(width: 15, height: 15)
        likeImageNode.style.preferredSize = CGSize(width: 15, height: 15)
    
        let likeLayout = ASStackLayoutSpec(direction: .horizontal,
                                           spacing: 4,
                                           justifyContent: .start,
                                           alignItems: .center,
                                           children: [likeImageNode, likeNumberNode])
    
        let shareLayout = ASStackLayoutSpec(direction: .horizontal,
                                            spacing: 4,
                                            justifyContent: .start,
                                            alignItems: .center,
                                            children: [shareImageNode, shareNumberNode])
        
        let otherLayout = ASStackLayoutSpec(direction: .horizontal,
                                            spacing: 12,
                                            justifyContent: .start,
                                            alignItems: .center,
                                            children: [likeLayout, shareLayout])

        let bottomLayout = ASStackLayoutSpec(direction: .horizontal,
                                             spacing: 0,
                                             justifyContent: .spaceBetween,
                                             alignItems: .center,
                                             children: [dateTextNode, otherLayout])


        titleNode.style.spacingBefore = 12.0

        subTitleNode.style.spacingBefore = 16.0
        subTitleNode.style.spacingAfter = 20.0
        
        let rationLayout = ASRatioLayoutSpec(ratio: 0.5, child: coverImageNode)

        let contentLayout = ASStackLayoutSpec(direction: .vertical,
                                              spacing: 0,
                                              justifyContent: .start,
                                              alignItems: .stretch,
                                              children: [rationLayout, titleNode, subTitleNode, bottomLayout])
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: contentLayout)
    }
}
