CREATE TABLE "transaction"(
transaction_id INT PRIMARY KEY,
	"date" DATE,
	amount BIGINT,
	card_number BIGINT,
	FOREIGN KEY(card_number) REFERENCES credit_card(card),
	merchant_id INT,
	FOREIGN KEY (merchant_id) REFERENCES merchant("id")
);