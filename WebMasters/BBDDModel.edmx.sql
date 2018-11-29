
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/15/2018 19:24:26
-- Generated from EDMX file: C:\Users\Sandra\Documents\GitHub\Webmasters\WebMasters\BBDDModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Turistas];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UsuariosRegistros]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegistrosSet] DROP CONSTRAINT [FK_UsuariosRegistros];
GO
IF OBJECT_ID(N'[dbo].[FK_RegistrosTour]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegistrosSet] DROP CONSTRAINT [FK_RegistrosTour];
GO
IF OBJECT_ID(N'[dbo].[FK_ToursCiudades]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToursSet] DROP CONSTRAINT [FK_ToursCiudades];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UsuariosSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuariosSet];
GO
IF OBJECT_ID(N'[dbo].[RegistrosSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegistrosSet];
GO
IF OBJECT_ID(N'[dbo].[ToursSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ToursSet];
GO
IF OBJECT_ID(N'[dbo].[CiudadesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CiudadesSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UsuariosSet'
CREATE TABLE [dbo].[UsuariosSet] (
    [UsuarioId] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellidos] nvarchar(max)  NOT NULL,
    [Telefono] int  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Contrasena] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Sexo] nvarchar(max)  NOT NULL,
    [Edad] int  NOT NULL,
    [Foto] nvarchar(max)  NOT NULL,
    [Contacto] nvarchar(max)  NOT NULL,
    [Tipo] int  NOT NULL
);
GO

-- Creating table 'RegistrosSet'
CREATE TABLE [dbo].[RegistrosSet] (
    [RegistroId] int IDENTITY(1,1) NOT NULL,
    [FechaInscripcion] datetime  NOT NULL,
    [FechaRealizacion] datetime  NOT NULL,
    [GuiaId] int  NOT NULL,
    [UsuarioId] int  NOT NULL,
    [TourId] int  NOT NULL
);
GO

-- Creating table 'ToursSet'
CREATE TABLE [dbo].[ToursSet] (
    [TourId] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [CiudadId] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
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

-- Creating foreign key on [UsuarioId] in table 'RegistrosSet'
ALTER TABLE [dbo].[RegistrosSet]
ADD CONSTRAINT [FK_UsuariosRegistros]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[UsuariosSet]
        ([UsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuariosRegistros'
CREATE INDEX [IX_FK_UsuariosRegistros]
ON [dbo].[RegistrosSet]
    ([UsuarioId]);
GO

-- Creating foreign key on [TourId] in table 'RegistrosSet'
ALTER TABLE [dbo].[RegistrosSet]
ADD CONSTRAINT [FK_RegistrosTour]
    FOREIGN KEY ([TourId])
    REFERENCES [dbo].[ToursSet]
        ([TourId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RegistrosTour'
CREATE INDEX [IX_FK_RegistrosTour]
ON [dbo].[RegistrosSet]
    ([TourId]);
GO

-- Creating foreign key on [CiudadId] in table 'ToursSet'
ALTER TABLE [dbo].[ToursSet]
ADD CONSTRAINT [FK_ToursCiudades]
    FOREIGN KEY ([CiudadId])
    REFERENCES [dbo].[CiudadesSet]
        ([CiudadId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ToursCiudades'
CREATE INDEX [IX_FK_ToursCiudades]
ON [dbo].[ToursSet]
    ([CiudadId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------