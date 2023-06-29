//
//  GameView.swift
//  SoundBall
//
//  Created by 강민규 on 2023/06/29.
//

import SwiftUI

struct GameView: View {
    @State var isLoading : Bool = true
    
    var body: some View {
        ZStack{
           if isLoading {
                // Launch Screen
               GuideView()
           } else {
               VStack(){
                   MenuView()
                   ContentView()
               }
           }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                isLoading.toggle()
            })
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
