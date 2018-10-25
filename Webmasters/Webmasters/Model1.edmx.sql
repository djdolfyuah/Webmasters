
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/25/2018 18:56:28
-- Generated from EDMX file: C:\Users\adolf\Documents\GitHub\Webmasters\Webmasters\Webmasters\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [master];
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

-- Creating table 'usuariosSet'
CREATE TABLE [dbo].[usuariosSet] (
    [IdUsuarios] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellidos] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Contrasena] nvarchar(max)  NOT NULL,
    [Descripcion_personal] nvarchar(max)  NOT NULL,
    [Sexo] nvarchar(max)  NOT NULL,
    [Edad] int  NOT NULL,
    [Foto] nvarchar(max)  NOT NULL,
    [Forma_contacto] nvarchar(max)  NOT NULL,
    [Tipo] int  NOT NULL
);
GO

-- Creating table 'registrosSet'
CREATE TABLE [dbo].[registrosSet] (
    [IdRegistro] int IDENTITY(1,1) NOT NULL,
    [Fecha_inscripcion] datetime  NOT NULL,
    [Fecha_realizacion] datetime  NOT NULL,
    [usuariosIdUsuarios] int  NOT NULL,
    [tourIdTour] int  NOT NULL
);
GO

-- Creating table 'tourSet'
CREATE TABLE [dbo].[tourSet] (
    [IdTour] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [ciudadIdCiudad] int  NOT NULL
);
GO

-- Creating table 'ciudadSet'
CREATE TABLE [dbo].[ciudadSet] (
    [IdCiudad] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Pais] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdUsuarios] in table 'usuariosSet'
ALTER TABLE [dbo].[usuariosSet]
ADD CONSTRAINT [PK_usuariosSet]
    PRIMARY KEY CLUSTERED ([IdUsuarios] ASC);
GO

-- Creating primary key on [IdRegistro] in table 'registrosSet'
ALTER TABLE [dbo].[registrosSet]
ADD CONSTRAINT [PK_registrosSet]
    PRIMARY KEY CLUSTERED ([IdRegistro] ASC);
GO

-- Creating primary key on [IdTour] in table 'tourSet'
ALTER TABLE [dbo].[tourSet]
ADD CONSTRAINT [PK_tourSet]
    PRIMARY KEY CLUSTERED ([IdTour] ASC);
GO

-- Creating primary key on [IdCiudad] in table 'ciudadSet'
ALTER TABLE [dbo].[ciudadSet]
ADD CONSTRAINT [PK_ciudadSet]
    PRIMARY KEY CLUSTERED ([IdCiudad] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [usuariosIdUsuarios] in table 'registrosSet'
ALTER TABLE [dbo].[registrosSet]
ADD CONSTRAINT [FK_usuariosregistros]
    FOREIGN KEY ([usuariosIdUsuarios])
    REFERENCES [dbo].[usuariosSet]
        ([IdUsuarios])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_usuariosregistros'
CREATE INDEX [IX_FK_usuariosregistros]
ON [dbo].[registrosSet]
    ([usuariosIdUsuarios]);
GO

-- Creating foreign key on [tourIdTour] in table 'registrosSet'
ALTER TABLE [dbo].[registrosSet]
ADD CONSTRAINT [FK_registrostour]
    FOREIGN KEY ([tourIdTour])
    REFERENCES [dbo].[tourSet]
        ([IdTour])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_registrostour'
CREATE INDEX [IX_FK_registrostour]
ON [dbo].[registrosSet]
    ([tourIdTour]);
GO

-- Creating foreign key on [ciudadIdCiudad] in table 'tourSet'
ALTER TABLE [dbo].[tourSet]
ADD CONSTRAINT [FK_tourciudad]
    FOREIGN KEY ([ciudadIdCiudad])
    REFERENCES [dbo].[ciudadSet]
        ([IdCiudad])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_tourciudad'
CREATE INDEX [IX_FK_tourciudad]
ON [dbo].[tourSet]
    ([ciudadIdCiudad]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------