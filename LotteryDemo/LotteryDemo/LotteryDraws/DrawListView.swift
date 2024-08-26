//
//  LotteryDrawsView.swift
//  LotteryDemo
//
//  Created by Rukshan on 23/08/2024.
//

import SwiftUI

struct DrawListView: View {
    @StateObject var viewModel = DependencyProvider.drawListViewModel
    var body: some View {
            VStack {
                Group {
                    if viewModel.isLoading {
                        ProgressView(viewModel.loadingTitle)
                    } else if let errorMessage = viewModel.errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.lotteryDemoRed)
                    } else {
                        NavigationStack(path: $viewModel.navigationPath) {
                            List {
                                ForEach(viewModel.draws) { model in
                                    NavigationLink(value: model) {
                                        DrawListItemView(model: model)
                                    }
                                }
                            }
                            .navigationTitle(viewModel.drawListTitle)
                            .navigationDestination(for: DrawItemModel.self) { model in
                                LotteryDrawDetailsView(drawItemModel: model, swipedRight: {
                                    viewModel.navigateToPrevious(currentItem: model)
                                }, swipedLeft: {
                                    viewModel.navigateToNextItem(currentItem: model)
                                })
                            }
                        }
                    }
                }
                
            }.task {
                await viewModel.fetchDraws()
            }.tint(.lotteryDemoWisteria)
    }
}

#Preview {
    NavigationView {
        DrawListView()
    }
}
