//
//  SplashScreen.swift
//  SplashScreenTest
//
//  Created by Rajat Nagvenker on 9/14/21.
//

import SwiftUI

struct SplashScreen: View {
    @State var isAnimating: Bool = false
    @State var endAnimating : Bool = false
    let haptics = UIImpactFeedbackGenerator()
    var body: some View {
        ZStack {
            Color.blue
                .frame(width: 160, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .animation(.linear(duration: 1))
                .opacity(endAnimating ? 0 : 1)
                .scaleEffect(endAnimating ? 10 : 1)
            
            VStack{
                HStack {
                    Group {
                    Text("We")
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .animation(.linear(duration: 0.2))
                        .offset(x: isAnimating ? 0 : -50, y: isAnimating ? -10 : -50)
                        .opacity(isAnimating ? 1 : 0)
                    Text("/")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .animation(.linear(duration: 0.2))
                        .offset(x: isAnimating ? 0 : -50, y: isAnimating ? 0 : 50)
                        .opacity(isAnimating ? 1 : 0)
                    Text("Split")
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .animation(.linear(duration: 0.2))
                        .offset(x: isAnimating ? 0 : 50, y: isAnimating ? 10 : 50)
                        .opacity(isAnimating ? 1 : 0)
                    }.opacity(endAnimating ? 0 : 1)
                }
            }
        }.animation(.linear(duration: 0.25))
        .opacity(isAnimating ? 1 : 0)
        .onAppear() {
            isAnimating.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                haptics.impactOccurred()
                withAnimation(.linear(duration: 0.2)) {
                    endAnimating.toggle()
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
            .previewDevice("iPhone 12")
    }
}
