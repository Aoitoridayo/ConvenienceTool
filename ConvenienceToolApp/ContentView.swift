
import SwiftUI

struct ContentView: View {
    private let tools = ["おつり計算", "カウント", "タイマー"]
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    NavigationLink(destination: ChangeCalclationView()) {
                        Text(tools[0])
                    }
                    NavigationLink(destination: CountUpView()) {
                        Text(tools[1])
                    }
                    NavigationLink(destination: TimerView()) {
                        Text(tools[2])
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
