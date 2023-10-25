SELECT * FROM card_holder
SELECT * FROM credit_card
SELECT * FROM merchant
SELECT * FROM merchant_category
SELECT * FROM "transaction"


SELECT card, cardholder_id, "name"
FROM credit_card
INNER JOIN card_holder 
ON credit_card.cardholder_id = card_holder.id;