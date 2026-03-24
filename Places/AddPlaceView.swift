import SwiftUI

struct AddPlaceView: View {
    @Environment(\.dismiss) private var dismiss
    
    var onAdd: (Place) -> Void
    
    @State private var name: String = ""
    @State private var lat: String = ""
    @State private var long: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("New Place")) {
                    TextField("Name", text: $name)
                    TextField("Latitude", text: $lat)
                        .keyboardType(.decimalPad)
                    TextField("Longitude", text: $long)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Add New Place")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addPlace()
                    }
                }
            }
        }
    }
    
    func addPlace() {
        guard let latitude = Double(lat),
              let longitude = Double(long) else { return }
        
        let newPlace = Place(
            name: name.isEmpty ? nil : name,
            lat: latitude,
            long: longitude
        )
        
        onAdd(newPlace)
        dismiss()
    }
}
