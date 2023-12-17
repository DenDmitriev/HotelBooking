//
//  TouristView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct TouristView: View {
    @Binding var tourist: Tourist
    @Binding var isAllValid: Bool
    @State  var number: Int
    
    @State private var isShow: Bool = true
    
    @State private var name: String = ""
    @State private var nameIsValidate: Bool?
    
    @State private var surname: String = ""
    @State private var surnameIsValidate: Bool?
    
    @State private var dateOfBirth: Date?
    @State private var dateOfBirthIsValidate: Bool?
    
    @State private var citizenship: String = ""
    @State private var citizenshipIsValidate: Bool?
    
    @State private var internationalPassport: String = ""
    @State private var internationalPassportIsValidate: Bool?
    
    @State private var internationalPassportEndDate: Date?
    @State private var internationalPassportEndDateIsValidate: Bool?
    
    private var validationables: Set<Bool?> {
        [nameIsValidate,
         surnameIsValidate,
         dateOfBirthIsValidate,
         citizenshipIsValidate,
         internationalPassportIsValidate,
         internationalPassportEndDateIsValidate]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppGrid.pt16) {
            HStack {
                Text(number.formatted(.numeral) + " турист")
                    .font(AppFonts.title2)
                
                Spacer()
                
                ToggleButton(image: (on: "chevron.up", of: "chevron.down"), action: {
                    withAnimation(.easeInOut) {
                        isShow.toggle()
                    }
                }, isOn: $isShow)
            }
            .padding(.bottom, AppGrid.pt4)
            
            if isShow {
                PersonalTextField(placeholder: "Имя", personal: $name, isValidate: $nameIsValidate) {
                    2...99 ~= name.count
                }
                
                PersonalTextField(placeholder: "Фамилия", personal: $surname, isValidate: $surnameIsValidate) {
                    2...99 ~= surname.count
                }
                
                let initialDateBorn = AppCalendar.calendar.date(byAdding: .year, value: -18, to: Date.now)
                DateTextField(placeholder: "Дата рождения", date: $dateOfBirth, initialDate: initialDateBorn, isValidate: $dateOfBirthIsValidate) {
                    dateOfBirth ?? Date.now < Date.now
                }
                
                PersonalTextField(placeholder: "Гражданство", personal: $citizenship, isValidate: $citizenshipIsValidate) {
                    2...99 ~= citizenship.count
                }
                
                PersonalTextField(placeholder: "Номер загранпаспорта", personal: $internationalPassport, isValidate: $internationalPassportIsValidate) {
                    internationalPassport.isPassport
                }
                
                let initialDatePassport = AppCalendar.calendar.date(byAdding: .month, value: 3, to: Date.now)
                DateTextField(placeholder: "Срок действия загранпаспорта", date: $internationalPassportEndDate, initialDate: initialDatePassport, isValidate: $internationalPassportEndDateIsValidate) {
                    guard let internationalPassportEndDate,
                          let initialDatePassport
                    else { return false }
                    return internationalPassportEndDate >= initialDatePassport
                }
            }
        }
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt15)
        .onChange(of: validationables) {
            self.isAllValid = validationables.isValid
        }
    }
}

#Preview {
    TouristView(isAllValid: .constant(false), number: 1)
}
