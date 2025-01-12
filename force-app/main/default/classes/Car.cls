public class Car extends Vehicle  {

    public Car(Integer speed, Integer occupants, String name, Integer capacity) {
        
        super(100, 4, 'BMW', 4);
        this.speed = speed;
        this.occupants = occupants;
        this.name = name ;
        this.capacity = capacity; 
        this.mediaList.add(Vehicle.Medium.LAND);
        this.steeringRotation = 0;
        this.tireRotation = 0;
        // this.steeringRotation = 750;
        // this.tireRotation = 45;
        // this.gear = 'Jacket, Shoes, Boots';
    }


    private Integer steeringRotation {
        get{
            return 750;
        }
        set{
            if(value <= -1440 || value >= 1440) throw new IllegalArgumentException('Please specify a value within a range');
        }
    }

    private Integer rotation = 45;

    public Integer tireRotation{
        get {
            return rotation;
        }
        private set {
            if(value <= -90 || value >= 90) throw new IllegalArgumentException('Please specify a value within a range');
            rotation = value;
            // Create method to update the value since it's a private setter (Only accessed within the class)
        }
    }

    
    public Integer gear{
        get{
            return 3;
        }
        set;
    }

    public String turn(Integer newSteerVal, Integer newTireVal){
        this.tireRotation = this.tireRotation + (newTireVal / 16);
        this.steeringRotation = newSteerVal;
        return 'Steering Rotation val ' + newSteerVal + ' and tire rotation ' + this.tireRotation;
    }

    public Integer accelerate(){
        this.gear = (Integer)Math.ceil(0.4444 * (Math.sqrt(Speed)));
        return this.gear;
    }

    




    // public void getGear(){
    //     System.debug(gear);
    // }

    // public void getSteeringRotation(){
    //     System.debug(steeringRotation);
    // }
    // public void getTireRotation(){
    //     System.debug(tireRotation);
    // }
    // public void setTurn(Integer newVal){
    // if(steeringRotation < -1440 || steeringRotation > 1440) throw new IllegalArgumentException('The car cannot be less then -1440 or greater then 1440');
    //     steeringRotation = newVal;
    //     System.debug(steeringRotation);
    // }
    // public void setTireRotation(Integer newVal){
    //     if(tireRotation < -90 || tireRotation > 90) throw new IllegalArgumentException('The car cannot be less then -90 or greater then 90');
    //         tireRotation = newVal;
    //         System.debug(tireRotation);
    // }
}