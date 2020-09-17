//
//  EarthNode.swift
//  3DEarth
//
//  Created by PATRICIA S SIQUEIRA on 16/09/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//


import SceneKit

class EarthNode: SCNNode {

    override init() {
        super.init()
        self.geometry = SCNSphere(radius: 1)
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "terra")
        
        self.geometry?.firstMaterial?.shininess = 50
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(0, 1, 0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
