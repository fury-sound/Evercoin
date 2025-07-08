//
//  IncomeExpenseChartView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 05.07.2025.
//

import SwiftUI
import Charts

struct IncomeExpenseChartView: View {

    let data: [FlowModelByMonth]
    @State private var selectedMonth: String
    @State private var isInitialLoad = true
    
    private var activeIncomeColor: Color { .orange }
    private var activeExpenseColor: Color { .green }
    private var inactiveIncomeColor: Color { Color.orange.opacity(0.3) }
    private var inactiveExpenseColor: Color { Color.green.opacity(0.3) }
    
    init() {
        self.data = monthsData
        self._selectedMonth = State(initialValue: monthsData.last?.month ?? "Июнь")
    }
    
    private func barColor(for category: String, isActive: Bool) -> Color {
        switch (category, isActive) {
        case ("Доходы", true): return activeIncomeColor
        case ("Доходы", false): return inactiveIncomeColor
        case ("Расходы", true): return activeExpenseColor
        case ("Расходы", false): return inactiveExpenseColor
        default: return .gray
        }
    }
    
    private func textColor(isActive: Bool) -> Color {
        isActive ? .primary : .secondary
    }
    
    private func chartAxis() -> some AxisContent {
        AxisMarks(values: .automatic) { value in
            AxisValueLabel {
                if let month = value.as(String.self) {
                    Text(month)
                        .foregroundColor(textColor(isActive: selectedMonth == month))
                }
            }
        }
    }
    
    private func chartOverlay(proxy: ChartProxy) -> some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(.clear)
                .contentShape(Rectangle())
                .onTapGesture { location in
                    handleTap(location: location, proxy: proxy, geometry: geometry)
                }
        }
    }
    
    private func handleTap(location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) {
        // Получаем Anchor<CGRect> для области графика
//        let plotAnchor = proxy.plotFrame
        guard let plotAnchor = proxy.plotFrame else { return }
        
        // Вычисляем фактический CGRect в координатах GeometryReader
        let plotRect = geometry[plotAnchor]
        
        // Проверяем, что касание было внутри области графика
        guard plotRect.contains(location) else { return }
        
        // Преобразуем координаты касания в координаты графика
        let relativeX = location.x - plotRect.origin.x
        
        // Получаем значение по X-координате
        if let month = proxy.value(atX: relativeX) as String? {
//            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7)) {
                selectedMonth = month
//            }
        }
    }
    
    struct SelectedMonthView: View {
        let month: String
        
        var body: some View {
            Text("Выбран месяц: \(month)")
                .font(.headline)
                .foregroundColor(.orange)
                .padding(.top, 8)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
//             Text("Финансы по месяцам")
//                 .font(.title2.bold())
//                 .padding(.bottom, 4)
             
             Chart(data) { item in
                 let isActive = selectedMonth == item.month
                 
                 BarMark(
                     x: .value("Месяц", item.month),
                     y: .value("Сумма", isInitialLoad && isActive ? 0 : item.amount)
                 )
                 .foregroundStyle(barColor(for: item.category, isActive: isActive))
                 .cornerRadius(10)

                 .position(by: .value("Категория", item.category))
             }
             .chartXAxis(content: chartAxis)
             .chartOverlay(content: chartOverlay)
//             .frame(height: 300)
             .onAppear {
                 // Анимация появления при первой загрузке
//                 withAnimation(.easeInOut(duration: 0.8)) {
                     isInitialLoad = false
//                 }
             }
             
//             SelectedMonthView(month: selectedMonth)
         }
        .frame(height: 150)
        .padding(.horizontal, 16)
    }
}

#Preview {
    IncomeExpenseChartView()
}
