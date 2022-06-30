import SwiftUI

@main
struct MyApp: App {
    @State var isLoading : Bool = true
    var body: some Scene {
        WindowGroup {
            ZStack{
               if isLoading {
                    // Launch Screen
                   launchScreenView()
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
}
