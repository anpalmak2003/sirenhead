//
//  TestView.swift
//  chooseMonster
//
//  Created by Maksimova Anna on 18.07.2021.
//

import SwiftUI
import UIKit
import SceneKit
import SceneKit.ModelIO
struct TestView: View {
    @State private var isGlassesMenuShow = false
    @State public var bgColor = Color.gray
    
    var body: some View {
        var scene = SCNScene()
        let sirenhead = getModelNode(FileName: "sandals")
        ///scene.rootNode.addChildNode(sirenhead)
        return SceneView(scene: SCNScene(named:"sandals"), options: [.autoenablesDefaultLighting,.allowsCameraControl]).frame(width:UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height-100)
    }}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
