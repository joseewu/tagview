import SwiftUI

struct TegView: View {
    let viewModel:TagViewModel
    
    init(with viewModel:TagViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Button(action: {
            print("tappp")
        }) {
            Text(viewModel.title)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25/2).fill(Color.blue))
        }
        .scaledToFill()
        .buttonStyle(PlainButtonStyle())
        
    }
}
