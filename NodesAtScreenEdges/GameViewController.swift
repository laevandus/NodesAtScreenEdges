//
//  GameViewController.swift
//  NodesAtScreenEdges
//
//  Created by Toomas Vahter on 03/12/2017.
//  Copyright © 2017 Augmented Code.
//

import UIKit
import SpriteKit
import GameplayKit

final class GameViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        guard let view = view as? SKView else { return }
        guard let scene = SKScene(fileNamed: "GameScene") else { return }
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
        
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
    }
    
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        guard let scene = (view as? SKView)?.scene as? GameScene else { return }
        scene.layoutNodes()
    }

    
    override var shouldAutorotate: Bool { return true }
    override var prefersStatusBarHidden: Bool { return true }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIDevice.current.userInterfaceIdiom == .phone ? .allButUpsideDown : .all
    }
}
