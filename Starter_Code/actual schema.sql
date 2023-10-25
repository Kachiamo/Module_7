CREATE TABLE card_holder(
  "id" INT PRIMARY KEY NOT NULL,
  "name" VARCHAR(20)  

);


CREATE TABLE credit_card(
 card BIGINT PRIMARY KEY NOT NULL,
  cardholder_id INT,
	FOREIGN KEY(cardholder_id) REFERENCES card_holder("id")    

);



CREATE TABLE merchant_category(
 "id" INT PRIMARY KEY NOT NULL,
  "name" VARCHAR(50)    

);



CREATE TABLE merchant(
  merchant_id INT PRIMARY KEY NOT NULL,
  "name" VARCHAR(50),  
  merchant_id_category INT,
	FOREIGN KEY (merchant_id_category) REFERENCES merchant_category("id")
);

ALTER TABLE merchant RENAME COLUMN merchant_id TO "id"

CREATE TABLE "transaction"(
"id" INT PRIMARY KEY NOT NULL,
	"date" DATE NOT NULL,
	amount NUMERIC(4,2),
	card_number BIGINT,
	FOREIGN KEY (card_number) REFERENCES credit_card(card),
	merchant_id INT,
	FOREIGN KEY (merchant_id) REFERENCES merchant("id")
); 