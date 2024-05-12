CREATE DATABASE auction_system;

CREATE TABLE USER (
	UserID INT,
    Username VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Address VARCHAR(300),
    UserType VARCHAR(50),
    PRIMARY KEY (UserID)
);

CREATE TABLE ITEM (
	ItemID INT,
    Iname VARCHAR(200) NOT NULL,
    Item_Description TEXT,
    Item_Condition VARCHAR(50),
    StartingPrice Decimal(10, 2),
    CurrentPrice DECIMAL(10, 2),
    PRIMARY KEY (ItemID)
);

CREATE TABLE AUCTION (
	AuctionID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    Auction_Status VARCHAR(50) NOT NULL,
    PRIMARY KEY (AuctionID)
);

CREATE TABLE SELLER (
	SellerID INT,
    Rating INT,
    Reputation VARCHAR(50),
    PRIMARY KEY (SellerID)
);

CREATE TABLE BID (
	BidID INT,
    BidAmount DECIMAL(10, 2),
    BidTime DATETIME,
    PRIMARY KEY (BidID)
);

CREATE TABLE CATEGORY (
	CategoryID INT,
    Cname VARCHAR(100) NOT NULL,
    PRIMARY KEY (CategoryID)
);

ALTER TABLE ITEM
ADD SellerID INT,
ADD FOREIGN KEY (SellerID) REFERENCES SELLER(SellerID);

ALTER TABLE AUCTION
ADD ItemID INT,
ADD FOREIGN KEY (ItemID) REFERENCES ITEM(ItemID);

ALTER TABLE SELLER
ADD UserID INT,
ADD FOREIGN KEY (UserID) REFERENCES USER(UserID);

ALTER TABLE BID
ADD UserID INT,
ADD FOREIGN KEY (UserID) REFERENCES USER(UserID);

CREATE TABLE CATEGORIZED_IN (
	ItemID INT,
    CategoryID INT,
    PRIMARY KEY (ItemID, CategoryID)
);
ALTER TABLE CATEGORIZED_IN
ADD FOREIGN KEY (ItemID) REFERENCES ITEM(ItemID),
ADD FOREIGN KEY (CategoryID) REFERENCES CATEGORY(CategoryID);

CREATE TABLE PLACED_IN (
	BidID INT,
    AuctionID INT,
    PRIMARY KEY (BidID, AuctionID)
);
ALTER TABLE PLACED_IN
ADD FOREIGN KEY (BidID) REFERENCES BID(BidID),
ADD FOREIGN KEY (AuctionID) REFERENCES AUCTION(AuctionID);



INSERT INTO USER (UserID, Username, Email, Address, UserType)
VALUES (1, 'john_doe', 'john@gmail.com', '123 Main St', 'Buyer'),
(2, 'jane_smith', 'jane@gmail.com', '456 Oak Ave', 'Seller'),
(3, 'alice_green', 'alice@gmail.com', '789 Elm St', 'Buyer'),
(4, 'sam_jones', 'sam@gmail.com', '321 Maple St', 'Seller'),
(5, 'emily_white', 'emily@gmail.com', '567 Pine St', 'Buyer'),
(6, 'mike_brown', 'mike@gmail.com', '987 Cedar St', 'Buyer'),
(7, 'sarah_black', 'sarah@gmail.com', '654 Birch St', 'Buyer'),
(8, 'david_gray', 'david@gmail.com', '876 Elm St', 'Seller'),
(9, 'laura_baker', 'laura@gmail.com', '234 Oak St', 'Seller'),
(10, 'chris_harris', 'chris@gmail.com', '543 Maple St', 'Seller'),
(11, 'olivia_miller', 'olivia@gmail.com', '111 Cherry St', 'Seller'),
(12, 'liam_wilson', 'liam@gmail.com', '222 Pine St', 'Seller'),
(13, 'ava_johnson', 'ava@gmail.com', '333 Elm St', 'Seller'),
(14, 'noah_martin', 'noah@gmail.com', '444 Oak St', 'Seller'),
(15, 'emma_anderson', 'emma@gmail.com', '555 Maple St', 'Seller'),
(16, 'sophia_thompson', 'sophia@example.com', '666 Cedar St', 'Buyer'),
(17, 'william_hall', 'william@example.com', '777 Birch St', 'Buyer'),
(18, 'isabella_young', 'isabella@example.com', '888 Oak St', 'Buyer'),
(19, 'james_scott', 'james@example.com', '999 Elm St', 'Buyer'),
(20, 'olivia_lewis', 'olivia@example.com', '1010 Pine St', 'Buyer');

INSERT INTO SELLER (SellerID, Rating, Reputation, UserID)
VALUES(1, 4, 'good', 2),
(2, 5, 'excellent', 4),
(3, 3, 'average', 8),
(4, 4, 'good', 9),
(5, 5, 'excellent', 10),
(6, 2, 'poor', 11),
(7, 4, 'good', 12),
(8, 5, 'excellent', 13),
(9, 3, 'average', 14),
(10, 4, 'good', 15);

