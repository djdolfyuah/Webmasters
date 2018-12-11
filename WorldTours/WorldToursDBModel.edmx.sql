
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/05/2018 19:36:04
-- Generated from EDMX file: C:\Users\adolf\Documents\GitHub\WorldTours\WorldTours\WorldToursDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [WorldToursDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UsuariosSet'
CREATE TABLE [dbo].[UsuariosSet] (
    [UsuarioId] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellidos] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Contrasena] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Sexo] nvarchar(max)  NOT NULL,
    [Edad] nvarchar(max)  NOT NULL,
    [Foto] nvarchar(max)  NOT NULL,
    [Contacto] nvarchar(max)  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RegistrosSet'
CREATE TABLE [dbo].[RegistrosSet] (
    [RegistroId] int IDENTITY(1,1) NOT NULL,
    [FechaInscripcion] nvarchar(max)  NOT NULL,
    [FechaRealizacion] nvarchar(max)  NOT NULL,
    [GuiaId] nvarchar(max)  NOT NULL,
    [UsuarioId] nvarchar(max)  NOT NULL,
    [TourId] nvarchar(max)  NOT NULL,
    [UsuariosUsuarioId] int  NOT NULL,
    [ToursTourId] int  NOT NULL
);
GO

-- Creating table 'ToursSet'
CREATE TABLE [dbo].[ToursSet] (
    [TourId] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Ciudad] nvarchar(max)  NOT NULL,
    [Ciudades_CiudadId] int  NOT NULL
);
GO

-- Creating table 'CiudadesSet'
CREATE TABLE [dbo].[CiudadesSet] (
    [CiudadId] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Pais] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UsuarioId] in table 'UsuariosSet'
ALTER TABLE [dbo].[UsuariosSet]
ADD CONSTRAINT [PK_UsuariosSet]
    PRIMARY KEY CLUSTERED ([UsuarioId] ASC);
GO

-- Creating primary key on [RegistroId] in table 'RegistrosSet'
ALTER TABLE [dbo].[RegistrosSet]
ADD CONSTRAINT [PK_RegistrosSet]
    PRIMARY KEY CLUSTERED ([RegistroId] ASC);
GO

-- Creating primary key on [TourId] in table 'ToursSet'
ALTER TABLE [dbo].[ToursSet]
ADD CONSTRAINT [PK_ToursSet]
    PRIMARY KEY CLUSTERED ([TourId] ASC);
GO

-- Creating primary key on [CiudadId] in table 'CiudadesSet'
ALTER TABLE [dbo].[CiudadesSet]
ADD CONSTRAINT [PK_CiudadesSet]
    PRIMARY KEY CLUSTERED ([CiudadId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UsuariosUsuarioId] in table 'RegistrosSet'
ALTER TABLE [dbo].[RegistrosSet]
ADD CONSTRAINT [FK_UsuariosRegistros]
    FOREIGN KEY ([UsuariosUsuarioId])
    REFERENCES [dbo].[UsuariosSet]
        ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuariosRegistros'
CREATE INDEX [IX_FK_UsuariosRegistros]
ON [dbo].[RegistrosSet]
    ([UsuariosUsuarioId]);
GO

-- Creating foreign key on [ToursTourId] in table 'RegistrosSet'
ALTER TABLE [dbo].[RegistrosSet]
ADD CONSTRAINT [FK_RegistrosTours]
    FOREIGN KEY ([ToursTourId])
    REFERENCES [dbo].[ToursSet]
        ([TourId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RegistrosTours'
CREATE INDEX [IX_FK_RegistrosTours]
ON [dbo].[RegistrosSet]
    ([ToursTourId]);
GO

-- Creating foreign key on [Ciudades_CiudadId] in table 'ToursSet'
ALTER TABLE [dbo].[ToursSet]
ADD CONSTRAINT [FK_ToursCiudades]
    FOREIGN KEY ([Ciudades_CiudadId])
    REFERENCES [dbo].[CiudadesSet]
        ([CiudadId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ToursCiudades'
CREATE INDEX [IX_FK_ToursCiudades]
ON [dbo].[ToursSet]
    ([Ciudades_CiudadId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------