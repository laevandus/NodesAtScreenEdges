//
//  GameScene.swift
//  NodesAtScreenEdges
//
//  Created by Toomas Vahter on 03/12/2017.
//  Copyright © 2017 Augmented Code.
//

import SpriteKit
import GameplayKit

final class GameScene: SKScene
{
    override func didMove(to view: SKView)
    {
        let nodeSize = CGSize(width: 100, height: 100)
        let colors: [UIColor] = [.red, .green, .blue, .yellow]
        let nodes = colors.map({ return SKSpriteNode(color: $0, size: nodeSize) })
        let names = ["topLeft", "topRight", "bottomLeft", "bottomRight"]
        
        for (index, node) in nodes.enumerated()
        {
            node.name = names[index]
        }
        
        nodes.forEach({ addChild($0) })
        
        layoutNodes()
    }
    
 
    private var initialSize: CGSize = .zero
    private var presentedSize: CGSize { return scene?.view?.bounds.size ?? size }
    private var presentedScaleFactor: CGFloat { return initialSize.width / presentedSize.width }
    
    override func sceneDidLoad()
    {
        super.sceneDidLoad()
        initialSize = size
    }
    
    
    func layoutNodes()
    {
        let margin: CGFloat = 10
        
        if let topLeft = childNode(withName: "topLeft") as? SKSpriteNode
        {
            topLeft.position.x = -presentedSize.width / 2.0 * presentedScaleFactor + topLeft.size.width / 2.0 + margin
            topLeft.position.y = presentedSize.height / 2.0 * presentedScaleFactor - topLeft.size.height / 2.0 - margin
        }
        
        if let topRight = childNode(withName: "topRight") as? SKSpriteNode
        {
            topRight.position.x = presentedSize.width / 2.0 * presentedScaleFactor - topRight.size.width / 2.0 - margin
            topRight.position.y = presentedSize.height / 2.0 * presentedScaleFactor - topRight.size.height / 2.0 - margin
        }
        
        if let bottomLeft = childNode(withName: "bottomLeft") as? SKSpriteNode
        {
            bottomLeft.position.x = -presentedSize.width / 2.0 * presentedScaleFactor + bottomLeft.size.width / 2.0 + margin
            bottomLeft.position.y = -presentedSize.height / 2.0 * presentedScaleFactor + bottomLeft.size.height / 2.0 + margin
        }
        
        if let bottomRight = childNode(withName: "bottomRight") as? SKSpriteNode
        {
            bottomRight.position.x = presentedSize.width / 2.0 * presentedScaleFactor - bottomRight.size.width / 2.0 - margin
            bottomRight.position.y = -presentedSize.height / 2.0 * presentedScaleFactor + bottomRight.size.height / 2.0 + margin
        }
    }
}
