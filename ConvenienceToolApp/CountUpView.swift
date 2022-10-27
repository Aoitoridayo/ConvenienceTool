
import SwiftUI

struct CountUpView: View {
    @AppStorage("CountNum") var number = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text(String(number))
                .font(.largeTitle)
            Spacer()
            
            HStack {
                VStack {
                    twelveButtonView(countNumber: "-12")
                    oneButtonView(singImage: "minus.circle", countNumber: -1)
                }
                VStack {
                    twelveButtonView(countNumber: "+12")
                    oneButtonView(singImage: "plus.circle", countNumber: 1)
                }
            }
            Button {
                number = 0
            } label: {
                Text("リセット")
                    .font(.title3)
                    .foregroundColor(Color.black)
            }
            Spacer()
        }
    }
}
//±1ボタン
struct oneButtonView: View {
    let singImage: String
    let countNumber: Int
    @AppStorage("CountNum") var number = 0
    
    var body: some View {
        Button(action: {
            number += countNumber
        }) {
            Image(systemName: singImage)
                .resizable()
                .scaledToFit()
                .padding()
        }
    }
}

//±12ボタン
struct twelveButtonView: View {
    let countNumber: String
    @AppStorage("CountNum") var number = 0
    
    var body: some View {
        Button(action: {
            number += Int(countNumber)!
        }) {
            Text(countNumber)
                .padding()
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .clipShape(Circle())
        }
    }
}

struct CountUpView_Previews: PreviewProvider {
    static var previews: some View {
        CountUpView()
    }
}
