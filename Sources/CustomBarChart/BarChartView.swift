import SwiftUI
import Charts

public struct BarChartView: View {
    @StateObject private var viewModel: BarChartViewModel
    
    public init(
        data: [ChartDataPoint],
        configuration: ChartConfiguration
    ) {
        self._viewModel = StateObject(wrappedValue: BarChartViewModel(data: data, configuration: configuration))
    }
    
    public var body: some View {
        GeometryReader { geometry in
            Chart {
                ForEach(viewModel.chartData) { point in
                    BarMark(
                        x: .value(viewModel.configuration.xAxisLabel, point.label),
                        y: .value(viewModel.configuration.yAxisLabel, viewModel.animateChart ? point.value : 0)
                    )
                    .foregroundStyle(
                        viewModel.selectedBar?.id == point.id ?
                        viewModel.configuration.selectedGradient : viewModel.configuration.barGradient
                    )
                    .cornerRadius(8)
                    .annotation(position: .top, spacing: 20) {
                        if viewModel.selectedBar?.id == point.id {
                            VStack(spacing: 4) {
                                Text("\(Int(point.value))")
                                    .font(.caption.bold())
                                Text("\(viewModel.configuration.yAxisUnit)")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.1), radius: 5, y: 2)
                            )
                            .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .opacity(viewModel.selectedBar == nil || viewModel.selectedBar?.id == point.id ? 1 : 0.5)
                }
                
                if let selectedBar = viewModel.selectedBar {
                    RuleMark(
                        x: .value(viewModel.configuration.xAxisLabel, selectedBar.label)
                    )
                    .foregroundStyle(.purple.opacity(0.3))
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                    
                    RuleMark(
                        y: .value(viewModel.configuration.yAxisLabel, selectedBar.value)
                    )
                    .foregroundStyle(.purple.opacity(0.3))
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                }
            }
            .chartYScale(domain: 0...viewModel.configuration.maxValue)
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic(desiredCount: viewModel.yAxisSteps))
            }
            .chartXAxis {
                AxisMarks(preset: .aligned)
            }
            .chartOverlay { proxy in
                Rectangle()
                    .fill(.clear)
                    .contentShape(Rectangle())
                    .gesture(makeSelectionGesture(geometry: geometry, proxy: proxy))
            }
            .onAppear {
                viewModel.startChartAnimation()
            }
            .accessibilityLabel("Bar Chart")
            .accessibilityValue(viewModel.generateAccessibilityDescription())
        }
        .frame(height: 300)
    }
    
    private func makeSelectionGesture(geometry: GeometryProxy, proxy: ChartProxy) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                viewModel.updateSelectedBar(at: value.location, proxy: proxy, geometry: geometry)
            }
            .onEnded { _ in
                viewModel.clearSelection()
            }
    }
}
