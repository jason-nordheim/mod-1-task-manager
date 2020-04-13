# Active Record 

Full guide to Active Record can be found [here](https://guides.rubyonrails.org/active_record_basics.html). Active Record follows the MVC pattern (Model-View-Controller), and fufills the role of model, which handles the business data of the application. 

## The Active Record Pattern 
According to the active record pattern, onjects carry both persistent data and behavior which operates on that data. Active Record ensures that data access logic is part of the logic, and handles the reading and writing of data to and from the database via Object-Relational-Mapping or **ORM**. Within the ORM framework of active record the following principles hold true: 

* Active record takes care of data models and data access. 
* Active record maintains the relationship between these data models 
* Active recrod allows for inheritance hierarchies through related models. 
* Active record allows for data validation prior to data being persisted within the database. 

## Naming Conventions in Active Record (AR)
Active record uses naming conventions to understand how to map between the models and their database tables. So, for the class of `book`, the corresponding table would be `books`. Active record intelligently knows how to pluralize most nouns, but you can always override the default if needed. To ensure proper functionality it is important to name classes as AR expects them (in other words): 

Models (classes) - Should be stated in the singular form, with each lettter capatalized (CamelCase)
Database Tables - Should be plural, with underscores seperating words. 

| Model/Class | Table/Schema |
|---|---| 
| `Article` | `articles` | 
| `LineItem` | `line_items` | 
| `Mouse` | `Mice` | 
| `Person` | `People`| 

### Defining Keys and Relationships 

**Foriegn Keys** should be named with the following convention; `singularized_table_name` + `_id`:  
* So an example would be; the table `Person` has a foriegn ID defininig a relationship to a `Task`, as a result the `Task` object's foriegn key would be `person_id`

**Primary Keys** By default, AR will create an integer column named `id` as the tables primary key (`bigint` for PostgreSQL/MySQL, and `integer` for SQLite) 

### Additional Out-of-the-box Goodies 
There are a variety of optional column names that will add additional features to AR instances: 

| `created_at` | automatically gets set to the current date and time when the record was first created | 
| `updated_at` | automatically gets set to the current data and time whenever the record is created or updated. | 
| `lock_version` | adds optimistic locking to a model | 
| `type` | specifies that the model uses [Single Table Inheritance](https://api.rubyonrails.org/v6.0.2.2/classes/ActiveRecord/Base.html#class-ActiveRecord::Base-label-Single+table+inheritance) | 
| `(association_name)_type` stores the type for [polymorphic associations](https://guides.rubyonrails.org/association_basics.html#polymorphic-associations)
| `(table_name)_count` | used to cache the number of objects belonging to associations | 


## Configuration 
Data from this application will be stored in a local database called `tskmgr.db` within the `db` folder. 

```bash 
# Tree 
```

## Instantiation 

1. Inherit from `ApplicationRecord` class: 
  
  ```rb
  class Task < ApplicationRecord 
  end 
  ```
  This will create a `Task` model, mapped to a `tasks` table in the database, and provide the ability to map each column in the associated table to attributes of the `Task` class. So for a task with the following create statement:
  ```sql 
  CREATE TABLE tasks (
    id int(11) NOT NULL auto_increment, 
    name varchar(255), 
    PRIMARY KEY (id)
  )
  ``` 
  ... we would have attributes of `name` and `id` for our `Task` class. Once this is setup, we can begin adding new records to our database. 

2. Create a new record: 

  Assuming we have created the table in the database like the example above, Active Record will now map attributes of `name` and `id` to the `Task` class. By default, this mapping is performed as a result from inheriting from `ActiveRecord` or more specifically `ActiveRecord::Base`. However, if there is a scenario in which AR would not understand the mapping from singular to plural (odd cases like `Moose` => `moose` for example, may not work), you can override the default mapping using `ActiveRecord::Base.table_name=`followed by the name of the table for which AR should map the associated attributes. 
  ```rb
  class Product < ApplicationRecord
    self.table_name = "my_products"
  end
  ``` 
  If you do so, you would also need to manually define a `fixture` in the `.yml` file and call the `set_fixture_class` in the model's declaration: 
  ```rb
  class ProductTest < ActiveSupport::TestCase
    set_fixture_class my_products: Product
    fixtures :my_products
    ...
  end
  ```
  It is also possible to override the primary key column using the `ActiveRecord::Base.primary_key=` method:
  ```rb
  class Product < ApplicationRecord
    self.primary_key = "product_id"
  end
  ```
  By default, creating a new record (instantiating a new object) will **not** result in the data being saved/persisted to the database. 
