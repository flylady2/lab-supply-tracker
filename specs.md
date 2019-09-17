# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] A lab has many users.  Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
- [x] Reagent belongs to a lab. Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Reagents have many users through reagent_uses. Users have many reagents through reagent_uses. Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Reagents have many users through reagent_uses. Users have many reagents through reagent_uses. Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] ReagentUse quantity, unit and date. The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] Category, Lab, Location, Reagent, ReagentUse, User. Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Reagent.search_by_name
URL: /labs/1/reagents?utf8=✓&name=agarose&commit=Search
Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Google using Omniauth. Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] labs/1/reagents Include nested resource show or index (URL e.g. users/2/recipes)
- [x] labs/1/reagents/new Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] New forms for locations, reagents, reagent_uses and users. Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
