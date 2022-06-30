//
//  MenuView.swift
//  SoundBall
//
//  Created by KangMinGyu on 2022/04/07.
//

import SwiftUI

// MARK: Main View
struct MenuView: View {
    var body: some View {
            VStack(){
                VStack(){
                    HStack(){
                        objectPicker()
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    }
                    HStack(){
                        pitchPicker()
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 5))
                    }
                }
                HStack{
                    backBtn()
                    removeBtn()
                    startStopBtn()
                }
            }
    }
}

// MARK: ObjectPickerView
struct objectPicker: View {
    @State var suggestedObject: Object = .rectWidth
    var body: some View{
        Picker("Object", selection: $suggestedObject) {
                ForEach(ObjectCase.allCases) { object in
                    Text(object.rawValue.capitalized)
                        .tag(object.suggestedObject)
                }
        }.pickerStyle(.segmented)
            .onChange(of: suggestedObject){ _ in
                GameScene.shared.wallFlag = suggestedObject.rawValue
            }
    }
}

// MARK: PitchPickerView
struct pitchPicker: View {
  
    @State private var suggestedPitches: PitchCase = .C3
    
    var body: some View{
        Picker("Pitch", selection: $suggestedPitches) {
                ForEach(pitches.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                        .tag(flavor.suggestedPitches)
                        
                }
        }.pickerStyle(.segmented)
            .onChange(of: suggestedPitches){ _ in
                GameScene.shared.pitchFlag = suggestedPitches.rawValue
            }
            
    }
}
// MARK: BackBtn
struct backBtn: View{
    var body: some View{
        Button(action : backAction ){
            Label("",systemImage: "gobackward")
                .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 20))
                .foregroundColor(.red)

        }
    }
}

// MARK: BackBtn
struct removeBtn: View{
    var body: some View{
        Button(action : removeAction ){
            Label("",systemImage: "memories")
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                .foregroundColor(.yellow)

        }
    }
}

// MARK: StartBtn
struct startStopBtn: View{
    @State var flag : Bool = false
    var body: some View {
        if flag {
            Button(action :{
                startBall()
                flag = false
            }){
                Label("",systemImage: "play.fill")
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 30))
                    .foregroundColor(.green)
            }
        }
        else{
            Button(action :{
                stopBall()
                flag = true
            }){
                Label("",systemImage: "pause.fill")
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 30))
                    .foregroundColor(.green)
            }
        }
    }
    
    
    
}


// MARK: Btn
public func backAction() {
    guard let node = GameScene.shared.shapeNodes.pop() else {return}
    node.removeFromParent()
    //GameScene.shared.shapeNodes.removeAll(keepingCapacity: false)
}

public func removeAction(){
   for node in GameScene.shared.ballNodes
    {
        node.removeFromParent()
    }
    //GameScene.shared.ballNodes.removeAll(keepingCapacity: false)
    GameScene.shared.addBall()
}
public func stopBall() {
    GameScene.shared.stopWorld(true)
}

public func startBall() {
    GameScene.shared.stopWorld(false)
}


