import SwiftUI

struct ContentView: View {
  
  @State private var isScreenTapped: Bool = false
  @State private var offsetY: CGFloat = 1000
  @State private var offsetX: CGFloat = 500
  
  let colorSet1: [Color] = [.red, .blue, .green, .mint]
  let colorSet2: [Color] = [.yellow, .orange, .purple, .secondary]
  
  var colorSet: [Color] {
    isScreenTapped ? colorSet2 : colorSet1
  }
  
  
    var body: some View {
      ZStack {
        LinearGradient(
          colors: colorSet,
          startPoint: .topLeading,
          endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
        
        Text("SwiftUI Basics")
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundStyle(.black)
          .offset(x: offsetX, y: offsetY)
      }
      .onTapGesture {
        withAnimation(.easeIn(duration: 0.5)) {
          isScreenTapped.toggle()
          offsetY = isScreenTapped ? 0 : -1000
          offsetX = isScreenTapped ? 0 : -200
        }
      }
    }
}

#Preview {
    ContentView()
}
