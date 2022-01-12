## STACK:
### Ruby: 3.0.2
### Rails: 7.0.1
### Postgresql: 13

#### API Documentation: https://documenter.getpostman.com/view/6564231/UVXhpbs4#9d1322a3-6bf3-4f76-9989-986ad1c62835

## How To Install using docker

1. `git clone https://github.com/cloudsbird/RideCombo.git`
2. `cd RideCombo`
3. `docker-compose up`

## How To Install without docker 
0. make sure you have postgresql installed, ruby 3.0.2 is installed too
1. `git clone https://github.com/cloudsbird/RideCombo.git`
2. `cd RideCombo`
3. `bundle install`
4. set the config/database.yml file with your database credentials
5. `rails db:setup`
6. `rails s`




