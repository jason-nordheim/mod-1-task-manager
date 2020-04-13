# Rake 

Rake is a popular task runner in Ruby. It enables automated running of various tasks like; 
* backing up a database 
* running tests 
* gathering reports 
* collecting stats 


## Writing a Rake task 

Tasks are created with this general format: 
```rake
desc "Print reminder about eating more fruit." 

task :apple do
  puts "Eat more apples"
end 
```
This would be saved in a `.rake` file, by convention, these files are typically located under `lib/tasks/` like `lib/tasks/apple.rake` 

You can then run a Rake task like so: 

```bash
rake apple 
# "Eat more apples!"
```

From `sinatra-activerecord`, `rake`, and `activerecord` gems we have the following commands available: 

```bash
rake db:create              # Creates the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:create:all to cre...
rake db:create_migration    # Create a migration (parameters: NAME, VERSION)
rake db:drop                # Drops the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:drop:all to drop al...
rake db:environment:set     # Set the environment value for the database
rake db:fixtures:load       # Loads fixtures into the current environment's database
rake db:migrate             # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
rake db:migrate:status      # Display status of migrations
rake db:prepare             # Runs setup if database does not exist, or runs migrations if it does
rake db:rollback            # Rolls the schema back to the previous version (specify steps w/ STEP=n)
rake db:schema:cache:clear  # Clears a db/schema_cache.yml file
rake db:schema:cache:dump   # Creates a db/schema_cache.yml file
rake db:schema:dump         # Creates a db/schema.rb file that is portable against any DB supported by Active Record
rake db:schema:load         # Loads a schema.rb file into the database
rake db:seed                # Loads the seed data from db/seeds.rb
rake db:seed:replant        # Truncates tables of each database for current environment and loads the seeds
rake db:setup               # Creates the database, loads the schema, and initializes with the seed data (use db:reset to also drop the databas...
rake db:structure:dump      # Dumps the database structure to db/structure.sql
rake db:structure:load      # Recreates the databases from the structure.sql file
rake db:version             # Retrieves the current schema version number
``` 
