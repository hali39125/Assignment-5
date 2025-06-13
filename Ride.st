Namespace declare: #RideSharing.

Object subclass: Ride [
    | rideID pickupLocation dropoffLocation distance |
    
    initialize: aRideID pickup: aPickup dropoff: aDropoff distance: aDistance [
        rideID := aRideID.
        pickupLocation := aPickup.
        dropoffLocation := aDropoff.
        distance := aDistance
    ]
    
    calculateFare [
        self subclassResponsibility
    ]
    
    rideDetails [
        ^ 'Ride ', rideID, ': ', pickupLocation, ' to ', dropoffLocation,
          ' (', distance asString, ' miles)'
    ]
]

Ride subclass: StandardRide [
    calculateFare [
        ^ distance * 2.0
    ]
]

Ride subclass: PremiumRide [
    calculateFare [
        ^ distance * 3.0
    ]
]

Object subclass: Driver [
    | driverID name rating assignedRides |
    
    initialize: aDriverID name: aName [
        driverID := aDriverID.
        name := aName.
        rating := 4.5.
        assignedRides := OrderedCollection new
    ]
    
    addRide: aRide [
        assignedRides add: aRide
    ]
    
    getDriverInfo [
        ^ 'Driver ', driverID, ': ', name, ' (Rating: ', rating asString, ')'
    ]
]

"Demo Execution"
| ride1 ride2 driver |
ride1 := StandardRide new initialize: 'R1' pickup: 'Downtown' dropoff: 'Suburb' distance: 15.
ride2 := PremiumRide new initialize: 'R2' pickup: 'Airport' dropoff: 'City Center' distance: 8.

driver := Driver new initialize: 'D1' name: 'John'.
driver addRide: ride1.
driver addRide: ride2.

Transcript show: ride1 rideDetails; cr.
Transcript show: 'Fare: $', ride1 calculateFare printString; cr.
Transcript show: ride2 rideDetails; cr.
Transcript show: 'Fare: $', ride2 calculateFare printString; cr.
Transcript show: driver getDriverInfo; cr.
