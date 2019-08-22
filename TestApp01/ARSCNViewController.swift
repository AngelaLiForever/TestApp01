//
//  ARSCNViewController.swift
//  TestApp01
//
//  Created by Angela Li on 2019-08-21.
//  Copyright © 2019 Angela Li. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
  //  var displayword: DisplayWord
    
    
    required init?(coder aDocoder: NSCoder){
        
     //   displayword = DisplayWord()
        super.init(coder: aDocoder)
        
    }
    
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        // sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        //Angela
        let node = SCNNode()
        node.position = SCNVector3(x:0, y:0, z:-0.5)
        
        //node.geometry = scene
        
        //Angela
        sceneView.scene.rootNode.addChildNode(node)
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .vertical
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
       // let item = displayword.getDisplayWord()
        //  displayText(text:"Hello World")
        print ("Outside")
   //     print (item.text)
        
        if anchor is ARPlaneAnchor{
            let planeNode = SCNNode()
            planeNode.position =  SCNVector3(x:0, y:0.1, z:-0.5)
            
       //     let item = displayword.getDisplayWord()
            // displayText(text:"Hello World")
            print ("Inside renderer")
        //    print (item.text)
            // displayText(text:item.text)
            displayText(text: "Hello World")
            
        }else {
            return
        }
    }
    
    func displayText(text: String){
        
        let textGeometry = SCNText (string:text, extrusionDepth: 1.0)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.red
        
        let textNode = SCNNode(geometry:textGeometry)
        
        textNode.position = SCNVector3(-0.3, 0.02, -0.1)
        
        textNode.scale = SCNVector3(0.01, 0.01, 0.01)
        
        sceneView.scene.rootNode.addChildNode(textNode)
        
    }
    
    //Angela: detecting touches on the screen and interpreted as location
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //
    //        if let touch = touches.first{
    //            let touchLocation = touch.location(in:sceneView)
    //
    //            //convert 2D location to 3D location called hitTest
    //            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
    //
    //            if !results.isEmpty{
    //                print ("touch the plane")
    //            }else {
    //                print("touch somewhere else")
    //            }
    //
    //
    //
    //        }
    //
    //    }
    
}

