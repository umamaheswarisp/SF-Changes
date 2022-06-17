public class AwesomeCalculator {
    public static Double add(Double x, Double y) {
        calculatorServices.CalculatorImplPort calculator = 
            new calculatorServices.CalculatorImplPort();
        Double output = calculator.doAdd(x,y);
        System.debug('added value: '+output);
        return output; 
    }
}