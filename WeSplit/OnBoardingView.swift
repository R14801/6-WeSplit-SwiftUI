//
//  OnBoardingView.swift
//  SplashScreenTest
//
//  Created by Rajat Nagvenker on 9/15/21.
//

import SwiftUI

struct OnBoardingView: View {
    @Environment(\.presentationMode) var presentationMode
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        VStack {
            //MARK:- Text
            Text("What's New")
                .font(.system(size: 50))
                .fontWeight(.black)
                .kerning(-1)

            
            //MARK:- List
            VStack {
                OnboardingItem(img: "apps.iphone", secImg: "sparkle", headline: "Refreshed UI", desc: "A refreshed user interface provides a cleaner look and feel to the app.", color1: Color.blue, color2: Color.yellow)
                
                OnboardingItem(img: "speedometer", headline: "Optimized Performance", desc: "Improved application response times and lanch speed.", color: Color(red: 1.0, green: 0.5, blue: 0.0, opacity: 1.0))
                
                OnboardingItem(img: "iphone", headline: "Added Device Support", desc: "Added support for the new iPhone 13 and iPhone 13 Pro models.", color: Color(red: 0.0, green: 0.7, blue: 0.9, opacity: 1.0))
                
            }.padding(.vertical, 75)
            
            //MARK:- Dismiss Button
            
            Button(action: {
                haptics.impactOccurred()
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                ZStack{
                    Color.blue
                        .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            })
        }
    }
    
    func OnboardingItem(img: String, secImg: String, headline: String, desc: String, color1: Color, color2: Color) -> some View {
        return HStack {
            ZStack {
                Image(systemName: img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(color1)
                
                Image(systemName: secImg)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20, alignment: .center)
                    .offset(x: 20, y: -30)
                    .foregroundColor(color2)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text(headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 5)
                Text(desc)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
            }
        }.padding()
    }

    func OnboardingItem(img: String, headline: String, desc: String, color: Color) -> some View {
        return HStack {
            ZStack {
                Image(systemName: img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(color)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text(headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 5)
                Text(desc)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
            }
        }.padding()
    }

}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}


