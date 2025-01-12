public class Car extends Vehicle  {

    private Integer steeringRotation;
    private Integer tireRotation;
    private String gear;


    public Car() {
        this.steeringRotation = 750;
        this.tireRotation = 45;
        this.gear = 'Jacket, Shoes, Boots';
    }


    public void getGear(){
        System.debug(gear);
    }

    public void getSteeringRotation(){
        System.debug(steeringRotation);
    }
    public void getTireRotation(){
        System.debug(tireRotation);
    }
    public void setTurn(Integer newVal){
    if(steeringRotation < -1440 || steeringRotation > 1440) throw new IllegalArgumentException('The car cannot be less then -1440 or greater then 1440');
        steeringRotation = newVal;
        System.debug(steeringRotation);
    }
    public void setTireRotation(Integer newVal){
        if(tireRotation < -90 || tireRotation > 90) throw new IllegalArgumentException('The car cannot be less then -90 or greater then 90');
            tireRotation = newVal;
            System.debug(tireRotation);
    }
}