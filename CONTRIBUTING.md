
## Contributing
If you want to help me with this project, please just submit a pull request to fix a bug or add a feature, like another job board. I will probably accept it.

### Submitting Pull Requests
1) Fork the project
2) Create a topic branch
3) Implement your feature or bug fix
4) Add tests for your feature or bug fix (if you want)
5) Run `$rspec spec/` make sure tests pass.
6) If your change affects something in the README, please update it
7) Commit and push your changes
8) Submit a pull request

## Running within Docker

You can run this application on your machine without installing anything natively (besides Docker) by following these steps:

First command prompt:
```
docker-compose up
```

Second command prompt:
```
docker-compose run web rake db:setup
```
