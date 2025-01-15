public with sharing class Calculator {
    public Calculator() {

     
    }
    public static Integer Add(Integer a, Integer b){
        return a + b;
    }

    public static Integer Multiply(Integer a , Integer b){
        Integer product = 0;
        
      
        for(Integer i = 0; i < b; i++){
            product = Add(product, a);
        }
        return product;
    }

    // 

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

        // public static Integer Calculate(String expression){
        // }
         
        
   
                public static Decimal calculate(String expression) {
                    expression = expression.replace(' ', '');
                    
                  
                    Pattern pattern = Pattern.compile('(\\d+(\\.\\d+)?)([\\+\\-\\*/])(\\d+(\\.\\d+)?)');
                    Matcher matcher = pattern.matcher(expression);
            
                    if (matcher.matches()) {
                       
                        Decimal operand1 = Decimal.valueOf(matcher.group(1)); // Always use Decimal
                        String operator = matcher.group(3);
                        Decimal operand2 = Decimal.valueOf(matcher.group(4));
                        
                        switch on operator {
                            when '+' {
                                return operand1 + operand2;
                            }
                            when '-' {
                                return operand1 - operand2;
                            }
                            when '*' {
                                return operand1 * operand2;
                            }
                            when '/' {
                                if (operand2 == 0) {
                                    throw new IllegalArgumentException('Division by zero is not allowed.');
                                }
                                return operand1 / operand2;
                            }
                            when else {
                                throw new IllegalArgumentException('Unsupported operator: ' + operator);
                            }
                        }
                    } else {
                        throw new IllegalArgumentException('Invalid mathematical expression: ' + expression);
                    }
                }
            }