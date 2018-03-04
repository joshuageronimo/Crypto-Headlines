# Crypto-Headlines
This app shows current headlines &amp; prices for cryptocurrencies. (Currently on Beta)

## features 
- Users can see & read current news article.
- Users can check out the price & information of each of the top 100 cryptocurrency in the market.

## Implementations
- I used newsapi.org to gather the news data from CryptoCoinsNews.com.
- I used CoinMarketCap.com's API to get the data of the top 100 cryptocurrency.
- Using the Decodable protocol, I efficiently parsed the JSON data that I need from the newsapi.org.
- I used a collectionview to present the data of both the news & the cryptocurrencies.
- For the news thumbnail, I cached the image to avoid wasting the user's cellular data when an image that is already loaded in the app is being reloaded in the collectionview.
