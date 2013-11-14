create table [dbo].[Blogs] (
    [Id] [int] not null identity,
    [Title] [nvarchar](max) not null,
    [UrlSlug] [nvarchar](max) null,
    [Owner_Id] [int] null,
    primary key ([Id])
);
create table [dbo].[Comments] (
    [Id] [int] not null identity,
    [Content] [nvarchar](max) null,
    [Creator_Id] [int] null,
    [Post_Id] [int] null,
    primary key ([Id])
);
create table [dbo].[Posts] (
    [Id] [int] not null identity,
    [Title] [nvarchar](max) null,
    [Content] [nvarchar](max) null,
    [DatePosted] [datetime] not null,
    [Blog_Id] [int] null,
    primary key ([Id])
);
create table [dbo].[Roles] (
    [Id] [int] not null identity,
    [Name] [nvarchar](max) null,
    [PermissionLevel] [int] not null,
    primary key ([Id])
);
create table [dbo].[Tags] (
    [Id] [int] not null identity,
    [Name] [nvarchar](max) null,
    [Post_Id] [int] null,
    primary key ([Id])
);
create table [dbo].[Users] (
    [Id] [int] not null identity,
    [UserName] [nvarchar](max) null,
    [Password] [nvarchar](max) null,
    [Role_Id] [int] null,
    primary key ([Id])
);
alter table [dbo].[Blogs] add constraint [Blog_Owner] foreign key ([Owner_Id]) references [dbo].[Users]([Id]);
alter table [dbo].[Posts] add constraint [Blog_Posts] foreign key ([Blog_Id]) references [dbo].[Blogs]([Id]);
alter table [dbo].[Comments] add constraint [Comment_Creator] foreign key ([Creator_Id]) references [dbo].[Users]([Id]);
alter table [dbo].[Comments] add constraint [Post_Comments] foreign key ([Post_Id]) references [dbo].[Posts]([Id]);
alter table [dbo].[Tags] add constraint [Post_Tags] foreign key ([Post_Id]) references [dbo].[Posts]([Id]);
alter table [dbo].[Users] add constraint [User_Role] foreign key ([Role_Id]) references [dbo].[Roles]([Id]);
