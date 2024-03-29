-- Assume you are given the tables below about Facebook pages and page likes. Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.

SELECT pages.page_id FROM pages LEFT JOIN page_likes USING(page_id) WHERE page_likes.page_id is NULL;
