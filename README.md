# Santander Bikes
An app to emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) for London's Santander Bikes scheme.

# User Story 1
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.
```
# Domain Model 1
**DockingStation <-- release_bike --> a Bike**

# User Story 2
```
As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```
# Domain Model 2
**Bike <-- working? --> true/false**

# User Story 3
```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```
# Domain Model 3
**DockingStation <-- dock(bike) --> bike**

# User Story 4
```
As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```
# Domain Model 4
When release a bike and no bike is docked
**DockingStation <-- release_bike --> "No docked bikes"**

When a bike is docked
**DockingStation <-- release_bike --> bike**
