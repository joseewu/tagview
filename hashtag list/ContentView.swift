import SwiftUI

struct ContentView: View {
    private let testGenres:[String] = ["hiphop", "fjifosdifjsdijfos", "jazz", "piano-jazz", "techno", "deep techno"]
    
    var viewModels:[TagViewModel] {
        var models:[TagViewModel] = []
        for (index,genre) in testGenres.enumerated() {
            models.append(TagViewModel(id: index, title: "#\(genre)"))
        }
        return models
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Spacer()
                TagsList(viewModels, geometry: geometry)
                Spacer()
            }
        }
    }
    
}
/*
 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }
 */
