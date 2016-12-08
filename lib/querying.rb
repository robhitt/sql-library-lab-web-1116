def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books JOIN series ON books.series_id = series.id WHERE series.id = 1 ORDER BY books.year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto FROM characters ORDER BY length(characters.motto) DESC LIMIT 1"
end

def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, count(characters.species) FROM characters GROUP BY characters.species ORDER BY count(characters.species) DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors JOIN series ON series.author_id = authors.id JOIN subgenres ON series.subgenre_id = subgenres.id;"
end

# series (id, title, author_id, subgenre_id)
# characters (id, name, motto, species, author_id, series_id)
def select_series_title_with_most_human_characters
  "
  SELECT series.title
  FROM series
  JOIN characters
  ON characters.series_id = series.id
  GROUP BY series.title, characters.species
  HAVING characters.species = 'human'
  ORDER BY COUNT(characters.species) DESC
  LIMIT 1
  "
end

# characters (id, name, motto, species, author_id, series_id)
# character_books (id, book_id, character_id)
# books (id, title, year, series_id)
def select_character_names_and_number_of_books_they_are_in
  "
  SELECT characters.name, COUNT(character_books.book_id) AS cameos
  FROM characters
  JOIN character_books
  ON character_books.character_id = characters.id
  GROUP BY characters.id
  ORDER BY cameos DESC, characters.name
  "
end
