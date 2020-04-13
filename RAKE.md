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