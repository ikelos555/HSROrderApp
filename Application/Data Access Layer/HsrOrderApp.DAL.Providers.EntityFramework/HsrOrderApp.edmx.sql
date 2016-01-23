
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/23/2016 13:56:15
-- Generated from EDMX file: C:\HSR_Project\Application\Data Access Layer\HsrOrderApp.DAL.Providers.EntityFramework\HsrOrderApp.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HsrOrderApp];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Products__Suppli__251C81ED]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK__Products__Suppli__251C81ED];
GO
IF OBJECT_ID(N'[dbo].[FK__Supplier__Addres__2057CCD0]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Supplier] DROP CONSTRAINT [FK__Supplier__Addres__2057CCD0];
GO
IF OBJECT_ID(N'[dbo].[FK__Supplier__Suppli__2610A626]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Supplier] DROP CONSTRAINT [FK__Supplier__Suppli__2610A626];
GO
IF OBJECT_ID(N'[dbo].[FK__SupplierP__Accou__2334397B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SupplierProduct] DROP CONSTRAINT [FK__SupplierP__Accou__2334397B];
GO
IF OBJECT_ID(N'[dbo].[FK__SupplierP__Produ__24285DB4]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SupplierProduct] DROP CONSTRAINT [FK__SupplierP__Produ__24285DB4];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAddress_Addresses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerAddresses] DROP CONSTRAINT [FK_CustomerAddress_Addresses];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAddress_Customers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerAddresses] DROP CONSTRAINT [FK_CustomerAddress_Customers];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderDetails_Orders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Orders];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderDetails_Products]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Products];
GO
IF OBJECT_ID(N'[dbo].[FK_Orders_Customers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_Customers];
GO
IF OBJECT_ID(N'[dbo].[FK_UserInRoles_Roles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserInRoles] DROP CONSTRAINT [FK_UserInRoles_Roles];
GO
IF OBJECT_ID(N'[dbo].[FK_UserInRoles_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserInRoles] DROP CONSTRAINT [FK_UserInRoles_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_Users_Customers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Customers];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Addresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Addresses];
GO
IF OBJECT_ID(N'[dbo].[CustomerAddresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerAddresses];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[OrderDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderDetails];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[Supplier]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Supplier];
GO
IF OBJECT_ID(N'[dbo].[SupplierProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SupplierProduct];
GO
IF OBJECT_ID(N'[dbo].[UserInRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserInRoles];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AddressSet'
CREATE TABLE [dbo].[AddressSet] (
    [AddressId] int  NOT NULL,
    [AddressLine1] nvarchar(60)  NOT NULL,
    [AddressLine2] nvarchar(60)  NULL,
    [PostalCode] nvarchar(15)  NOT NULL,
    [City] nvarchar(50)  NOT NULL,
    [Phone] nvarchar(50)  NOT NULL,
    [Email] nvarchar(50)  NOT NULL,
    [Version] binary(8)  NOT NULL
);
GO

-- Creating table 'CustomerSet'
CREATE TABLE [dbo].[CustomerSet] (
    [CustomerId] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [FirstName] nvarchar(15)  NOT NULL,
    [Version] binary(8)  NOT NULL
);
GO

-- Creating table 'OrderDetailSet'
CREATE TABLE [dbo].[OrderDetailSet] (
    [OrderDetailId] int  NOT NULL,
    [UnitPrice] decimal(19,4)  NOT NULL,
    [QuantityInUnits] int  NOT NULL,
    [Version] binary(8)  NOT NULL,
    [Order_OrderId] int  NOT NULL,
    [Product_ProductId] int  NOT NULL
);
GO

-- Creating table 'OrderSet'
CREATE TABLE [dbo].[OrderSet] (
    [OrderId] int  NOT NULL,
    [OrderDate] datetime  NULL,
    [ShippedDate] datetime  NULL,
    [OrderStatus] int  NOT NULL,
    [Version] binary(8)  NOT NULL,
    [Customer_CustomerId] int  NOT NULL
);
GO

-- Creating table 'ProductSet'
CREATE TABLE [dbo].[ProductSet] (
    [ProductId] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ProductNumber] nvarchar(25)  NOT NULL,
    [Category] nvarchar(50)  NOT NULL,
    [QuantityPerUnit] float  NOT NULL,
    [ListUnitPrice] decimal(19,4)  NOT NULL,
    [UnitsOnStock] int  NOT NULL,
    [Version] binary(8)  NOT NULL,
    [SupplierProductId] int  NULL
);
GO

-- Creating table 'RoleSet'
CREATE TABLE [dbo].[RoleSet] (
    [RoleId] int  NOT NULL,
    [RoleName] nvarchar(50)  NOT NULL,
    [Version] binary(8)  NOT NULL
);
GO

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [UserId] int  NOT NULL,
    [Username] nvarchar(50)  NOT NULL,
    [Password] nvarchar(50)  NULL,
    [Version] binary(8)  NOT NULL,
    [Customer_CustomerId] int  NULL
);
GO

-- Creating table 'Supplier'
CREATE TABLE [dbo].[Supplier] (
    [AccountNumber] int  NOT NULL,
    [AddressId] int  NOT NULL,
    [SupplierProductId] int  NOT NULL,
    [CreditRating] int  NOT NULL,
    [PreferedSupplier] int  NOT NULL,
    [ActiveFlag] int  NOT NULL,
    [PurchaseWebserviceUrl] varchar(1)  NOT NULL
);
GO

-- Creating table 'SupplierProduct'
CREATE TABLE [dbo].[SupplierProduct] (
    [SupplierProductId] int IDENTITY(1,1) NOT NULL,
    [AccountNumber] int  NOT NULL,
    [ProductId] int  NOT NULL,
    [AverageLeadTime] datetime  NOT NULL,
    [StandardPrice] decimal(19,4)  NOT NULL,
    [LastReceiveCost] decimal(19,4)  NOT NULL,
    [LastReceiveDate] datetime  NOT NULL,
    [MinOrderQuantity] int  NOT NULL,
    [MaxOrderQuantity] int  NOT NULL
);
GO

-- Creating table 'CustomerAddresses'
CREATE TABLE [dbo].[CustomerAddresses] (
    [Addresses_AddressId] int  NOT NULL,
    [Customer_CustomerId] int  NOT NULL
);
GO

-- Creating table 'UserInRoles'
CREATE TABLE [dbo].[UserInRoles] (
    [Roles_RoleId] int  NOT NULL,
    [Users_UserId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AddressId] in table 'AddressSet'
ALTER TABLE [dbo].[AddressSet]
ADD CONSTRAINT [PK_AddressSet]
    PRIMARY KEY CLUSTERED ([AddressId] ASC);
GO

-- Creating primary key on [CustomerId] in table 'CustomerSet'
ALTER TABLE [dbo].[CustomerSet]
ADD CONSTRAINT [PK_CustomerSet]
    PRIMARY KEY CLUSTERED ([CustomerId] ASC);
GO

-- Creating primary key on [OrderDetailId] in table 'OrderDetailSet'
ALTER TABLE [dbo].[OrderDetailSet]
ADD CONSTRAINT [PK_OrderDetailSet]
    PRIMARY KEY CLUSTERED ([OrderDetailId] ASC);
GO

-- Creating primary key on [OrderId] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [PK_OrderSet]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [ProductId] in table 'ProductSet'
ALTER TABLE [dbo].[ProductSet]
ADD CONSTRAINT [PK_ProductSet]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- Creating primary key on [RoleId] in table 'RoleSet'
ALTER TABLE [dbo].[RoleSet]
ADD CONSTRAINT [PK_RoleSet]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [UserId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [AccountNumber] in table 'Supplier'
ALTER TABLE [dbo].[Supplier]
ADD CONSTRAINT [PK_Supplier]
    PRIMARY KEY CLUSTERED ([AccountNumber] ASC);
GO

-- Creating primary key on [SupplierProductId] in table 'SupplierProduct'
ALTER TABLE [dbo].[SupplierProduct]
ADD CONSTRAINT [PK_SupplierProduct]
    PRIMARY KEY CLUSTERED ([SupplierProductId] ASC);
GO

-- Creating primary key on [Addresses_AddressId], [Customer_CustomerId] in table 'CustomerAddresses'
ALTER TABLE [dbo].[CustomerAddresses]
ADD CONSTRAINT [PK_CustomerAddresses]
    PRIMARY KEY CLUSTERED ([Addresses_AddressId], [Customer_CustomerId] ASC);
GO

-- Creating primary key on [Roles_RoleId], [Users_UserId] in table 'UserInRoles'
ALTER TABLE [dbo].[UserInRoles]
ADD CONSTRAINT [PK_UserInRoles]
    PRIMARY KEY CLUSTERED ([Roles_RoleId], [Users_UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Customer_CustomerId] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_Orders_Customers]
    FOREIGN KEY ([Customer_CustomerId])
    REFERENCES [dbo].[CustomerSet]
        ([CustomerId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Orders_Customers'
CREATE INDEX [IX_FK_Orders_Customers]
ON [dbo].[OrderSet]
    ([Customer_CustomerId]);
GO

-- Creating foreign key on [Customer_CustomerId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_Users_Customers]
    FOREIGN KEY ([Customer_CustomerId])
    REFERENCES [dbo].[CustomerSet]
        ([CustomerId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_Customers'
CREATE INDEX [IX_FK_Users_Customers]
ON [dbo].[UserSet]
    ([Customer_CustomerId]);
GO

-- Creating foreign key on [Order_OrderId] in table 'OrderDetailSet'
ALTER TABLE [dbo].[OrderDetailSet]
ADD CONSTRAINT [FK_OrderDetails_Orders]
    FOREIGN KEY ([Order_OrderId])
    REFERENCES [dbo].[OrderSet]
        ([OrderId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetails_Orders'
CREATE INDEX [IX_FK_OrderDetails_Orders]
ON [dbo].[OrderDetailSet]
    ([Order_OrderId]);
GO

-- Creating foreign key on [Product_ProductId] in table 'OrderDetailSet'
ALTER TABLE [dbo].[OrderDetailSet]
ADD CONSTRAINT [FK_OrderDetails_Products]
    FOREIGN KEY ([Product_ProductId])
    REFERENCES [dbo].[ProductSet]
        ([ProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetails_Products'
CREATE INDEX [IX_FK_OrderDetails_Products]
ON [dbo].[OrderDetailSet]
    ([Product_ProductId]);
GO

-- Creating foreign key on [Addresses_AddressId] in table 'CustomerAddresses'
ALTER TABLE [dbo].[CustomerAddresses]
ADD CONSTRAINT [FK_CustomerAddresses_Addresses]
    FOREIGN KEY ([Addresses_AddressId])
    REFERENCES [dbo].[AddressSet]
        ([AddressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Customer_CustomerId] in table 'CustomerAddresses'
ALTER TABLE [dbo].[CustomerAddresses]
ADD CONSTRAINT [FK_CustomerAddresses_Customers]
    FOREIGN KEY ([Customer_CustomerId])
    REFERENCES [dbo].[CustomerSet]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAddresses_Customers'
CREATE INDEX [IX_FK_CustomerAddresses_Customers]
ON [dbo].[CustomerAddresses]
    ([Customer_CustomerId]);
GO

-- Creating foreign key on [Roles_RoleId] in table 'UserInRoles'
ALTER TABLE [dbo].[UserInRoles]
ADD CONSTRAINT [FK_UserInRoles_Roles]
    FOREIGN KEY ([Roles_RoleId])
    REFERENCES [dbo].[RoleSet]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Users_UserId] in table 'UserInRoles'
ALTER TABLE [dbo].[UserInRoles]
ADD CONSTRAINT [FK_UserInRoles_Users]
    FOREIGN KEY ([Users_UserId])
    REFERENCES [dbo].[UserSet]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserInRoles_Users'
CREATE INDEX [IX_FK_UserInRoles_Users]
ON [dbo].[UserInRoles]
    ([Users_UserId]);
GO

-- Creating foreign key on [AddressId] in table 'Supplier'
ALTER TABLE [dbo].[Supplier]
ADD CONSTRAINT [FK__Supplier__Addres__2057CCD0]
    FOREIGN KEY ([AddressId])
    REFERENCES [dbo].[AddressSet]
        ([AddressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Supplier__Addres__2057CCD0'
CREATE INDEX [IX_FK__Supplier__Addres__2057CCD0]
ON [dbo].[Supplier]
    ([AddressId]);
GO

-- Creating foreign key on [SupplierProductId] in table 'ProductSet'
ALTER TABLE [dbo].[ProductSet]
ADD CONSTRAINT [FK__Products__Suppli__251C81ED]
    FOREIGN KEY ([SupplierProductId])
    REFERENCES [dbo].[SupplierProduct]
        ([SupplierProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Products__Suppli__251C81ED'
CREATE INDEX [IX_FK__Products__Suppli__251C81ED]
ON [dbo].[ProductSet]
    ([SupplierProductId]);
GO

-- Creating foreign key on [ProductId] in table 'SupplierProduct'
ALTER TABLE [dbo].[SupplierProduct]
ADD CONSTRAINT [FK__SupplierP__Produ__24285DB4]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[ProductSet]
        ([ProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__SupplierP__Produ__24285DB4'
CREATE INDEX [IX_FK__SupplierP__Produ__24285DB4]
ON [dbo].[SupplierProduct]
    ([ProductId]);
GO

-- Creating foreign key on [SupplierProductId] in table 'Supplier'
ALTER TABLE [dbo].[Supplier]
ADD CONSTRAINT [FK__Supplier__Suppli__2610A626]
    FOREIGN KEY ([SupplierProductId])
    REFERENCES [dbo].[SupplierProduct]
        ([SupplierProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Supplier__Suppli__2610A626'
CREATE INDEX [IX_FK__Supplier__Suppli__2610A626]
ON [dbo].[Supplier]
    ([SupplierProductId]);
GO

-- Creating foreign key on [AccountNumber] in table 'SupplierProduct'
ALTER TABLE [dbo].[SupplierProduct]
ADD CONSTRAINT [FK__SupplierP__Accou__2334397B]
    FOREIGN KEY ([AccountNumber])
    REFERENCES [dbo].[Supplier]
        ([AccountNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__SupplierP__Accou__2334397B'
CREATE INDEX [IX_FK__SupplierP__Accou__2334397B]
ON [dbo].[SupplierProduct]
    ([AccountNumber]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------