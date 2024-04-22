//
//  MarketDataService.swift
//  CryptoTracker
//
//  Created by Alex Petrisor on 18.04.2024.
//



import Foundation
import Combine

class MarketDataService{
    
    @Published var marketData: MarketDataModel? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    
    init(){
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global?vx_cg_demo_api_key=CG-BUjmC954m2PDoYLkGYJtbTjY") else {return }
        
        marketDataSubscription = NetworkingManager.fetch(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
