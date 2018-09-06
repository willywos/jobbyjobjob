# Jobby Job Job
Heroku takes 30 seconds to load the instance. After that it's really very fast.

[https://jobbyjobjob.herokuapp.com/](https://jobbyjobjob.herokuapp.com/)

## Description
Jobby Job Job is a website that aggregates job postings from 4 different job boards.
The job boards are remote only jobs. You can specify and search for different jobs.
You can also view the original post.

Job posts are updated every hour using the Heroku scheduler to execute a rake
background task. The rake task builds the posts and creates the search indexes.

## Screenshot Time.

![Screenshot](public/img/screenshot.png)


## Check out these job boards:

- [https://www.indeed.com](https://www.indeed.com)
- [https://jobs.github.com](https://jobs.github.com)
- [https://weworkremotely.com/](https://weworkremotely.com/)
- [https://remoteok.io/](https://remoteok.io/)

## Contributing

If you want to help me with this project by adding a feature, another job board
or fixing a bug please just submit a pull request. I will probably accept it.
If you don't then I hate you.

This is a good project to work on if you want to do [Hacktoberfest](https://hacktoberfest.digitalocean.com/) #Hacktoberfest
Some things that might be fun to work on:
- Adding ability to login to save jobs
- Adding your resume.
- Add stackoverflow jobs.
- Add some cool graphics
- Update the layout for the job post so it looks nicer.
