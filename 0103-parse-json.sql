WITH parsed AS (
  SELECT 
    from_json(
      col1, 
      schema_of_json('{
        "library": {
          "name": "example library",
          "Section": {
            "name": "Fiction",
            "BookList": [
              {
                "BookEntry": {
                  "ID": "BOOK001",
                  "Title": "The Great Gatsby",
                  "Author": "F. Scott Fitzgerald",
                  "PublishedYear": "1925",
                  "Details": {
                    "Summary": "A story of the mysteriously wealthy Jay Gatsby and his love for Daisy Buchanan.",
                    "Genres": [
                      "Classic",
                      "Literature"
                    ]
                  }
                }
              },
              {
                "BookEntry": {
                  "ID": "BOOK002",
                  "Title": "1984",
                  "Author": "George Orwell",
                  "PublishedYear": "1949",
                  "Details": {
                    "Summary": "A dystopian novel set in a totalitarian society ruled by Big Brother.",
                    "Genres": [
                      "Dystopian",
                      "Science Fiction"
                    ]
                  }
                }
              }
            ],
            "FeaturedBook": "The Great Gatsby"
          }
        }
      }')
    ) AS json_value
  FROM (
    SELECT *
    FROM VALUES('{
      "library": {
        "name": "example library",
        "Section": {
          "name": "Fiction",
          "BookList": [
            {
              "BookEntry": {
                "ID": "BOOK001",
                "Title": "The Great Gatsby",
                "Author": "F. Scott Fitzgerald",
                "PublishedYear": "1925",
                "Details": {
                  "Summary": "A story of the mysteriously wealthy Jay Gatsby and his love for Daisy Buchanan.",
                  "Genres": [
                    "Classic",
                    "Literature"
                  ]
                }
              }
            },
            {
              "BookEntry": {
                "ID": "BOOK002",
                "Title": "1984",
                "Author": "George Orwell",
                "PublishedYear": "1949",
                "Details": {
                  "Summary": "A dystopian novel set in a totalitarian society ruled by Big Brother.",
                  "Genres": [
                    "Dystopian",
                    "Science Fiction"
                  ]
                }
              }
            }
          ],
          "FeaturedBook": "The Great Gatsby"
        }
      }
    }') AS t(col1)
  )
)
SELECT 
  BookList.BookEntry.ID AS ID,
  BookList.BookEntry.Title AS Title,
  BookList.BookEntry.Author AS Author
FROM 
  parsed
LATERAL VIEW explode(json_value.library.Section.BookList) AS BookList
