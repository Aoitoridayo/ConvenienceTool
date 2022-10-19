//
//  TimerSetView.swift
//  ConvenienceToolApp
//
//  Created by 渡邊魁優 on 2022/10/19.
//

import SwiftUI

struct TimerSetView: View {
    @AppStorage("timerNumKey") var timerNum = 10
    
    var body: some View {
        VStack {
            Text("\(timerNum)秒")
                .font(.largeTitle)
            Picker(selection: $timerNum) {
                Text("10秒")
                    .tag(10)
                Text("20秒")
                    .tag(20)
                Text("30秒")
                    .tag(30)
                Text("40秒")
                    .tag(40)
                Text("50秒")
                    .tag(50)
                Text("60秒")
                    .tag(60)
                Text("120秒")
                    .tag(120)
                Text("180秒")
                    .tag(180)
                Text("240秒")
                    .tag(240)
                Text("300秒")
                    .tag(300)
            } label: {
                Text("秒数を選択")
            }
            .pickerStyle(.wheel)
        }
    }
}

struct TimerSetView_Previews: PreviewProvider {
    static var previews: some View {
        TimerSetView()
    }
}
