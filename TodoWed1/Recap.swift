import SwiftUI

struct Clinic {
    var dogs: [Dog] = []
}


struct Dog: Pet {
    var name: String
    var age: Int
    var breed: String
    var isMicrochipped: Bool
}

protocol Pet {
    var isMicrochipped: Bool { get set }
}


struct ClinicView: View {
    var clinic = Clinic()
    
    var body: some View {
        Text("Hi")
    }
}

#Preview {
    ClinicView()
}
