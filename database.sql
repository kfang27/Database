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