import SwiftUI

struct ContentView: View {
   var body: some View {
       Text("Hello, World!")
           .onAppear(perform: printFontNames)
   }

   func printFontNames() {
       for familyName in UIFont.familyNames {
           print(familyName)

           for fontName in UIFont.fontNames(forFamilyName: familyName) {
               print("\(fontName)")
           }
       }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
       ContentView()
   }
}
