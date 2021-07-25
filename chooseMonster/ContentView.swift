//
//  ContentView.swift
//  chooseMonster
//
//  Created by Maksimova Anna on 18.06.2021.
//

import SwiftUI
import UIKit
import SceneKit
import SceneKit.ModelIO


struct ContentView: View {
    @State private var isGlassesMenuShow = false
    @State public var bgColor = Color.gray
    @State public var glass = "none"
    @ObservedObject public var siren = SirenHead()
    var body: some View {
        
        HStack{
      
            VStack{
               
                SceneView(scene: siren.getSirenHead(scolor: bgColor), options: [.autoenablesDefaultLighting,.allowsCameraControl]).frame(width:UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height-100)
               
                if isGlassesMenuShow
                {
                    VStack{
                    ScrollView(.horizontal) {
                    HStack{
                    ZStack{
                        Button(action: {
                            siren.setGlasses(glassFileName: "none")
                        }){
                            Color(red: 237/255, green: 237/255, blue: 237/255)
                                .frame(width: 75, height: 50)}}
                    ZStack{
                    Button(action: {
                        siren.setGlasses(glassFileName: "glass")
                    }){
                                Image("glass")
                                    .resizable().frame(width: 100, height: 50)}}
                    ZStack{
                    Button(action: {
                        siren.setGlasses(glassFileName: "glass2")
                    }){
                                Image("glass2")
                                    .resizable().frame(width: 100, height: 50)}}
                    ZStack{
                        Button(action: {
                            siren.setGlasses(glassFileName: "catglasses")
                        }){
                                    Image("catglasses")
                                        .resizable().frame(width: 100, height: 50)}}
                    ZStack{
                        Button(action: {
                            siren.setGlasses(glassFileName: "beerglasses")
                        }){
                                    Image("beerglasses")
                                        .resizable().frame(width: 100, height: 50)}}
                        ZStack{
                            Button(action: {
                                siren.setGlasses(glassFileName: "oldglasses")
                            }){
                                        Image("oldglasses")
                                            .resizable().frame(width: 100, height: 50)}}
                        ZStack{
                            Button(action: {
                                siren.setGlasses(glassFileName: "slimglasses")
                            }){
                                        Image("slimglasses")
                                            .resizable().frame(width: 100, height: 50)}}
                        ZStack{
                            Button(action: {
                                siren.setGlasses(glassFileName: "snowglasses")
                            }){
                                        Image("snowglasses")
                                            .resizable().frame(width: 100, height: 50)}}
                        ZStack{
                            Button(action: {
                                siren.setGlasses(glassFileName: "heartglasses")
                            }){
                                        Image("heartglasses")
                                            .resizable().frame(width: 100, height: 50)}}
                    }}.frame(width: UIScreen.main.bounds.width, height: 50, alignment: .center)
                        }
                }
                Spacer().frame(height: 50)
            }
            VStack{
                ColorPicker("", selection: $bgColor).scaleEffect(CGSize(width: 1.5, height: 1.5)).frame(alignment: .topTrailing)
                ZStack{
            Button(action: {
                        self.isGlassesMenuShow.toggle()}) {
                                Image("glasses")
                                    .renderingMode(.original).resizable().frame(width: 60, height: 30)
                    }}

            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .trailing
              )
            
        }}

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
func getModelNode(FileName: String) -> SCNNode {
    let myURL = Bundle.main.url(forResource: FileName, withExtension: "obj")
    let asset = MDLAsset(url: myURL!)
    let object = asset.object(at: 0)
    let node = SCNNode(mdlObject: object)
return node
}
func getModelNodeU(FileName: String) -> SCNNode {
    let myURL = Bundle.main.url(forResource: FileName, withExtension: "usdz")
    let asset = MDLAsset(url: myURL!)
    let object = asset.object(at: 0)
    let node = SCNNode(mdlObject: object)
return node
}
struct itemButton{
    var name: String
    var siren: SirenHead
    var body: some View {
        ZStack{
        Button(action: {
            siren.setGlasses(glassFileName: name)
        }){
                    Image(name)
                        .resizable().frame(width: 100, height: 50)}}
    }
    
}

class SirenHead: ObservableObject{
    @Published var scene = SCNScene()
    var glasses = SCNNode()
    let sirenhead = getModelNode(FileName: "sirenhead")
    let material = SCNMaterial()
   
    func setGlasses(glassFileName: String) {
        if(glassFileName.caseInsensitiveCompare("none") == .orderedSame){
            glasses.removeFromParentNode()
         }
        else{
         glasses.removeFromParentNode()
         glasses = getModelNode(FileName: glassFileName)
            scene.rootNode.addChildNode(glasses)}
    }
    func getSirenHead(scolor: Color) -> SCNScene{
        material.diffuse.contents = UIColor(scolor)
        sirenhead.geometry?.firstMaterial = material
        scene.rootNode.addChildNode(sirenhead)
        var san = SCNNode()
        san = getModelNodeU(FileName: "boots")
        
        scene.rootNode.addChildNode(san)
        return scene
    }
   
    
}

    


