# FastApi Template

This repository contains all the necessary files and settings to spin up a REST API-based application. As I used to work on mostly ML based applications, this template is mainly for that purpose (database connection abstraction is missing), so that I can start a project without spending too much time on boilerplate code.
Anyone can use this template to start their project, which contains all the best practices for Python applications.

### Pre-requisites
- docker
- poetry


### Development Setup(for)

To install necessary packages. Run following commands from project root 
```
make dev_setup
make pre_commit_setup
```

### Useful commands

- To run the application
```
make server
```

- To install packages only for production.
```
make server_setup
```

- To run tests
```
make test
```
- To run test with html coverage
```
make html_test_coverage
```

- To run test with xml coverage
```
make xml_test_coverage
```

