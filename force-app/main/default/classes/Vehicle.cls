public with sharing class Vehicle {

    public enum Medium {LAND, AIR, WATER}

    private Integer speed;
    // {
    //  get {return speed; }
    // }
    private String name;
    public Integer occupants;
    public final Integer capacity;
    protected List<Medium> media;


    public Vehicle() {
        this.Speed = 45;
        this.Occupants = 6;
        this.Name = 'Cyber Truck';
        this.Capacity = 5; 
        
        // , Integer speed ,Integer occupants, Integer capacity
        // this.occupants = occupants;
        // this.media = new List<Medium>();
    
        // if(capacity < 1) throw new IllegalArgumentException('Cannot set less then 1 capacity');
        // this.capacity = capacity;
        // setSpeed(speed);
        // setName(name);
    }
    

    public Integer getSpeed(){
        return this.speed;
    }
    public String getName(){
        return this.name;
    }
    public Integer Accelerate(Integer setSpeed){
        if(speed < 0) throw new IllegalArgumentException('Cant go negative speed.');
        return speed = setSpeed;
    }
    public String setName(String setName){
        return this.name = name;
    }

    public abstract String turn();
   
    public Integer getCapacity(){
       return this.capacity;
    }

}