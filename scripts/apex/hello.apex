// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

System.debug(Calculator.add(0,5));
System.debug(Calculator.divide(10,2));
System.debug(Calculator.multiply(2,3));
System.debug(Calculator.mod(10,4));
System.debug(Calculator.calculate('1+4'));

// SOQL
System.debug(DataLord.NumAccounts());
System.debug(DataLord.NumHot());
System.debug(DataLord.NumComplex());
System.debug(DataLord.BigFive());
System.debug(DataLord.LastBigOpportunity());
System.debug(DataLord.MajorPlayers());
System.debug(DataLord.MostPopularAccount());
System.debug(DataLord.GetContactandLeadsNamedTom());
System.debug(DataLord.GetAccounts());
System.debug(DataLord.MajorPlayers());

// DML
DataLord.SpawnContacts();
// DataLord.spawnContacts();
DataLord.CreateHomes();
DataLord.Relocate();
DataLord.AssignHomes();
DataLord.deleteSpawnContacts();
DataLord.Play();

// OOP

//   public enum Medium {LAND, AIR, WATER}
Vehicle veh = new Vehicle(45, 5, 'Mazda', 5);

veh.media.add(Vehicle.Medium.LAND);
veh.media.add(Vehicle.Medium.AIR);
veh.media.add(Vehicle.Medium.WATER);
System.debug(veh.toString());
System.debug(veh.Turn());
System.debug(veh.media);
System.debug(veh.speed);
System.debug(veh.name);
System.debug(veh.occupants = 5);
System.debug(veh.occupants);

// System.debug(veh.setName('newVal'));
// System.debug(veh.addMedia(Medium));
System.debug(veh.getSpeed());

// Car Class

Car car = new Car(100, 4, 'BMW', 4);
System.debug(car.accelerate());

System.debug(car.turn(100, 100));
System.debug(car.tireRotation);
System.debug();
car.getSteeringRotation();
car.getTireRotation();
car.getGear();
System.debug(car.getSpeed());
