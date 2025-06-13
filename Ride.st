Object subclass: #Ride
    instanceVariableNames: 'rideID pickupLocation dropoffLocation distance'
    classVariableNames: ''
    package: 'RideSharing'

Ride >> initialize: aRideID pickup: aPickup dropoff: aDropoff distance: aDistance 
    rideID := aRideID.
    pickupLocation := aPickup.
    dropoffLocation := aDropoff.
    distance := aDistance

Ride >> calculateFare
    self subclassResponsibility

Ride >> rideDetails
    ^ 'Ride ', rideID, ': ', pickupLocation, ' to ', dropoffLocation, 
      ' (', distance asString, ' miles)'

Ride subclass: #StandardRide
    instanceVariableNames: ''
    package: 'RideSharing'

StandardRide >> calculateFare
    ^ distance * 2.0