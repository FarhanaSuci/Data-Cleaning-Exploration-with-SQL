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






