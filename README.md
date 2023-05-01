# About

I'm tired of setting up django projects for some pet-projects,
and to struggle every time with some infrastructure issues.

So I decided to make one flexible template for django+postgres+redis+celery projects.


# First run
## Pre-requisites
- docker and docker-compose installed

## How to run
```shell
make setup
```

You will be prompted to create superuser
and then you can visit admin page
and flower page, to track periodic tasks.

# Examples
To run manage.py commands, you can use:
```shell
    make manage cmd="command_to_run"
```

# Notes

Check makefile to see all available make commands.
