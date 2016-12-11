#Auto-bid
http://www.autobid.co/

This app was built on the following technologies:
Ruby '2.3.0'
Rails '5.0.0.1' (Framework)
HTML5
CSS
SCSS
JavaScript
JQuery (Library)
CarQuery API
Google Maps Matrix API
Redis Gem
Geocoder Gem
BCrypt Gem
HTTParty Gem
Nonogiri Gem

Auto-bid is a reverse auction site with the purpose of both giving customers the lowest availible price, and giving dealers a way to sell their inventory.
As developers, we had fun experimenting with API's that were new to us, and with Action Cable which has only been out for about 3 months. We plan on using more detailed API's to replace the carquery API but first we need to get permission(we ran into some problems getting a key to use edmunds api which would be the ideal API for our site, we will keep fighting though!).

Below I will walk you through beoth the user experience, and the dealers experience:

###USER: 
A user who has never registered starts off on our home page where they can learn more about Auto-bid and can register with us.
Once a user has an account, their landing page gives them 3 options to choose from (Edit account, create auction, view their current auctions).
The create auction form lets them input information about their desired car such as the year make and modal (which are fields that are populated by the CarQuery API). We also have the user fill out their address and a range of miles in which to notify dealers of their new auction.
The user can then choose to see their newly created auction, and with the power of Action Cable, they can see bids come in live without the need to refresh their page. (We decided to use Action Cable for this because we wanted to try it out since it is so new. It was a challenge, but as a team we did learn a lot in the process. Action Cable is normally used for live chats, but we decided that it would be interesting if we used it for our bid system instead.)

###DEALER:
When a dealer is logged in, they can choose to view actions in his area, or edit his account.
When the dealer decides to view actions in their area, we used the google maps matrix API to make sure that the auctions that are shown are only auctions that he is in range for (If an auction specified 25 miles as its range, then only dealers within 25 miles of the auction will have be able to view that auction.)
The dealer can then view information about each auction such as the cars year, make, and model that the user is looking to purchase. As well as the max price that the user is willing to pay.
Once a dealer finds an auction that he wants to bid on, he can go to that auctions page and start bidding.
We put special paramiters in place to make sure that the bids a dealer can make are 1) less or equal to the max price that the user is willing to pay, and 2) less than the last bid that was placed.
Again, thatnks to action cable the dealer can see other dealers bids coming in live. This will help the biding experience since dealers dont need to refresh a page just to see if they have been under-bid by another dealer interested in making a sale.
Once the auction expires, the user can contact the dealer who bid the lowest price so that he can go to the dealership and finish the sale.
