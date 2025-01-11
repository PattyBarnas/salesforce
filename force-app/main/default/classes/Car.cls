public class Car extends Vehicle {

    private Integer SteeringRotation;
    private Integer TireRotation;
    private List<Gear> gear;


    public Car() {

        this.SteeringRotation = 750;
        this.TireRotation = 45;

    }


    public void getSteeringRotation(){
        if(SteeringRotation < -1440 || SteeringRotation > 1440) throw new IllegalArgumentException('The car cannot be less then -1440 or greater then 1440');
           
        System.debug(SteeringRotation);
    }
    public void getSteeringRotation(){
        if(TireRotation < -90 || TireRotation > 90) throw new IllegalArgumentException('The car cannot be less then -90 or greater then 90');
        System.debug(TireRotation);
    }
}