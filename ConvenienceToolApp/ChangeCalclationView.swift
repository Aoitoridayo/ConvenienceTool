
import SwiftUI

struct ChangeCalclationView: View {
    @State var inputPrice = ""
    @State var inputMoney = ""
    @State var change = 0
    @State var isAlert = false
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                TextField("商品の代金", text: $inputPrice)
                    .font(.title)
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                Text("円")
                    .font(.title)
            }
            
            HStack {
                TextField("お客さんが払った金額", text: $inputMoney)
                    .font(.title)
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                Text("円")
                    .font(.title)
            }
            
            Text("おつり\(change)円")
                .font(.title)
            
            Button {
                if let unWrappedPrice = Int(inputPrice) {
                    if let unWrappedMoney = Int(inputMoney) {
                        change = unWrappedMoney - unWrappedPrice
                    }
                    else {
                        isAlert = true
                    }
                }
                else {
                    isAlert = true
                }
            } label: {
                Text("計算")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100)
                    .background(Color.red)
                    .clipShape(Circle())
            }
            .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
            .alert("エラー", isPresented: $isAlert) {
                Button("OK") {}
            } message: {
                Text("金額を入力してください")
            }
        }
    }
}

struct ChangeCalclationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeCalclationView()
    }
}
