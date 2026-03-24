import SwiftUI

struct AddPlaceView: View {
    @Environment(\.dismiss) private var dismiss
    
    var onAdd: (Place) -> Void
    
    var validator = FormValidator()
    
    var longitudeErrorMessage: String? {
        validator.validateCoordinate(long, coordinateType: .longitude)?.errorDescription
    }
    
    var latitudeErrorMessage: String? {
        validator.validateCoordinate(lat, coordinateType: .latitude)?.errorDescription
    }
    
    @State private var name: String = ""
    @State private var lat: String = ""
    @State private var long: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("New Place")) {
                    TextField("Name", text: $name)
                    FormTextField(
                        value: $lat,
                        errorString: .constant(latitudeErrorMessage),
                        labelText: "Latitude",
                        hintText: "90"
                    )
                    FormTextField(
                        value: $long,
                        errorString: .constant(longitudeErrorMessage),
                        labelText: "Longitude",
                        hintText: "90",
                    )
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
                    .disabled(!isValid())
                }
            }
        }
    }
    
    func isValid() -> Bool{
        return latitudeErrorMessage == nil && longitudeErrorMessage == nil
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
