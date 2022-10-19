import SwiftUI

struct TimerView: View {
    @AppStorage("timerNumKey") var timerNum = 10
    @State var timerHandler : Timer?
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                Text(String(timerNum))
                    .font(.largeTitle)
                Spacer()
                Spacer()
                
                HStack(spacing: 30) {
                    
                //スタートボタン
                    Button(action: {
                        startTimer()
                    }) {
                        Text("スタート")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 140, height: 140)
                    }
                    .background(Color.red)
                    .clipShape(Circle())
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                    
                //ストップボタン
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
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                }
                Spacer()
            }
            .alert(isPresented: $isAlert) {
                Alert(title: Text("終了"),
                      message: Text("タイマー終了です"),
                      dismissButton: .default(Text("確認"))
                )
            }
            .toolbar {
                NavigationLink("秒数設定") {
                    TimerSetView()
                }
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

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
