--create database VirtualArtGallery
--use VirtualArtGallery
--create table Artists(
-- ArtistID INT PRIMARY KEY,
-- Name VARCHAR(255) NOT NULL,
-- Biography TEXT,
-- Nationality VARCHAR(100)
-- )
--CREATE TABLE Categories (
-- CategoryID INT PRIMARY KEY,
-- Name VARCHAR(100) NOT NULL);
--CREATE TABLE Artworks (
-- ArtworkID INT PRIMARY KEY,
-- Title VARCHAR(255) NOT NULL,
-- ArtistID INT,
-- CategoryID INT,
-- Year INT,
-- Description TEXT,
-- ImageURL VARCHAR(255),
-- FOREIGN KEY (ArtistID) REFERENCES Artists (ArtistID),
-- FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID));--CREATE TABLE Exhibitions (
-- ExhibitionID INT PRIMARY KEY,
-- Title VARCHAR(255) NOT NULL,
-- StartDate DATE,
-- EndDate DATE,
-- Description TEXT);--CREATE TABLE ExhibitionArtworks (
-- ExhibitionID INT,
-- ArtworkID INT,
-- PRIMARY KEY (ExhibitionID, ArtworkID),
-- FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions (ExhibitionID),
-- FOREIGN KEY (ArtworkID) REFERENCES Artworks (ArtworkID))----dml-------insert into artists(ArtistID,Name,Biography,Nationality) values(1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
-- (2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
-- (3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian')--INSERT INTO Categories (CategoryID, Name) VALUES
-- (1, 'Painting'),
-- (2, 'Sculpture'),
-- (3, 'Photography')
--INSERT INTO Artworks (ArtworkID, Title, ArtistID, CategoryID, Year, Description, ImageURL) VALUES
-- (1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 'starry_night.jpg'),
-- (2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 'mona_lisa.jpg'),
-- (3, 'Guernica', 1, 1, 1937, 'Pablo Picasso\s powerful anti-war mural.', 'guernica.jpg');
--INSERT INTO Exhibitions (ExhibitionID, Title, StartDate, EndDate, Description) VALUES
-- (1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'),
-- (2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.');
--INSERT INTO ExhibitionArtworks (ExhibitionID, ArtworkID) VALUES
-- (1, 1),
-- (1, 2),
-- (1, 3),
-- (2, 2)
--insert into artists values(4,'decrapio','spanish polymath of modern renaissance','spanish'),
--(5,'freddy','portuguese sculptor','portuguese')
--insert into artworks values(4,'dark',1,2,1668,'The horror of darkness','dark_jpg'),
--(5,'eyes through',4,1,1889,'A deeper look into pain','eyes_through.jpg')
--insert into exhibitionartworks values(1,4)
--insert into exhibitionartworks values(2,5)
--insert into artworks values(6,'perks of joy',1,1,1698,'embracing little joy','perks_of_joy.jpg')
--insert into artworks values(7,'situational echo',1,2,1697,'triggers by nature','situational_echo.jpg')
--insert into artworks values(8,'redeem of life',3,2,1887,'welcoming vintage perspectives','redeeem_jpg')
--insert into artworks values(9,'adventure',3,3,1888,'life bound in adventure','adventure_jpg')
------------Queries-----
---1 Retrieve the names of all artists along with the number of artworks they have in the gallery, and 
--list them in descending order of the number of artworks

--select a.name as ArtistName,count(b.artistid) as num_of_artworks  from artists a
--left join artworks b on a.artistid=b.artistid
--group by a.name
--order by num_of_artworks desc


--2 . List the titles of artworks created by artists from 'Spanish' and 'Dutch' nationalities, and order 
--them by the year in ascending order.
--select b.title,b.year from artworks b
--join artists a on a.artistid=b.artistid
--where a.nationality in('Spanish','Dutch')
--order by b.year asc;

--3    Find the names of all artists who have artworks in the 'Painting' category, and the number of artworks they have in this category. 

--select a.name as Artist_name,count(b.artworkid) as Num_of_artworks from artists a
--join artworks b on a.artistid=b.artistid
--join categories c on b.categoryid=c.categoryid
--where c.name='Painting'
--group by a.name


 --4 List the names of artworks from the 'Modern Art Masterpieces' exhibition, along with their artists and categories. 
 --select b.title as ArtworkName,a.name as ArtistName,c.name as CategoryName from artworks b
 --join exhibitionartworks e2 on b.artworkid=e2.artworkid
 --join exhibitions e1 on e2.exhibitionid=e1.exhibitionid
 --join artists a on a.artistid=b.artistid
 --join categories c on b.categoryid=c.categoryid
 --where e1.title='Modern Art Masterpieces'
 --5  Find the artists who have more than two artworks in the gallery.
 --select a.Name,count(b.artworkid) from  artists a
 --join artworks b on a.artistid=b.artistid
 --group by a.name
 --having count(b.artworkid) >2
 --6 . Find the titles of artworks that were exhibited in both 'Modern Art Masterpieces' and 'Renaissance Art' exhibitions
 --select b.title as Artwork_title from artworks b
 --join exhibitionartworks ea1 on b.artworkid=ea1.artworkid
 --join exhibitions e1 on e1.exhibitionid=ea1.exhibitionid
 --join exhibitionartworks ea2 on b.artworkid=ea2.artworkid
 --join exhibitions e2 on e2.exhibitionid=ea2.exhibitionid
 --where e1.title='Modern Art Masterpieces' and e2.title='Renaissance Art'

 --7 . Find the total number of artworks in each category

 --select c.name as Category_Name,count(b.artworkid) as Num_of_artworks from artworks b
 --right join categories c on b.categoryid=c.categoryid
 --group by c.name

 --8 list artists who have more than 3 artworks in the gallery

 --select a.name from artists a
 --join artworks b on a.artistid=b.artistid
 --group by a.name
 --having count(b.artworkid)>3

 --9  Find the artworks created by artists from a specific nationality (e.g., Spanish)

 --select b.ArtworkID as artworkid,b.title as ArtworkName from artworks b
 --join artists a on a.artistid=b.artistid
 --where a.nationality='Spanish'

 --10 . List exhibitions that feature artwork by both Vincent van Gogh and Leonardo da Vinci.
 --select e.title as Exhibition_title from exhibitions e
 --join exhibitionartworks ea on e.exhibitionid=ea.exhibitionid
 --join artworks b on ea.artworkid=b.artworkid
 --join artists a on a.artistid=b.artistid
 --where a.name in ('Vincent van gogh','Leonardo da vinci')
 --group by e.title
 --having count(distinct a.name)=2



 --11   Find all the artworks that have not been included in any exhibition

 --select b.title as Artwork_title from artworks b
 --left join exhibitionartworks ea on ea.artworkid=b.artworkid
 --where ea.exhibitionid is null

 --12  . List artists who have created artworks in all available categories.
 --select a.name as artistname from artists a
 --join artworks b on a.artistid=b.artistid
 --join categories c on b.categoryid=c.categoryid
 --group by a.artistid,a.name
 --having count(distinct b.categoryid)=(select count(*) from categories)

 --13 list the total number of artworks in each category.

 --select c.name,count(b.artworkid) as totalArtworks from categories c
 --left join artworks b on c.categoryid=b.categoryid
 --group by c.name

 --14  Find the artists who have more than 2 artworks in the gallery

 --select a.Name,count(b.artworkid) as no_of_artworks  from  artists a
 --join artworks b on a.artistid=b.artistid
 --group by a.name
 --having count(b.artworkid) >2

 --15 liist the categories with the average year of artworks they contain, only for categories with more than 1 artwork
 --select c.name,avg(b.year) as Avgyear from categories c
 --join artworks b on c.categoryid=b.categoryid
 --group by c.name
 --having count(b.artworkid)>1
 --16  Find the artworks that were exhibited in the 'Modern Art Masterpieces' exhibition.
 --select b.title as Artwork_title from Artworks b
 --join exhibitionartworks ea on b.artworkid=ea.artworkid
 --join exhibitions e on ea.exhibitionid=e.exhibitionid
 --where e.title='Modern Art Masterpieces'

 --17  Find the categories where the average year of artworks is greater than the average year of all artworks
 --select c.name from categories c
 --join artworks b on c.categoryid=b.categoryid
 --group by c.name
 --having avg(b.year)>(select avg(year) from artworks)

 --18  List the artworks that were not exhibited in any exhibition
 --select b.title as Artwork_title from artworks b
 --left join exhibitionartworks ea on b.artworkid=ea.artworkid
 --where ea.exhibitionid is null



 --19 show artists who have artworks in the same category as "Mona Lisa."

-- SELECT DISTINCT a.Name AS ArtistName
--FROM Artists a
--JOIN Artworks b ON b.ArtistID = a.ArtistID
--JOIN Categories C ON b.CategoryID = C.CategoryID
--WHERE C.CategoryID = (SELECT b2.CategoryID FROM Artworks b2 WHERE b2.Title = 'Mona Lisa');

 --20 List the names of artists and the number of artworks they have in the gallery
 --select a.name as Artist_name,count(b.artworkid) as artwork_count from artists a
 --join artworks b on a.artistid=b.artistid
 --group by a.name



