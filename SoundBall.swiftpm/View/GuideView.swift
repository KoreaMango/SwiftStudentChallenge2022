//
//  File.swift
//  SoundBall
//
//  Created by 강민규 on 2022/06/30.
//

import Foundation
import SwiftUI

struct GuideView : View {
    var body: some View {
            ZStack(alignment: .center) {
                VStack{
                    Spacer()
                    HStack{
                        Text("상단에")
                            .font(Font.largeTitle.weight(.bold))
                        Text("메뉴")
                            .font(Font.largeTitle.weight(.bold))
                            .foregroundColor(.red)
                        Text("를")
                            .font(Font.largeTitle.weight(.bold))
                    }
                    Text("통해서 벽을 설정하세요!")
                        .font(Font.largeTitle.weight(.bold))
                    Spacer()
                    HStack{
                        Text("벽의")
                            .font(Font.largeTitle.weight(.bold))
                        Text("색")
                            .font(Font.largeTitle.weight(.bold))
                            .foregroundColor(.yellow)
                        Text("에 따라")
                            .font(Font.largeTitle.weight(.bold))
                    }
                    Text("나는 소리가 다릅니다!").font(Font.largeTitle.weight(.bold))
                   
                    Spacer()
                    HStack{
                        Text("게임 시")
                            .font(Font.largeTitle.weight(.bold))
                        Text("무음모드")
                            .font(Font.largeTitle.weight(.bold))
                            .foregroundColor(.green)
                        Text("를")
                            .font(Font.largeTitle.weight(.bold))
                    }
                    Text("풀어주세요 :)")
                        .font(Font.largeTitle.weight(.bold))

                    Spacer()
            }
            .onAppear {
                SoundPlayer.shared.initAudio()
            }
        }
    }
}
