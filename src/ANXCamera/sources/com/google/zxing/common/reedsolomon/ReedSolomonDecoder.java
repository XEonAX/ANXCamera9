package com.google.zxing.common.reedsolomon;

public final class ReedSolomonDecoder {
    private final GenericGF field;

    public ReedSolomonDecoder(GenericGF field) {
        this.field = field;
    }

    public void decode(int[] received, int twoS) throws ReedSolomonException {
        int i;
        int[] iArr = received;
        int i2 = twoS;
        GenericGFPoly poly = new GenericGFPoly(this.field, iArr);
        int[] syndromeCoefficients = new int[i2];
        boolean noError = true;
        int i3 = 0;
        while (true) {
            i = 1;
            if (i3 >= i2) {
                break;
            }
            i = poly.evaluateAt(this.field.exp(this.field.getGeneratorBase() + i3));
            syndromeCoefficients[(syndromeCoefficients.length - 1) - i3] = i;
            if (i != 0) {
                noError = false;
            }
            i3++;
        }
        if (!noError) {
            GenericGFPoly[] sigmaOmega = runEuclideanAlgorithm(this.field.buildMonomial(i2, 1), new GenericGFPoly(this.field, syndromeCoefficients), i2);
            GenericGFPoly sigma = sigmaOmega[null];
            GenericGFPoly omega = sigmaOmega[1];
            int[] errorLocations = findErrorLocations(sigma);
            int[] errorMagnitudes = findErrorMagnitudes(omega, errorLocations);
            int i4 = 0;
            while (i4 < errorLocations.length) {
                int position = (iArr.length - i) - this.field.log(errorLocations[i4]);
                if (position >= 0) {
                    iArr[position] = GenericGF.addOrSubtract(iArr[position], errorMagnitudes[i4]);
                    i4++;
                    i = 1;
                } else {
                    throw new ReedSolomonException("Bad error location");
                }
            }
        }
    }

    private GenericGFPoly[] runEuclideanAlgorithm(GenericGFPoly a, GenericGFPoly b, int R) throws ReedSolomonException {
        GenericGFPoly temp;
        if (a.getDegree() < b.getDegree()) {
            temp = a;
            a = b;
            b = temp;
        }
        temp = a;
        GenericGFPoly r = b;
        GenericGFPoly tLast = this.field.getZero();
        GenericGFPoly t = this.field.getOne();
        while (r.getDegree() >= R / 2) {
            GenericGFPoly rLastLast = temp;
            GenericGFPoly tLastLast = tLast;
            temp = r;
            tLast = t;
            if (temp.isZero()) {
                throw new ReedSolomonException("r_{i-1} was zero");
            }
            r = rLastLast;
            GenericGFPoly q = this.field.getZero();
            int dltInverse = this.field.inverse(temp.getCoefficient(temp.getDegree()));
            while (r.getDegree() >= temp.getDegree() && !r.isZero()) {
                int degreeDiff = r.getDegree() - temp.getDegree();
                int scale = this.field.multiply(r.getCoefficient(r.getDegree()), dltInverse);
                q = q.addOrSubtract(this.field.buildMonomial(degreeDiff, scale));
                r = r.addOrSubtract(temp.multiplyByMonomial(degreeDiff, scale));
            }
            t = q.multiply(tLast).addOrSubtract(tLastLast);
            if (r.getDegree() >= temp.getDegree()) {
                throw new IllegalStateException("Division algorithm failed to reduce polynomial?");
            }
        }
        int sigmaTildeAtZero = t.getCoefficient(0);
        if (sigmaTildeAtZero != 0) {
            int inverse = this.field.inverse(sigmaTildeAtZero);
            GenericGFPoly sigma = t.multiply(inverse);
            GenericGFPoly omega = r.multiply(inverse);
            return new GenericGFPoly[]{sigma, omega};
        }
        throw new ReedSolomonException("sigmaTilde(0) was zero");
    }

    private int[] findErrorLocations(GenericGFPoly errorLocator) throws ReedSolomonException {
        int numErrors = errorLocator.getDegree();
        if (numErrors == 1) {
            return new int[]{errorLocator.getCoefficient(1)};
        }
        int[] result = new int[numErrors];
        int e = 0;
        for (int i = 1; i < this.field.getSize() && e < numErrors; i++) {
            if (errorLocator.evaluateAt(i) == 0) {
                result[e] = this.field.inverse(i);
                e++;
            }
        }
        if (e == numErrors) {
            return result;
        }
        throw new ReedSolomonException("Error locator degree does not match number of roots");
    }

    private int[] findErrorMagnitudes(GenericGFPoly errorEvaluator, int[] errorLocations) {
        int s = errorLocations.length;
        int[] result = new int[s];
        for (int i = 0; i < s; i++) {
            int xiInverse = this.field.inverse(errorLocations[i]);
            int denominator = 1;
            for (int j = 0; j < s; j++) {
                if (i != j) {
                    int term = this.field.multiply(errorLocations[j], xiInverse);
                    denominator = this.field.multiply(denominator, (term & 1) == 0 ? term | 1 : term & -2);
                }
            }
            result[i] = this.field.multiply(errorEvaluator.evaluateAt(xiInverse), this.field.inverse(denominator));
            if (this.field.getGeneratorBase() != 0) {
                result[i] = this.field.multiply(result[i], xiInverse);
            }
        }
        return result;
    }
}
