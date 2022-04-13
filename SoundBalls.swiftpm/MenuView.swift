//
//  MenuView.swift
//  SoundBalls
//
//  Created by KangMinGyu on 2022/04/07.
//

import SwiftUI
// MARK: Main View
struct MenuView: View {
    var body: some View {
        HStack(){
            VStack(){
                HStack(){
                    Text("Object").padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                    objectPicker()
                }
                HStack(){
                    Text("Pitch")
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    pitchPicker()
                }
            }
            backBtn()
            startBtn()
            stopBtn()
        }
    }
}

// MARK: ObjectPickerView
struct objectPicker: View {
    @State private var suggestedObject: Object = .ball
    var body: some View{
        Picker("Object", selection: $suggestedObject) {
                ForEach(ObjectCase.allCases) { object in
                    Text(object.rawValue.capitalized)
                        .tag(object.suggestedObject)
                }
        }.pickerStyle(.segmented)
    }
}

// MARK: PitchPickerView
struct pitchPicker: View {
  
    @State private var suggestedPitches: PitchCase = .C4
    
    var body: some View{
        Picker("Pitch", selection: $suggestedPitches) {
                ForEach(pitches.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                        .tag(flavor.suggestedPitches)
                }
        }.pickerStyle(.segmented)
    }
}

// MARK: BackBtn
struct backBtn: View{
    var body: some View{
        Button(action : backAction){
            Label("",systemImage: "gobackward")
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))

        }
    }
}

// MARK: StartBtn
struct startBtn: View{
    var body: some View {
        Button(action : startBall){
            Label("",systemImage: "play.fill")
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))

        }
    }
}

// MARK: StopBtn
struct stopBtn: View{
    var body: some View{
        Button(action : stopBall){
            Label("",systemImage: "pause.fill")
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))

        }
    }
}
