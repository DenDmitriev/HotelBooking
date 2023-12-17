//
//  DateTextField.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import SwiftUI

struct DateTextField: View {
    
    let placeholder: String
    @Binding var date: Date?
    let initialDate: Date? //AppCalendar.calendar.date(from: DateComponents(year: 2000, month: 1, day: 1)) ?? Date.now
    @Binding var isValidate: Bool?
    let validation: (() -> Bool)?
    @State var font: Font = AppFonts.regular3
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(placeholder)
                    .font(font)
                    .foregroundStyle(AppColors.grayOne)
                
                if let date {
                    Text(AppFormatter.dateFormatter.string(from: date))
                        .frame(height: AppGrid.pt24)
                        .onAppear {
                            withAnimation {
                                font = AppFonts.regular2
                            }
                        }
                        .onDisappear {
                            withAnimation {
                                font = AppFonts.regular3
                            }
                        }
                }
            }
            
            DatePicker(selection: dateWrapper(), displayedComponents: .date) {
                Text(placeholder)
                    .font(AppFonts.regular3)
                    .foregroundStyle(AppColors.grayOne)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .labelsHidden()
            .opacity(0.011)
        }
        .onChange(of: date, {
            committed()
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: AppGrid.pt52)
        .padding(.horizontal, AppGrid.pt16)
        .padding(.vertical, AppGrid.pt10)
        .background(AppColors.backgroundList)
        .cornerRadius(AppGrid.pt10)
        .overlay {
            if !(isValidate ?? true) {
                RoundedRectangle(cornerRadius: AppGrid.pt10)
                    .stroke(.red, lineWidth: 1)
            }
        }
    }
    
    private func committed() {
        isValidate = validation?() ?? true
    }
    
    private func dateWrapper() -> Binding<Date> {
        Binding<Date>(
            get: { initialDate ?? Date.now },
            set: { date = $0 })
    }
}

#Preview {
    DateTextField(placeholder: "Дата", date: .constant(nil), initialDate: Date.now, isValidate: .constant(nil), validation: nil)
}
