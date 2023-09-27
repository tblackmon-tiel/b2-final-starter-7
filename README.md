# Little Esty Shop - Bulk Discounts
Expanding from the [original group project](https://github.com/WillWeston94/little-shop-7) of building a small "esty" page, the goal of this solo project was to dive into deeper queries and data flow. This was done by adding the concept of a bulk discount - a discount applied to a particular item on an invoice based on the quantity of that item being purchased at once.<br><br>
It's worth noting that for more practice with brown-field projects, I opted to use a premade repo of the same project by Turing, found [here](https://github.com/turingschool-examples/b2-final-starter-7), instead of the original version linked above.<br><br>
All styling credit goes to Turing, I simply followed the styling that existed in the premade version of the project, anywhere it existed.

## Deployment
This app was deployed to Heroku. As of writing this readme, it can be found [here](https://polar-bayou-19032-7ce299426a88.herokuapp.com/merchants/1/dashboard).

## Technologies
- Ruby (3.2.2)
- Rails (7.0.5)
- Postgresql (using gem pg ~> 1.1)
- Heroku

With additional gems used for testing:
- capybara
- orderly
- pry
- shoulda-matchers
- simplecov

## User Stories
### 1: Merchant Bulk Discounts Index

As a merchant
When I visit my merchant dashboard
Then I see a link to view all my discounts
When I click this link
Then I am taken to my bulk discounts index page
Where I see all of my bulk discounts including their
percentage discount and quantity thresholds
And each bulk discount listed includes a link to its show page

### 2: Merchant Bulk Discount Create

As a merchant
When I visit my bulk discounts index
Then I see a link to create a new discount
When I click this link
Then I am taken to a new page where I see a form to add a new bulk discount
When I fill in the form with valid data
Then I am redirected back to the bulk discount index
And I see my new bulk discount listed

### 3: Merchant Bulk Discount Delete

As a merchant
When I visit my bulk discounts index
Then next to each bulk discount I see a button to delete it
When I click this button
Then I am redirected back to the bulk discounts index page
And I no longer see the discount listed

### 4: Merchant Bulk Discount Show

As a merchant
When I visit my bulk discount show page
Then I see the bulk discount's quantity threshold and percentage discount

### 5: Merchant Bulk Discount Edit

As a merchant
When I visit my bulk discount show page
Then I see a link to edit the bulk discount
When I click this link
Then I am taken to a new page with a form to edit the discount
And I see that the discounts current attributes are pre-poluated in the form
When I change any/all of the information and click submit
Then I am redirected to the bulk discount's show page
And I see that the discount's attributes have been updated

### 6: Merchant Invoice Show Page: Total Revenue and Discounted Revenue

As a merchant
When I visit my merchant invoice show page
Then I see the total revenue for my merchant from this invoice (not including discounts)
And I see the total discounted revenue for my merchant from this invoice which includes bulk discounts in the calculation

### 7: Merchant Invoice Show Page: Link to applied discounts

As a merchant
When I visit my merchant invoice show page
Next to each invoice item I see a link to the show page for the bulk discount that was applied (if any)

### 8: Admin Invoice Show Page: Total Revenue and Discounted Revenue

As an admin
When I visit an admin invoice show page
Then I see the total revenue from this invoice (not including discounts)
And I see the total discounted revenue from this invoice which includes bulk discounts in the calculation
