//
//  ViewController.swift
//  3DEarth
//
//  Created by PATRICIA S SIQUEIRA on 16/09/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 5)
        scene.rootNode.addChildNode(cameraNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .ambient
        lightNode.position = SCNVector3(0, 10, 2)
         
        scene.rootNode.addChildNode(lightNode)
        
        let sceneView = self.view as! SCNView
        sceneView.scene = scene
        
        sceneView.showsStatistics = true
        sceneView.backgroundColor = UIColor.black
        sceneView.allowsCameraControl = true
        
        let particleSystem = SCNParticleSystem()
        particleSystem.particleImage = UIImage(named: "star")
        particleSystem.birthDirection = .constant
        particleSystem.birthRate = 200
        particleSystem.particleLifeSpan = 1
        particleSystem.particleColor = .white
        particleSystem.particleSize = 0.02
        particleSystem.speedFactor = 0.8
        particleSystem.emittingDirection = SCNVector3(1,1,1)
        particleSystem.emitterShape = .some(SCNSphere(radius: 5))

        let particlesNode = SCNNode()
        particlesNode.scale = SCNVector3(2,2,2)
        particlesNode.addParticleSystem(particleSystem)
        sceneView.scene!.rootNode.addChildNode(particlesNode)
        
        let earthNode = EarthNode()
        scene.rootNode.addChildNode(earthNode)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


}

