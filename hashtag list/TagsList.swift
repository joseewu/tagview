import SwiftUI

struct TagsList: View {
    @State private var totalHeight = CGFloat.infinity
    let viewModels:[TagViewModel]
    let geometry: GeometryProxy
    
    init(_ viewModels:[TagViewModel], geometry:GeometryProxy) {
        self.viewModels = viewModels
        self.geometry = geometry
        
    }
    var body: some View {
        VStack {
            self.generateContent(in: geometry)
        }.frame(maxHeight: totalHeight)
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment:.topLeading) {
            ForEach(0..<viewModels.count) { index in
                let viewModel = viewModels[index]
                self.tagView(for: viewModel)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if viewModel == self.viewModels.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if viewModel == self.viewModels.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }.background(viewHeightReader($totalHeight))
        }
    }
    
    private func tagView(for viewModel: TagViewModel) -> some View {
        TegView(with: viewModel)
    }
 
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
    
}
