# Crypto-Headlines
This app shows current headlines &amp; prices for cryptocurrencies. (iOS App Store)
Link: https://itunes.apple.com/us/app/crypto-headlines/id1353254322?ls=1&mt=8

## features 
- Users can see & read current news article.
- Users can check out the price & information of each of the top 100 cryptocurrency in the market.

## Implementations
- I used newsapi.org to gather the news data from CryptoCoinsNews.com.
- I used CoinMarketCap.com's API to get the data of the top 100 cryptocurrency.
- Using the Decodable protocol, I efficiently parsed the JSON data that I need from the newsapi.org.
- I used a collectionview to present the data of both the news & the cryptocurrencies.
- For the news thumbnail, I cached the image to avoid wasting the user's cellular data when an image that is already loaded in the app is being reloaded in the collectionview.

## Screenshots
![simulator screen shot - iphone x - 2018-03-04 at 23 52 13](https://user-images.githubusercontent.com/20343861/36958232-4c149df4-2008-11e8-970f-acad200388b1.png)

![simulator screen shot - iphone x - 2018-03-04 at 23 57 55](https://user-images.githubusercontent.com/20343861/36958266-803da7e2-2008-11e8-847b-e5fb0cd6ef5b.png)

![simulator screen shot - iphone x - 2018-03-04 at 23 58 06](https://user-images.githubusercontent.com/20343861/36958292-ae4efeb0-2008-11e8-860c-dd4e660f064f.png)

![simulator screen shot - iphone x - 2018-03-04 at 23 58 00](https://user-images.githubusercontent.com/20343861/36958310-d6fe29ee-2008-11e8-9e94-9435a76ffac2.png)
