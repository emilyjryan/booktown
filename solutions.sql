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

    -- SELECT title, first_name, last_name, subject FROM books
    -- JOIN authors ON books.author_id = authors.id
    -- JOIN subjects ON books.subject_id = subjects.id;

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
    -- SELECT title, retail FROM books
    -- JOIN editions ON books.id = editions.book_id
    -- JOIN stock ON editions.isbn = stock.isbn
    -- ORDER BY retail DESC;
    --             title            | retail 
    --         -----------------------------+--------
    --         2001: A Space Odyssey       |  46.95
    --         Dune                        |  45.95
    --         The Shining                 |  36.95
    --         The Cat in the Hat          |  32.95
    --         Goodnight Moon              |  28.95
    --         The Shining                 |  28.95
    --         Dynamic Anatomy             |  28.95
    --         The Tell-Tale Heart         |  24.95
    --         The Velveteen Rabbit        |  24.95
    --         The Cat in the Hat          |  23.95
    --         Franklin in the Dark        |  23.95
    --         Little Women                |  23.95
    --         2001: A Space Odyssey       |  22.95
    --         The Tell-Tale Heart         |  21.95
    --         Dune                        |  21.95
    --         Bartholomew and the Oobleck |  16.95
    --         (16 rows)


-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

    -- SELECT title, stock.isbn, name, retail FROM books
    -- JOIN editions ON books.id = editions.book_id
    -- JOIN publishers ON editions.publisher_id = publishers.id
    -- JOIN stock ON editions.isbn = stock.isbn
    -- WHERE title = 'Dune';

    --  title |    isbn    |   name    | retail 
    -- -------+------------+-----------+--------
    -- Dune  | 0441172717 | Ace Books |  21.95
    -- Dune  | 044100590X | Ace Books |  45.95
    -- (2 rows)

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
    -- SELECT first_name, last_name, ship_date, title FROM customers
    -- JOIN shipments ON customers.id = shipments.customer_id
    -- JOIN editions ON shipments.isbn = editions.isbn
    -- JOIN books ON editions.book_id = books.id
    -- ORDER BY ship_date DESC;

    --     first_name | last_name |       ship_date        |            title            
    --     ------------+-----------+------------------------+-----------------------------
    --     Annie      | Jackson   | 2001-09-22 20:58:56-07 | Bartholomew and the Oobleck
    --     Annie      | Jackson   | 2001-09-22 11:23:28-07 | Bartholomew and the Oobleck
    --     Annie      | Jackson   | 2001-09-14 17:42:22-07 | The Cat in the Hat
    --     Jenny      | King      | 2001-09-14 16:46:32-07 | The Cat in the Hat
    --     Shirley    | Gould     | 2001-08-15 14:02:01-07 | 2001: A Space Odyssey
    --     James      | Clark     | 2001-08-15 11:57:40-07 | Goodnight Moon
    --     Tammy      | Robinson  | 2001-08-14 13:49:00-07 | Franklin in the Dark
    --     Jenny      | King      | 2001-08-14 13:45:51-07 | The Shining
    --     Adam       | Holloway  | 2001-08-14 13:41:39-07 | The Tell-Tale Heart
    --     Chuck      | Brown     | 2001-08-14 10:36:41-07 | The Shining
    --     Trevor     | Young     | 2001-08-14 08:42:58-07 | Dune
    --     Tim        | Owens     | 2001-08-14 07:33:47-07 | Dynamic Anatomy
    --     Kathy      | Corner    | 2001-08-13 09:47:04-07 | The Cat in the Hat
    --     Julie      | Bollman   | 2001-08-13 09:42:10-07 | The Cat in the Hat
    --     Owen       | Becker    | 2001-08-12 13:39:22-07 | The Shining
    --     Jean       | Owens     | 2001-08-12 12:09:47-07 | Franklin in the Dark
    --     Kate       | Gerdes    | 2001-08-12 08:46:35-07 | Dune
    --     James      | Williams  | 2001-08-11 13:34:08-07 | The Cat in the Hat
    --     Richard    | Brown     | 2001-08-11 10:52:34-07 | Goodnight Moon
    --     Annie      | Jackson   | 2001-08-11 09:55:05-07 | Bartholomew and the Oobleck
    --     Eric       | Morrill   | 2001-08-10 13:47:52-07 | The Cat in the Hat
    --     Jean       | Black     | 2001-08-10 08:29:42-07 | The Tell-Tale Heart
    --     Rich       | Thomas    | 2001-08-10 07:29:52-07 | Franklin in the Dark
    --     Wendy      | Black     | 2001-08-09 09:30:46-07 | The Velveteen Rabbit
    --     Dave       | Olson     | 2001-08-09 07:30:07-07 | The Velveteen Rabbit
    --     Annie      | Jackson   | 2001-08-08 10:46:13-07 | Bartholomew and the Oobleck
    --     Ed         | Gould     | 2001-08-08 09:53:46-07 | The Shining
    --     Jonathan   | Anderson  | 2001-08-08 08:36:44-07 | The Shining
    --     Eric       | Morrill   | 2001-08-07 13:00:48-07 | Little Women
    --     Christine  | Holloway  | 2001-08-07 11:56:42-07 | 2001: A Space Odyssey
    --     Royce      | Morrill   | 2001-08-07 11:31:57-07 | The Tell-Tale Heart
    --     Annie      | Jackson   | 2001-08-07 10:58:36-07 | Bartholomew and the Oobleck
    --     Annie      | Jackson   | 2001-08-06 11:46:36-07 | Bartholomew and the Oobleck
    --     Chad       | Allen     | 2001-08-06 09:29:21-07 | The Cat in the Hat
    --     Laura      | Bennett   | 2001-08-06 07:49:44-07 | Goodnight Moon
    --     Owen       | Bollman   | 2001-08-05 09:34:04-07 | Little Women
    --     (36 rows)


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
    -- SELECT SUM(stock.stock) FROM stock;
    --     sum 
    --     -----
    --     512
    --     (1 row)

-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
