//
//  CountUpView.swift
//  ConvenienceToolApp
//
//  Created by 渡邊魁優 on 2022/10/18.
//

import SwiftUI

struct CountUpView: View {
    @AppStorage("CountNum") var num = 0
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text(String(num))
                .font(.largeTitle)
            Spacer()
            Spacer()
            
            HStack {
                VStack {
                    Button(action: {
                        num -= 12
                    }) {
                        Text("-12")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                }
                    Button(action: {
                        num -= 1
                    }) {
                        Image(systemName: "minus.circle")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                }
                VStack {
                    Button(action: {
                        num += 12
                    }) {
                        Text("+12")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                }
                    Button(action: {
                        num += 1
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                }
            }
            Button {
                num = 0
            } label: {
                Text("0に戻す")
                    .font(.title3)
                    .foregroundColor(Color.black)
            }
            Spacer()
        }
    }
}

struct CountUpView_Previews: PreviewProvider {
    static var previews: some View {
        CountUpView()
    }
}
