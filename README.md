![Issues](https://img.shields.io/github/issues/marcusal/cookbook-scraper-app?style=for-the-badge)
![Followers](https://img.shields.io/github/followers/marcusal?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/marcusal?style=for-the-badge)
![Pull Requests](https://img.shields.io/github/issues-pr/marcusal/cookbook-scraper-app?style=for-the-badge)
![Last Commit](https://img.shields.io/github/last-commit/marcusal/cookbook-scraper-app/main?style=for-the-badge)

Run the app to start

```bash
ruby lib/app.rb
```

## 1 - Imports recipes from the web

You can use the app to find any recipe you'd like

```bash
-- My CookBook --
What do you want to do?

1. List all recipes
2. Add a recipe
3. Delete a recipe
4. Import recipes from the Internet
5. Exit

> 4
What ingredient would you like a recipe for?
> strawberry

Looking for "strawberry" recipes on the Internet...

1. Strawberry shortcake
2. Strawberry slushie
3. Strawberry martini
[...] display only the first 5 results

Which recipe would you like to import? (enter index)
> 2
Importing "Strawberry slushie"...
```

## 2 - (User Action) Mark a recipe as done

Recipes can be marked as done:

```bash
-- Here are all your recipes --

1. [X] Crumpets
2. [ ] Beans & Bacon breakfast
3. [X] Plum pudding
4. [X] Apple pie
5. [ ] Christmas crumble
```

### Pseudo-code

For this new **user action** (hence new _route_), we need to:

1. Asks the user for a keyword to search
2. Makes an HTTP request to the recipe's website
3. Parses the HTML document to extract the first 5 recipes suggested and store them in an Array
4. Display them in an indexed list
5. Asks the user which recipe they want to import (ask for an index)
6. Adds it to the `Cookbook`

### Parsing with Nokogiri

Nokogiri is a cool and famous gem used to parse HTML documents (it does other stuff too!) Here is how you can use it to parse a document once you know the CSS selectors of the elements you are interested in. CSS selectors will be explained later, but the gist of it is that you can select all elements with a given `class` attribute by creating the query `.class`.



