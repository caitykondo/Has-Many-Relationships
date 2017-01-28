-- Create a query to get all fields from the users table
SELECT * FROM users;

-- Create a query to get all fields from the posts table where the user_id is 100
SELECT * FROM posts WHERE user_id = 100;
SELECT * FROM posts WHERE user_id = 200;

-- Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200
                             --   V-- alias for table
SELECT p.*, u.username FROM posts p
INNER JOIN users u
on p.users_id = u.id
WHERE u.first_name IS 'Norene'
AND u.last_name IS 'Schmitt';

-- Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'
SELECT COUNT(p.title) FROM users u
INNER JOIN posts p
ON p.users_id = u.id
WHERE i.created_at < '2015-01-01 00:00:00-10';

-- Create a query to get usernames from the users table where the user has created a post after January 1, 2015
SELECT c.*, p.title as 'Post Title'
FROM posts p
INNER JOIN comments c
ON c.posts_id = p.id;

-- Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015
SELECT c.*, p.title as "post_title", p.url as "post_url", c.body as "comment_body"
FROM comments c
INNER JOIN  posts p
ON c.posts_id = p.id --where fkey matches pkey or where the relationship is set/made
WHERE p.created_at < '2015-01-01 00:00:00-10';

-- Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields
SELECT c.*, p.title as "post_title"
FROM comments c
INNER JOIN posts p
ON c.posts_id = p.id;

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015
SELECT c.*, p.title as "post_title", p.url as "post_url", c.body as "comment_body"
FROM comments c
INNER JOIN  posts p
ON c.posts_id = p.id
WHERE p.created_at < '2015-01-01 00:00:00-10';

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015
SELECT c.*, p.title as "post_title", p.url as "post_url", c.body as "comment_body"
FROM comments c
INNER JOIN  posts p
ON c.posts_id = p.id
WHERE p.created_at > '2015-01-01 00:00:00-10';

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'
SELECT c.*, p.title as "post_title", p.url as "post_url", c.body as "comment_body"
FROM comments c
INNER JOIN  posts p
ON c.posts_id = p.id
WHERE c.body::text LIKE '%USB%';

-- Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )
SELECT p.title as "post_title", p.url as "post_url", u.first_name, u.last_name, c.body as "comment_body"
FROM users u
INNER JOIN comments c
ON c.users_id = u.id
INNER JOIN posts p
ON p.id = c.posts_id
WHERE c.body LIKE '%matrix%';

-- Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )
SELECT u.first_name, u.last_name, c.body as "comment_body"
FROM users u
INNER JOIN comments c
ON c.users_id = u.id
WHERE c.body LIKE '%SSL%' AND '%dolorum%';

-- Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 218 results )
SELECT u.first_name AS 'post_author_first_name', u.last_name AS 'post_author_last_name', p.title AS 'post_title', u.username AS 'comment_author_username', c.body AS 'comment_body'
FROM users u
INNER JOIN posts p
ON u.id = p.users_id
INNER JOIN comments c
ON p.id = c.posts_id
WHERE (c.body LIKE '%SSL%' OR c.body LIKE '%firewall%') AND p.content LIKE '%nemo%';
