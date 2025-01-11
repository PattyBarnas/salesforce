public virtual class Vehicle {

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
        this.media = new List<Medium>();
        
        // , Integer speed ,Integer occupants, Integer capacity
        // this.occupants = occupants;
        // this.media = new List<Medium>();
    
        // if(capacity < 1) throw new IllegalArgumentException('Cannot set less then 1 capacity');
        // this.capacity = capacity;
        // setSpeed(speed);
        // setName(name);
    }

    public void addMedia() {
       
    }
    

    public Integer getSpeed(){
        return this.speed;
    }
    public String getName(){
        return this.name;
    }
    public Integer accelerate(Integer setSpeed){
        if(speed < 0) throw new IllegalArgumentException('Cant go negative speed.');
        return speed = setSpeed;
    }


   
    public Integer getCapacity(){
       return this.capacity;
    }

    public override String toString(){
       return 'You are currently going ' +  speed + '\n' + 'Current media: ' + media  + '\n' + 'Name: ' + name + '\n' + 'Occupants: ' +  occupants;
    }

}