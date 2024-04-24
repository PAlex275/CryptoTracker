//
//  CoinDetailDataService.swift
//  CryptoTracker
//
//  Created by Alex Petrisor on 23.04.2024.
//
import Foundation
import Combine

class CoinDetailDataService{
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    init(coin: CoinModel){
        self.coin = coin
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins//\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false?x_cg_demo_api_key=CG-BUjmC954m2PDoYLkGYJtbTjY%22") else {return }
        
        
        coinDetailSubscription = NetworkingManager.fetch(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}
