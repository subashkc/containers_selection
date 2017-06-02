# containers_selection
A simple Ruby app to select containers


For a given collection of container sizes and a required load, this simple algorithm will select sufficient containers for
the load, such that:

1. the overcapacity is minimized, and
2. the smallest number of containers are used

e.g

containers: 2, 3, 5
size: 6 => 3, 3
size: 9 => 5, 2, 2 or 3, 3, 3
size: 11 => 5, 3, 3

containers: 4, 2
size: 5 => 4, 2
size: 8 => 4, 4

containers: 5,6,7
size: 8 => 5, 5
