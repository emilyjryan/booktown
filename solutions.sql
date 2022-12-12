-- ### Order
-- 1. Find all subjects sorted by subject

    -- booktown=# SELECT subject FROM subjects ORDER BY subject;
        -- subject      
        ------------------
        -- Arts
        -- Business
        -- Children's Books
        -- Classics
        -- Computers
        -- Cooking
        -- Drama
        -- Entertainment
        -- History
        -- Horror
        -- Mystery
        -- Poetry
        -- Religion
        -- Romance
        -- Science
        -- Science Fiction
        -- (16 rows)

-- 2. Find all subjects sorted by location
        --     booktown=# SELECT * FROM subjects ORDER BY location;
        -- id |     subject      |     location     
        -- ----+------------------+------------------
        -- 8 | History          | Academic Rd
        -- 3 | Classics         | Academic Rd
        -- 10 | Mystery          | Black Raven Dr
        -- 9 | Horror           | Black Raven Dr
        -- 0 | Arts             | Creativity St
        -- 5 | Cooking          | Creativity St
        -- 2 | Children's Books | Kids Ct
        -- 7 | Entertainment    | Main St
        -- 6 | Drama            | Main St
        -- 13 | Romance          | Main St
        -- 15 | Science Fiction  | Main St
        -- 14 | Science          | Productivity Ave
        -- 4 | Computers        | Productivity Ave
        -- 1 | Business         | Productivity Ave
        -- 11 | Poetry           | Sunset Dr
        -- 12 | Religion         | 
        -- (16 rows)


-- ### Where
-- 3. Find the book "Little Women"
    -- SELECT * FROM books WHERE title = 'Little Women';
    --     id  |    title     | author_id | subject_id 
    --     -----+--------------+-----------+------------
    --     190 | Little Women |        16 |          6
    --     (1 row)

-- 4. Find all books containing the word "Python"
    -- SELECT * FROM books WHERE title LIKE '%Python%';
    --   id   |       title        | author_id | subject_id 
    -- -------+--------------------+-----------+------------
    -- 41473 | Programming Python |      7805 |          4
    -- 41477 | Learning Python    |      7805 |          4
    -- (2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject
    -- SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
    --  id |     subject     | location 
    -- ----+-----------------+----------
    -- 6 | Drama           | Main St
    -- 7 | Entertainment   | Main St
    -- 13 | Romance         | Main St
    -- 15 | Science Fiction | Main St
    -- (4 rows)

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book title

    -- SELECT title from books
    -- JOIN subjects ON books.subject_id = subjects.id
    -- WHERE subject = 'Computers';

    --         title         
    --         ----------------------
    --         Practical PostgreSQL
    --         Perl Cookbook
    --         Learning Python
    --         Programming Python
    --         (4 rows)

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

    SELECT title, first_name, last_name, subject FROM books
    JOIN authors ON books.author_id = authors.id
    JOIN subjects ON books.subject_id = subjects.id;

            -- title                       | first_name       |  last_name   | subject      
            -- -----------------------------+------------------+--------------+------------------
            -- Practical PostgreSQL        | John             | Worsley      | Computers
            -- Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
            -- The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
            -- Little Women                | Louisa May       | Alcott       | Drama
            -- The Shining                 | Stephen          | King         | Horror
            -- Dune                        | Frank            | Herbert      | Science Fiction
            -- Dynamic Anatomy             | Burne            | Hogarth      | Arts
            -- Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
            -- The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
            -- Programming Python          | Mark             | Lutz         | Computers
            -- Learning Python             | Mark             | Lutz         | Computers
            -- Perl Cookbook               | Tom              | Christiansen | Computers
            -- 2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
            -- The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
            -- Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books
            -- (15 rows)

    -- SELECT title, first_name, last_name, subject FROM books
    -- RIGHT JOIN authors ON books.author_id = authors.id
    -- LEFT JOIN subjects ON books.subject_id = subjects.id;

    --             title            |    first_name    |  last_name   |     subject      
    --         -----------------------------+------------------+--------------+------------------
    --                                     | Ariel            | Denham       | 
    --         Practical PostgreSQL        | John             | Worsley      | Computers
    --         Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
    --         The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
    --         Little Women                | Louisa May       | Alcott       | Drama
    --         The Shining                 | Stephen          | King         | Horror
    --         Dune                        | Frank            | Herbert      | Science Fiction
    --         Dynamic Anatomy             | Burne            | Hogarth      | Arts
    --         Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
    --         The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
    --         Programming Python          | Mark             | Lutz         | Computers
    --         Learning Python             | Mark             | Lutz         | Computers
    --         Perl Cookbook               | Tom              | Christiansen | Computers
    --                                     | Richard          | Brautigan    | 
    --                                     | Poppy Z.         | Brite        | 
    --                                     | Edward           | Gorey        | 
    --         2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
    --                                     | Andrew           | Brookins     | 
    --                                     | Neil             | Simon        | 
    --         The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
    --         Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books
    --         (21 rows)



-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
    SELECT title, retail FROM books
    JOIN shipments ON books.id = shipments.id
    JOIN stock ON shipments.isbn = stock.isbn
    ORDER BY retail DESC;


-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
