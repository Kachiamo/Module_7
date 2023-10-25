
--Display the various tables--

SELECT * FROM card_holder
SELECT * FROM credit_card
SELECT * FROM merchant
SELECT * FROM merchant_category
SELECT * FROM "transaction"

--Alter column name to avoid ambiguity and repititions--
ALTER TABLE merchant_category 
RENAME COLUMN "name" To merchant_cat_name


ALTER TABLE merchant_category 
RENAME COLUMN "id" To merchant_cat_id

ALTER TABLE merchant 
RENAME COLUMN "name" To merchant_name

ALTER TABLE merchant
RENAME COLUMN "id" To merchant_id

ALTER TABLE joint_merchant
RENAME COLUMN merchant_id To merchant_identity

ALTER TABLE "transaction"
RENAME COLUMN "id" To transaction_id


--Create a join for tables--

SELECT card, cardholder_id, "name"
FROM credit_card
INNER JOIN card_holder 
ON credit_card.cardholder_id = card_holder.id;



SELECT merchant_id, merchant_name, merchant_cat_id, merchant_cat_name
FROM merchant
INNER JOIN merchant_category
ON merchant.merchant_id_category = merchant_category.merchant_cat_id;


SELECT transaction_id, "name", cardholder_id, "date", amount, card_number, merchant_id, merchant_name, merchant_cat_id, merchant_cat_name
FROM joint_credit, "transaction", joint_merchant
WHERE joint_credit.card = "transaction".card_number
AND   "transaction".merchant_id = joint_merchant.merchant_identity;



--Creating tables to hold the joins--
CREATE TABLE joint_credit AS(

SELECT card, cardholder_id, "name"
FROM credit_card
INNER JOIN card_holder 
ON credit_card.cardholder_id = card_holder.id

);

CREATE TABLE joint_merchant AS(
SELECT merchant_id, merchant_name, merchant_cat_id, merchant_cat_name
FROM merchant
INNER JOIN merchant_category
ON merchant.merchant_id_category = merchant_category.merchant_cat_id

);




CREATE TABLE combined_table AS(
SELECT transaction_id, "name", cardholder_id, "date", amount, card_number, merchant_id, merchant_name, merchant_cat_id, merchant_cat_name
FROM joint_credit, "transaction", joint_merchant
WHERE joint_credit.card = "transaction".card_number
AND   "transaction".merchant_id = joint_merchant.merchant_identity
);




