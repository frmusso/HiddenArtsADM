# HiddenArtsADM_Project_2018-2019
## Contributors
Hidden Arts has been developed by Francesco Musso ([@frmusso](https://github.com/frmusso)) and Davide Ponassi ([@ponassi](https://github.com/ponassi)).

## The project
###### Domain
The domain is Street Arts. It is based on a mobile application which will provide detailed informations about street arts around the world. Street arts are shared by users that will take photo and fill an information form to be send to the database. The application will support Facebook and Google login and it will allow only one session per device.

###### System specifications
Our dataset is read-intensive. We do not consider our dataset write-intensive since street arts will not be shared much frequently. Also object shared will end up in a moderation queue before being visible to users. So reading data may be eventually consistent.

Also the dataset will increase proportionally to time and active users so it would be better to create a system that uses technologies that provides partitioning and replication.

We rely on Cassandra technology and CQL for workload.

###### Main dataset ([published.csv](/datasets/published.csv))
The chosen dataset is a custom dataset composed by a manually generated part (which consist of 225 real data entries) and a pseudo-random generated one (24775 entries). The random generated part has followed these procedure:

- It generates random Latitude / Longitude point on earth (beside Antarctica).
- It evaluates its nature (wheter on land or on water).
- It keeps generate a random point till it is on land.
- Once it has a point it generates a random art title and take a random real author.

Users table are also initially random-generated.
This allow us to generate a pseudo-real data whose weight is ~2.3 MBytes.

###### Other csv datasets

- [unpublished.csv](/datasets/unpublished.csv): same structure as [published.csv](/datasets/published.csv) but it refers to the unpublished street arts, which means that they still are in the moderation queue (5000 rows).

- [users.csv](/datasets/users.csv): contains random generated users dataset (500 rows).

- [devices.csv](/datasets/devices.csv): contains registered mobile devices dataset (269 rows).

- [authors.csv](/datasets/authors.csv): contains random generated authors dataset (50 rows).

- [reports.csv](/datasets/reports.csv): contains random generated reports from users with randomized statuses (100 rows).

- [authorsPublished.csv](/datasets/authorsPublished.csv), [usersPublished.csv](/datasets/usersPublished.csv), [reportsPublished.csv](/datasets/reportsPublished.csv): these are tables needed to create joins in order to use our workload properly.

###### How we evaluates land and water points
You can check the details on the repository [IsOnWater_CSharp](https://github.com/frmusso/IsOnWater_CSharp).

## Project file structure
- datasets: contains csv data which has been used to populate the database
- src: contains cql schema and population
- ~~docs~~: contains documentation (soon to be added)
- ~~workload~~: contains cql workload (soon to be added)
