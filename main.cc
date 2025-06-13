#include <iostream>
#include <vector>
#include <string>
using namespace std;

class Ride {
protected:
    string rideID;
    string pickupLocation;
    string dropoffLocation;
    double distance;

public:
    Ride(string id, string pickup, string dropoff, double dist)
        : rideID(id), pickupLocation(pickup), dropoffLocation(dropoff), distance(dist) {}
    
    virtual double calculateFare() = 0;
    virtual string rideDetails() {
        return "Ride " + rideID + ": " + pickupLocation + " to " + dropoffLocation + 
               " (" + to_string(distance) + " miles)";
    }
    virtual ~Ride() {}
};

class StandardRide : public Ride {
public:
    StandardRide(string id, string pickup, string dropoff, double dist)
        : Ride(id, pickup, dropoff, dist) {}
    
    double calculateFare() override {
        return distance * 2.0;
    }
};

class PremiumRide : public Ride {
public:
    PremiumRide(string id, string pickup, string dropoff, double dist)
        : Ride(id, pickup, dropoff, dist) {}
    
    double calculateFare() override {
        return distance * 3.0;
    }
};

int main() {
    vector<Ride*> rides;
    rides.push_back(new StandardRide("R1", "Downtown", "Suburb", 15));
    rides.push_back(new PremiumRide("R2", "Airport", "City Center", 8));

    for (auto ride : rides) {
        cout << ride->rideDetails() << endl;
        cout << "Fare: $" << ride->calculateFare() << endl << endl;
    }

    // Cleanup
    for (auto ride : rides) delete ride;
    
    return 0;
}