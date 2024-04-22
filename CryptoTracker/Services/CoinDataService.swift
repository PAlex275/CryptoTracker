//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by Alex Petrisor on 18.04.2024.
//

import Foundation
import Combine

class CoinDataService{
    
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    init(){
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=250&page=1&sparkline=true&price_change_percentage=24h?x_cg_demo_api_key=CG-BUjmC954m2PDoYLkGYJtbTjY") else {return }
        
        coinSubscription = NetworkingManager.fetch(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}
