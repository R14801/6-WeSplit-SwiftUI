//
//  ContentView.swift
//  WeSplit
//
//  Created by Rajat Nagvenker on 9/13/21.
//

import SwiftUI

struct ContentView: View {
    @State var splashFinish = false
    @State var showOnBoarding = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        if !splashFinish {
            SplashScreen()
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7){
                        withAnimation(.linear(duration: 1)){
                            splashFinish.toggle()
                            
                        
                        }
                    }
                }
        }
        else {
            NavigationView {
                CalculationView()
                .onAppear(perform: {
                    self.showOnBoarding.toggle()
                })
                .sheet(isPresented: $showOnBoarding, content: {
                    OnBoardingView()
                        .onAppear(perform: {
                            haptics.impactOccurred()
                        })
                })
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
