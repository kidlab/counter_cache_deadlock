### Example of deadlock in counter_cache

 - rails 4.2.4
 - postgres 9.4.4
 - pg gem 0.18.3

run `ruby start.rb`. If it works, try again. Eventually you will see a deadlock like this:

```
Failure/Error: Photo.create(vehicle: @vehicle, url: 'url')
     ActiveRecord::StatementInvalid:
       PG::TRDeadlockDetected: ERROR:  deadlock detected at character 8
       DETAIL:  Process 16068 waits for RowExclusiveLock on relation 7029746 of database 7029736; blocked by process 16069.
       Process 16069 waits for AccessExclusiveLock on relation 7029758 of database 7029736; blocked by process 16068.
       HINT:  See server log for query details.
       : UPDATE "vehicles" SET "photos_count" = COALESCE("photos_count", 0) + 1 WHERE "vehicles"."id" = $1
```
