public virtual class Vehicle extends Turn {

    public enum Medium {LAND, AIR, WATER}

    public Integer speed {
        get {
            return 45;
        }
        set{}
    }

    public String name {
        get{
            return 'Cyber Truck';
        }
        set{}
    }

    public Integer occupants {
        get{
            return 4;
        }
         set { 
            if( value < 0) throw new IllegalArgumentException('Cant be negative! ');
        }
    }

    public final Integer capacity {
        get{
            return 1;
        }
        set {
            if( value < 1) throw new IllegalArgumentException('Cant be less then 1. ');
        }
    }

    protected List<Medium> mediaList = new List<Medium>();

    public List<Medium> media { 
        get {
            return mediaList;
        } 
    }
    


    

    public Vehicle(Integer speed, Integer occupants, String name, Integer capacity) {
    //if we want to initialize default values; 

        this.speed = speed;
        this.occupants = occupants;
        this.name = name ;
        this.capacity = capacity; 
        // this.media = mediaList;
        
        // , Integer speed ,Integer occupants, Integer capacity
        // this.occupants = occupants;
        // this.media = new List<Medium>();
    
        // if(capacity < 1) throw new IllegalArgumentException('Cannot set less then 1 capacity');
        // this.capacity = capacity;
        // setSpeed(speed);
        // setName(name);
    }

    // public void addMedia() {
       
    // }
    

    // public Integer getSpeed(){
    //     return this.speed;
    // }

    // public String getName(){
    //     return this.name;
    // }

    public Integer accelerate(Integer setSpeed){
        if(speed < 0) throw new IllegalArgumentException('Cant go negative speed.');
        return speed = setSpeed;
    }


   
    public Integer getCapacity(){
       return this.capacity;
    }

    // public Integer setSpeed(Integer newVal){
    //     if (newVal < 0) throw new IllegalArgumentException('You cant go negative speed!');
    //     return this.speed = newVal;
    // }
 

    // protected String setName(String newVal){
    //     if (newVal == null) throw new IllegalArgumentException('you need to enter a value!');
    //     return this.name = newVal;
    // }

    public override String turn(){
        return 'You have turned left! Watch out!';
    }

    public override String toString(){
       return 'You are currently going ' +  speed + '\n' + 'Current media: ' + media  + '\n' + 'Name: ' + name + '\n' + 'Occupants: ' +  occupants;
    }

  

}