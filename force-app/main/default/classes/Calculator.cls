public with sharing class Calculator {
    public Calculator() {

     
    }
    public static Integer Add(Integer a, Integer b){
        return a + b;
    }

    public static Integer Multiply(Integer a , Integer b){
        Integer product = 0;
        
        //  a * b
        for(Integer i = 0; i < b; i++){
            // (2 , 3)
            // 0 + 2 = 2
            // product = 2 + 2 = 4
            // product 4 + 2 = 6
            // b determines how many times to add the A variable to the product.
            product = Add(product, a);
        }
        return product;
    }

    // 

        // 10 / 2
        // true 10 - 2 = 8
        // true 8 > 2 = 8 - 2 = 6
        //  6- 2 = 4
        //  4 - 2 = 2
        // 2 >= 2 true = 2 -2 = 0
        //  0 >= 2 = false then returns
        //  2 / 10 = 1/5
        public static Integer Divide(Integer a, Integer b) {
            Integer result = 0;
            Integer remainder = a;
        
            if(b == 0) return 0; // Prevent division by zero
        
            while(remainder >= b) {
                remainder = Add(remainder, -b); // Subtract b from remainder
                result = Add(result, 1);
            }
        
            return result;
        }

        public static Integer Mod(Integer a, Integer b){
            Integer result = 0;

            while(a > b){
                a = a - b;

                if(a < b){
                    result = a;
                } else {
                    return 0;
                }
            }
            return result;
        }

        public static Integer Calculate(String a){

        }
}