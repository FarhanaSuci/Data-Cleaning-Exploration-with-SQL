SELECT * 
FROM SUCHI.dbo.Housing$;

--Standardize Date Format
SELECT SaleDate, Convert(Date,SaleDate)
FROM SUCHI.dbo.Housing$;

Update Housing$
SET SaleDate = Convert(Date,SaleDate)

--Update not working . so going to alter
ALTER Table Housing$
Add SaleDateConverted Date;

Update Housing$
SET SaleDateConverted = Convert(Date,SaleDate)


---Populate Address property data

Select PropertyAddress
from  SUCHI.dbo.Housing$;

Select *
from  SUCHI.dbo.Housing$
--Where PropertyAddress is null
order by ParcelID;

---To Populate Address property data
--We are going to do self join
Select a.ParcelID,a.PropertyAddress,b.ParcelID,
b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
from  SUCHI.dbo.Housing$ as a
JOIN SUCHI.dbo.Housing$ as b
 on a.ParcelID=b.ParcelID
 and a.UniqueID <> b.UniqueID
 Where a.PropertyAddress is null;

 Update a
 SET PropertyAddress = ISNUlL(a.PropertyAddress,
 b.PropertyAddress)
 from  SUCHI.dbo.Housing$ as a
JOIN SUCHI.dbo.Housing$ as b
 on a.ParcelID=b.ParcelID
 and a.UniqueID <> b.UniqueID
 Where a.PropertyAddress is null;


 ---Breaking out Address into individual columns
 -- (Address, City , State)

 SELECT PropertyAddress
 FROM SUCHI.dbo.Housing$;
 

 SELECT 
 SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as Address
 ,SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress)) as Address
 From SUCHI.dbo.Housing$;


ALTER Table Housing$
Add PropertySplitAddress Nvarchar(255);

Update Housing$
SET PropertySplitAddress = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

ALTER Table Housing$
Add PropertySplitCity Nvarchar(255);

Update Housing$
SET PropertySplitCity = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress))

SELECT *
From SUCHI.dbo.Housing$;

SELECT OwnerAddress
FROM SUCHI.dbo.Housing$;

SELECT 
PARSENAME(REPLACE(OwnerAddress,',','.'),3),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)
FROM SUCHI.dbo.Housing$;




ALTER Table Housing$
Add OwnerSplitAddress Nvarchar(255);

Update Housing$
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3);

ALTER Table Housing$
Add OwnerSplitCity Nvarchar(255);

Update Housing$
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2);

ALTER Table Housing$
Add OwnerSplitState Nvarchar(255);

Update Housing$
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'),1);

SELECT *
From SUCHI.dbo.Housing$;

-- Change Y and N to Yes and No in "Sold as Vacant" field










