//
//  ContentView.swift
//  ConvenienceToolApp
//
//  Created by 渡邊魁優 on 2022/10/18.
//

import SwiftUI

struct ContentView: View {
    @State var tool = ["おつり計算", "カウント", "タイマー"]
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    NavigationLink(destination: ChangeCalclationView()) {
                        Text(tool[0])
                    }
                    NavigationLink(destination: CountUpView()) {
                        Text(tool[1])
                    }
                    NavigationLink(destination: TimerView()) {
                        Text(tool[2])
                    }
                }
                .navigationTitle(Text("便利ツール"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
