// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract CryptoWildlifeAdoptionRegistry {


struct Animal {
string name;
string species;
bool isAdopted;
address adopter;
}


mapping(uint => Animal) public animals;
uint public animalCount;


// Add a new animal to the registry
function registerAnimal(string memory _name, string memory _species) public {
animalCount++;
animals[animalCount] = Animal(_name, _species, false, address(0));
}


// Adopt an animal
function adoptAnimal(uint _id) public {
require(_id > 0 && _id <= animalCount, "Invalid ID");
require(!animals[_id].isAdopted, "Already adopted");


animals[_id].isAdopted = true;
animals[_id].adopter = msg.sender;
}


// Get adoption details
function getAnimal(uint _id) public view returns (string memory, string memory, bool, address) {
require(_id > 0 && _id <= animalCount, "Invalid ID");
Animal memory a = animals[_id];
return (a.name, a.species, a.isAdopted, a.adopter);
}
}
