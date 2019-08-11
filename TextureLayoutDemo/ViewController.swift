//
//  ViewController.swift
//  TextureLayoutDemo
//
//  Created by bawn on 2019/8/1.
//  Copyright © 2019 bawn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {

    lazy var tableNode: ASTableNode = {
        let node = ASTableNode()
        node.delegate = self
        node.dataSource = self
        node.view.separatorStyle = .none
        return node
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubnode(tableNode)
        tableNode.frame = view.bounds
    }
}


extension ViewController: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        switch indexPath.row {
        case 0:
            return Style1CellNode()
        case 1:
            return Style2CellNode()
        case 2:
            return Style3CellNode()
        case 3:
            return Style4CellNode()
        case 4:
            return Style5CellNode()
        case 5:
            return Style6CellNode()
        default:
            return ASCellNode()
        }
    }
}
