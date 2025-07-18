/*
*********************************************************************
Create Database and Schemas
*********************************************************************
Script Purpos:
  This scripot creates a new databese named 'Datawarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.
WARNING:
  Running this script will drop the entire 'Datawarehouse' database if it exists.
All data in the database will be permanentely deleted. Proceed with caution and ensure you have proper backups before running this script.
*/

USE master;
GO

  --Drop and recreate the 'Datawarehouse' database
  IF EXISTS (SELECT 1 FROM sys.databases WHERE NAME = 'Datawarehouse')
  BEGIN
    ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE:
    DROP DATA Warehouse;
  END
  GO

USE Datawarehouse;
GO

CREATE SCHEMA bronze;
GO
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
