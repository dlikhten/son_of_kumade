# Why?

Son of Kumade is inspired by [Kumade](http://www.github.com/thoughtbot/kumade), except my goal is to make it much simpler, but have some very useful features

# What's so special about this crap, can't I just git push it all?

Well, yes `git push production master:master` is all nice and dandy but there are a few things you actually need...

- Push the changes
- Run a db:migrate
- Restart the app

Well, thats pretty easy still... WTF?

You see, that works really well, except when you have DATA migrations. When you do structural changes to a database, 
all works out just dandy, but what happens when you actually need to migrate the data itself?

Well the first problem you will face is writing it. Yay done... Or is it. Usually when you write data migrations
especially if there are multiple commits that are getting pushed to production, the old migrations may not be
compatible with the latest code. So just pushing master will make the migrations fail.

The best workaround for such a problem is to push the code that introduced the migration, run the migration, then
push the code with the next migration and run that, and so on until you get to the head.

# The goal

The goal is for this tool is to deploy to heroku and do the procedure mentioned above. If you specify a commit sha
then this tool will do the deploy procedure for every sha in between the one specified and the latest which contains
the latest modification of a database migration.

# Usage

to deploy to heroku (staging)

    kumade
    
or

	kumade staging
    
to deploy to heroku (production)

	kumade production
	
options:

`--by_migrations FROM_SHA` deploy in stages, each stage being the commit with the latest mention of a database migration.

This assumes a repository structure: it assumes that you rebase in such a way that there are no migrations between any two revisions of the same database migration. So if db/migration/1234.rb was modified twice, there will be no new migration file added/renamed/whatever, in between the multiple modifications. There are techniques in git that will ensure this.

This creates a limitation in how you can commit/merge BUT the limitation gives power when it is needed. If you do not need this power during a certain push, you can just avoid the `--by_migrations` option.
