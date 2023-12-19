//
//  TouristView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct TouristForm: View {
    enum FocusedField {
        case name, surname, dateOfBirth, citizenship, internationalPassport, internationalPassportEndDate
    }
    
    @Binding var tourist: Tourist
    @Binding var isValid: Bool
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
    
    @State private var intPassport: String = ""
    @State private var intPassportIsValidate: Bool?
    
    @State private var intPassportEndDate: Date?
    @State private var intPassportEndDateIsValidate: Bool?
    
    @FocusState private var focusedField: FocusedField?
    
    private var validationables: Set<Bool?> {
        [nameIsValidate,
         surnameIsValidate,
         dateOfBirthIsValidate,
         citizenshipIsValidate,
         intPassportIsValidate,
         intPassportEndDateIsValidate]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppGrid.pt16) {
            HStack {
                Text((number + 1).formatted(.numeral) + " турист")
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
                .focused($focusedField, equals: .name)
                .onChange(of: name) {
                    tourist.name = name
                    print(tourist.name)
                }
                
                PersonalTextField(placeholder: "Фамилия", personal: $surname, isValidate: $surnameIsValidate) {
                    2...99 ~= surname.count
                }
                .focused($focusedField, equals: .surname)
                .onChange(of: surname) {
                    tourist.surname = surname
                }
                
                let initialDateBorn = AppCalendar.calendar.date(byAdding: .year, value: -18, to: .now)
                DateTextField(placeholder: "Дата рождения", date: $dateOfBirth, initialDate: initialDateBorn, isValidate: $dateOfBirthIsValidate) {
                    (dateOfBirth ?? Date.now).isPersonExistingToday
                }
                .focused($focusedField, equals: .dateOfBirth)
                .onChange(of: dateOfBirth) {
                    if let dateOfBirth {
                        tourist.dateOfBirth = dateOfBirth
                    }
                }
                
                PersonalTextField(placeholder: "Гражданство", personal: $citizenship, isValidate: $citizenshipIsValidate) {
                    2...99 ~= citizenship.count
                }
                .focused($focusedField, equals: .citizenship)
                .onChange(of: citizenship) {
                    tourist.citizenship = citizenship
                }
                
                PersonalTextField(placeholder: "Номер загранпаспорта", personal: $intPassport, isValidate: $intPassportIsValidate) {
                    intPassport.isPassport
                }
                .focused($focusedField, equals: .internationalPassport)
                .onChange(of: intPassport) {
                    tourist.intPassport = intPassport
                }
                
                let initialDatePassport = AppCalendar.calendar.date(byAdding: .month, value: 3, to: Date.now)
                DateTextField(placeholder: "Срок действия загранпаспорта", date: $intPassportEndDate, initialDate: initialDatePassport, isValidate: $intPassportEndDateIsValidate) {
                    (intPassportEndDate ?? .now).isValidIntPassportForFlight
                }
                .focused($focusedField, equals: .internationalPassportEndDate)
                .onChange(of: intPassportEndDate) {
                    if let intPassportEndDate {
                        tourist.intPassportEndDate = intPassportEndDate
                    }
                }
            }
        }
        .onSubmit {
            if focusedField == .name {
                focusedField = .surname
            } else if focusedField == .surname {
                focusedField = .dateOfBirth
            } else if focusedField == .dateOfBirth {
                focusedField = .citizenship
            } else if focusedField == .citizenship {
                focusedField = .internationalPassport
            } else if focusedField == .internationalPassport {
                focusedField = .internationalPassportEndDate
            } else {
                focusedField = nil
            }
        }
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt15)
        .onChange(of: validationables) {
            self.isValid = validationables.isValid
        }
    }
}

#Preview {
    TouristForm(tourist: .constant(.init(id: 1)), isValid: .constant(false), number: 1)
}
