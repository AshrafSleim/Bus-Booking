
# Bus-Booking
### Requirements
docker
docker-compose
### Before getting starting .

``` cp .env.example .env ```
edit your custom configurations over it .

### Running the applications
```docker-compose up -d ```

### Post Running
```docker-compose exec app composer install ```
```docker-compose exec app composer update ```
```docker-compose exec app  php artisan key:generate ```
```docker-compose exec app  php artisan passport:install ```

### Endpoints 
Admin login (email-passowrd)
http://localhost/api/admin/login
to Add a new bus (BusNumber)
http://localhost/api/admin/addBus
to Add a new station (StationName)
http://localhost/api/admin/addStation
to Add a new Trip (Stations[],startDateTime,endDateTime,IDBus)
http://localhost/api/admin/addTrip

User login (email-passowrd)
http://localhost/api/user/login
to find available seat in your trip (startStation,endStation)
http://localhost/api/user/getTrips
to booking available seat in trip (sourceStationID,destinationStationID)
http://localhost/api/user/booking
