public class FinancialForecast {

    public static double predictFutureValue(
            double currentValue,
            double growthRate,
            int years) {

        // Base case
        if (years == 0) {
            return currentValue;
        }

        // Recursive case
        return predictFutureValue(
                currentValue,
                growthRate,
                years - 1)
                * (1 + growthRate);
    }
}