INSERT INTO ITEM (ItemID, Iname, Item_Description, Item_Condition, StartingPrice, CurrentPrice, SellerID)
VALUES (1, 'Laptop', 'High-performance laptop with SSD storage', 'New', 1200.00, 1250.00, 2),
(2, 'Smartphone', 'Latest smartphone model with dual-camera setup', 'New', 800.00, 800.00, 2),
(3, 'Headphones', 'Noise-canceling headphones with Bluetooth connectivity', 'Used', 100.00, 80.00, 8),
(4, 'Smartwatch', 'Fitness tracker smartwatch with heart rate monitor', 'New', 150.00, 150.00, 4),
(5, 'Tablet', '10-inch tablet with high-resolution display', 'Refurbished', 200.00, 180.00, 9),
(6, 'Digital Camera', 'Mirrorless digital camera with 4K video recording', 'New', 900.00, 900.00, 9),
(7, 'Gaming Console', 'Latest gaming console with bundled games', 'New', 400.00, 400.00, 10),
(8, 'Desktop Computer', 'Powerful desktop computer for gaming and productivity', 'Used', 1500.00, 1200.00, 10),
(9, 'Bluetooth Speaker', 'Portable Bluetooth speaker with waterproof design', 'New', 50.00, 50.00, 4),
(10, 'Wireless Router', 'Dual-band wireless router for high-speed internet', 'Used', 80.00, 60.00, 8);

INSERT INTO AUCTION (AuctionID, StartTime, EndTime, Auction_Status, ItemID)
VALUES (1, '2024-05-10 09:00:00', '2024-05-12 17:00:00', 'Ongoing', 1),
(2, '2024-05-11 10:00:00', '2024-05-13 18:00:00', 'Ended', 2),
(3, '2024-05-12 08:00:00', '2024-05-14 16:00:00', 'Ongoing', 3),
(4, '2024-05-13 11:00:00', '2024-05-15 19:00:00', 'Ongoing', 4),
(5, '2024-05-14 10:00:00', '2024-05-16 18:00:00', 'Ongoing', 5),
(6, '2024-05-15 09:00:00', '2024-05-17 17:00:00', 'Ended', 6),
(7, '2024-05-16 08:00:00', '2024-05-18 16:00:00', 'Ongoing', 7),
(8, '2024-05-17 11:00:00', '2024-05-19 19:00:00', 'Ongoing', 8),
(9, '2024-05-18 10:00:00', '2024-05-20 18:00:00', 'Ongoing', 9),
(10, '2024-05-19 09:00:00', '2024-05-21 17:00:00', 'Ended', 10);

INSERT INTO BID (BidID, BidAmount, BidTime, UserID)
VALUES (1, 250.00, '2024-05-10 09:30:00', 1),
(2, 300.00, '2024-05-10 10:45:00', 3),
(3, 400.00, '2024-05-11 11:20:00', 5),
(4, 450.00, '2024-05-11 12:15:00', 6),
(5, 600.00, '2024-05-12 13:30:00', 7),
(6, 700.00, '2024-05-12 14:45:00', 16),
(7, 800.00, '2024-05-13 15:20:00', 17),
(8, 900.00, '2024-05-13 16:15:00', 18),
(9, 1000.00, '2024-05-14 17:30:00', 19),
(10, 1200.00, '2024-05-14 18:45:00', 20);

INSERT INTO CATEGORY (CategoryID, Cname)
VALUES (1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home Appliances'),
(5, 'Furniture'),
(6, 'Sports Equipment'),
(7, 'Toys'),
(8, 'Jewelry'),
(9, 'Health & Beauty'),
(10, 'Automotive');

INSERT INTO CATEGORIZED_IN (ItemID, CategoryID)
VALUES (1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

INSERT INTO PLACED_IN (BidID, AuctionID)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

SELECT * FROM USER;
SELECT * FROM ITEM;
SELECT * FROM AUCTION;
SELECT * FROM SELLER;
SELECT * FROM BID;
SELECT * FROM CATEGORY;
SELECT * FROM CATEGORIZED_IN;
SELECT * FROM PLACED_IN;


SELECT *
FROM USER
LEFT OUTER JOIN SELLER ON USER.UserID = SELLER.UserID
LEFT OUTER JOIN ITEM ON SELLER.SellerID = ITEM.SellerID
LEFT OUTER JOIN AUCTION ON ITEM.ItemID = AUCTION.ItemID
LEFT OUTER JOIN BID ON USER.UserID = BID.UserID
LEFT OUTER JOIN CATEGORIZED_IN ON ITEM.ItemID = CATEGORIZED_IN.ItemID
LEFT OUTER JOIN CATEGORY ON CATEGORIZED_IN.CategoryID = CATEGORY.CategoryID
LEFT OUTER JOIN PLACED_IN ON BID.BidID = PLACED_IN.BidID;







