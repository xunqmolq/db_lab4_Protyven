CREATE TABLE Brand
(
  Brand_name VARCHAR NOT NULL,
  PRIMARY KEY (Brand_name)
);

CREATE TABLE Review
(
  Stars FLOAT NOT NULL,
  Review_id INT NOT NULL,
  PRIMARY KEY (Review_id)
);

CREATE TABLE Ramen
(
  Variety VARCHAR NOT NULL,
  Style VARCHAR NOT NULL,
  Country VARCHAR NOT NULL,
  Review_id INT NOT NULL,
  Brand_name VARCHAR NOT NULL,
  PRIMARY KEY (Variety),
  FOREIGN KEY (Review_id) REFERENCES Review(Review_id),
  FOREIGN KEY (Brand_name) REFERENCES Brand(Brand_name)
);