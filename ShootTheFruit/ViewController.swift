//
//  ViewController.swift
//  ShootTheFruit
//
//  Created by Helene Wentworth on 2020/05/31.
//  Copyright © 2020 Helene Wentworth. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        //Custom Behaviour
        boxAnchor.actions.showInterface.onAction = handleShowInterface(_:)
       
    }
    
    //MARK: - Custom Behaviour
    
    func handleShowInterface(_ entity: Entity?){
        guard entity != nil else{
            return
        }
         print("Scene Started")
        
    }
    
    //MARK: - Custom Trigger
    func dropCans() {
        if let sceneAnchor = arView.scene.anchors[0] as? Experience.Box {
           
            sceneAnchor.notifications.dropCans.post()
            
        }
    }
}
