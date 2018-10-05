# Jobby Job Job

Heroku takes 30 seconds to load the instance. After that, it's really very fast.


[http://jobbyjobjob.net/](http://jobbyjobjob.net/)

## Description

Jobby Job Job is a website that aggregates job postings from five different job boards.
The job boards are remote only jobs. You can specify and search for different jobs.
You can also view the original post.

Job posts are updated every hour using the Heroku scheduler to execute a rake
background task. The rake task builds the posts and creates the search indexes.

## Screenshot Time

![Screenshot](public/img/screenshot.png)

## Check out these job boards:

- [https://www.indeed.com](https://www.indeed.com)
- [https://jobs.github.com](https://jobs.github.com)
- [https://weworkremotely.com/](https://weworkremotely.com/)
- [https://remoteok.io/](https://remoteok.io/)
- [https://stackoverflow.com/jobs/](https://stackoverflow.com/jobs/)

## Contributing

If you want to help me with this project, please just submit a pull request to fix a bug or add a feature, like another job board. I will probably accept it. If you don't, then I hate you.

This is a good project to work on if you want to do [Hacktoberfest](https://hacktoberfest.digitalocean.com/) #Hacktoberfest. Check out this [issue](https://github.com/willywos/jobbyjobjob/issues/1) for some ideas or feel free to add to the list.

Thanks goes to of these wonderful people, who allready contributed to the project: 

<!-- ALL-CONTRIBUTORS-LIST:START -->
| [<img src="https://avatars1.githubusercontent.com/u/101503?s=400&v=4" width="140px;"/><br /><sub><b>Will Wilimek</b></sub>](http://willywos.github.io)<br />[📖](https://github.com/willywos/jobbyjobjob/commits?author=willywos "Documentation") | [<img src="https://avatars0.githubusercontent.com/u/801470?s=400&v=4" width="140px;"/><br /><sub><b>Jake Sorce</b></sub>](https://github.com/jakesorce)<br />[📖](https://github.com/willywos/jobbyjobjob/commits?author=jakesorce "Documentation") | [<img src="https://avatars3.githubusercontent.com/u/5741299?s=460&v=4" width="140px;"/><br /><sub><b>RJ Beers</b></sub>](http://beneb.info)<br />[📖](https://github.com/willywos/jobbyjobjob/commits?author=r33beers "Documentation") | 
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
[<img src="https://avatars3.githubusercontent.com/u/31360746?s=400&v=4" width="140px;"/><br /><sub><b>Tripph</b></sub>](https://github.com/tripph)<br />[📖](https://github.com/willywos/jobbyjobjob/commits?author=tripph "Documentation") | [<img src="https://avatars0.githubusercontent.com/u/839766?s=460&v=4" width="140px;"/><br /><sub><b>Cristian R. Silva</b></sub>](https://github.com/jfmengels)<br />[📖](https://github.com/willywos/jobbyjobjob/commits?author=ocristian  "Documentation")| [<img src="https://avatars2.githubusercontent.com/u/2006403?s=460&v=4" width="140px;"/><br /><sub><b>Ivan Granados</b></sub>](https://github.com/chivoX)<br />[📖](https://github.com/willywos/jobbyjobjob/commits?author=chivoX "Documentation") 
<!-- ALL-CONTRIBUTORS-LIST:END -->
(By clicking on 📖 you can see individual contributions)

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. 


## Building the project

Ruby Version: ruby 2.5.1
Rails Version: 5.2.1

```
$ git clone https://github.com/willywos/jobbyjobjob.git
$ cd jobbyjobjob
$ bundle install
$ rake db:create (postgres database)
$ rake db:migrate
$ rake db:seed
$ rails s
```

## Grabbing Jobs

```
$ rake jobby_job:process_job_sites
```

## Submitting Pull Requests

1. Fork the project
2. Create a topic branch
3. Implement your feature or bug fix
4. Add tests for your feature or bug fix (if you want)
5. Run `$ rspec spec/` make sure tests pass.
6. If your change affects something in this README, please update it
7. Commit and push your changes
8. Submit a pull request
