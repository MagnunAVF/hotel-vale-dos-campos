# Hotel Vale dos Campos Web App

Web app for booking management.
This project has educationa purposes.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Before all, you need to have Ruby installed in your computer. You can use [RVM](https://rvm.io/rvm/install) or [Rbenv](https://github.com/rbenv/rbenv).
Besides this, you need to have the gem Bundler installed. To install, run in terminal:
```
gem install bundler
```

### Installing

First, clone the app with:
```
git clone git@bitbucket.org:MagnunFurtado/hotel.git
```
After, enter in the app folder and run in terminal:
```
make setup
```

## To run local for development
After install, run in terminal:
```
rails server
```
Now, go to url:
```
http://localhost:3000
```

## Running the tests

The app uses Guard and Rspec to automated tests.
To run the tests: run in terminal:
```
bundle exec guard init
```  
After this, the Guard test environment are runing.
To run all tests press **ENTER** two times.

## Deployment

Not yet done

## Built With

* [RubyOnRails](http://rubyonrails.org/) - The web framework used
* [Devise](https://github.com/plataformatec/devise) - Gem for user authentication
* [Semantic UI](https://semantic-ui.com) - Frontend framework
* [Rspec](http://rspec.info/) - Testing tool
* [Guard](https://github.com/guard/guard) - Gem for automated tests

## Contributing

Only have to fork the project and make a pull request.

## Versioning

We use [SemVer](http://semver.org/) for versioning.

## License

This project is [Opensource](https://opensource.org/).
