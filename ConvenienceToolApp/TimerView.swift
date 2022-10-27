
import SwiftUI

struct TimerView: View {
    @AppStorage("timerNumKey") var timerNum = 10
    @State var timerHandler : Timer?
    @State var isAlert = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()
                Text(String(timerNum))
                    .font(.largeTitle)
                Spacer()
                
                HStack(spacing: 20) {
                    addTimerBottonViwe(addCount: "-60", buttonColor: .red)
                    addTimerBottonViwe(addCount: "-10", buttonColor: .red)
                    addTimerBottonViwe(addCount: "+10", buttonColor: .blue)
                    addTimerBottonViwe(addCount: "+60", buttonColor: .blue)
                }
                
                HStack(spacing: 30) {
                //スタートボタン
                    Button(action: {
                        if let unWapedTimerHandler = timerHandler {
                            if unWapedTimerHandler.isValid == true {
                                unWapedTimerHandler.invalidate()
                            }
                        }
                    }) {
                        Text("ストップ")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 140, height: 140)
                    }
                    .background(Color.red)
                    .clipShape(Circle())
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                    
                //ストップボタン
                    Button(action: {
                        startTimer()
                    }) {
                        Text("スタート")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 140, height: 140)
                    }
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                }
                Button {
                    timerNum = 0
                } label: {
                    Text("リセット")
                        .font(.title3)
                        .foregroundColor(Color.black)
                }
                Spacer()
            }
            .alert(isPresented: $isAlert) {
                Alert(title: Text("終了"),
                      message: Text("タイマー終了です"),
                      dismissButton: .default(Text("確認"))
                )
            }
        }
    }
    
    func startTimer() {
        if let unWrapedTimerHandler = timerHandler {
            if unWrapedTimerHandler.isValid == true {
                return
            }
        }
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            timerNum -= 1
            if timerNum <= 0 {
                timerHandler?.invalidate()
                isAlert = true
                timerNum = 0
            }
        }
    }
}

struct addTimerBottonViwe: View {
    let addCount: String
    let buttonColor: Color
    @AppStorage("timerNumKey") var timerNum = 10
    
    var body: some View {
        Button(action: {
            timerNum += Int(addCount)!
        }) {
            Text(addCount)
                .font(.title)
                .foregroundColor(Color.white)
                .frame(width: 70, height: 70)
        }
        .background(buttonColor)
        .clipShape(Circle())
        .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
