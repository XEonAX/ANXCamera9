package com.google.zxing.pdf417.decoder.ec;

import com.google.zxing.ChecksumException;

public final class ErrorCorrection {
    private final ModulusGF field = ModulusGF.PDF417_GF;

    public int decode(int[] received, int numECCodewords, int[] erasures) throws ChecksumException {
        boolean error;
        int[] iArr = received;
        int i = numECCodewords;
        int[] iArr2 = erasures;
        ModulusPoly poly = new ModulusPoly(this.field, iArr);
        int[] S = new int[i];
        boolean error2 = false;
        int i2 = i;
        while (i2 > 0) {
            error = error2;
            int eval = poly.evaluateAt(this.field.exp(i2));
            S[i - i2] = eval;
            error2 = eval != 0 ? true : error;
            i2--;
            iArr2 = erasures;
        }
        if (!error2) {
            return 0;
        }
        int b;
        ModulusPoly knownErrors = this.field.getOne();
        int i3 = 1;
        if (iArr2 != null) {
            int length = iArr2.length;
            ModulusPoly knownErrors2 = knownErrors;
            int knownErrors3 = 0;
            while (knownErrors3 < length) {
                b = this.field.exp((iArr.length - i3) - iArr2[knownErrors3]);
                knownErrors2 = knownErrors2.multiply(new ModulusPoly(this.field, new int[]{this.field.subtract(0, b), 1}));
                knownErrors3++;
                iArr2 = erasures;
                i3 = 1;
            }
        }
        ModulusPoly syndrome = new ModulusPoly(this.field, S);
        ModulusPoly[] sigmaOmega = runEuclideanAlgorithm(this.field.buildMonomial(i, 1), syndrome, i);
        i2 = sigmaOmega[0];
        ModulusPoly omega = sigmaOmega[1];
        int[] errorLocations = findErrorLocations(i2);
        int[] errorMagnitudes = findErrorMagnitudes(omega, i2, errorLocations);
        b = 0;
        while (b < errorLocations.length) {
            ModulusPoly syndrome2 = syndrome;
            int position = (iArr.length - 1) - this.field.log(errorLocations[b]);
            if (position >= 0) {
                error = error2;
                iArr[position] = this.field.subtract(iArr[position], errorMagnitudes[b]);
                b++;
                syndrome = syndrome2;
                error2 = error;
            } else {
                throw ChecksumException.getChecksumInstance();
            }
        }
        return errorLocations.length;
    }

    private ModulusPoly[] runEuclideanAlgorithm(ModulusPoly a, ModulusPoly b, int R) throws ChecksumException {
        ModulusPoly temp;
        if (a.getDegree() < b.getDegree()) {
            temp = a;
            a = b;
            b = temp;
        }
        temp = a;
        ModulusPoly r = b;
        ModulusPoly tLast = this.field.getZero();
        ModulusPoly t = this.field.getOne();
        while (r.getDegree() >= R / 2) {
            ModulusPoly rLastLast = temp;
            ModulusPoly tLastLast = tLast;
            temp = r;
            tLast = t;
            if (temp.isZero()) {
                throw ChecksumException.getChecksumInstance();
            }
            r = rLastLast;
            ModulusPoly q = this.field.getZero();
            int dltInverse = this.field.inverse(temp.getCoefficient(temp.getDegree()));
            while (r.getDegree() >= temp.getDegree() && !r.isZero()) {
                int degreeDiff = r.getDegree() - temp.getDegree();
                int scale = this.field.multiply(r.getCoefficient(r.getDegree()), dltInverse);
                q = q.add(this.field.buildMonomial(degreeDiff, scale));
                r = r.subtract(temp.multiplyByMonomial(degreeDiff, scale));
            }
            t = q.multiply(tLast).subtract(tLastLast).negative();
        }
        int sigmaTildeAtZero = t.getCoefficient(0);
        if (sigmaTildeAtZero != 0) {
            int inverse = this.field.inverse(sigmaTildeAtZero);
            ModulusPoly sigma = t.multiply(inverse);
            ModulusPoly omega = r.multiply(inverse);
            return new ModulusPoly[]{sigma, omega};
        }
        throw ChecksumException.getChecksumInstance();
    }

    private int[] findErrorLocations(ModulusPoly errorLocator) throws ChecksumException {
        int numErrors = errorLocator.getDegree();
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
        throw ChecksumException.getChecksumInstance();
    }

    private int[] findErrorMagnitudes(ModulusPoly errorEvaluator, ModulusPoly errorLocator, int[] errorLocations) {
        int i;
        int errorLocatorDegree = errorLocator.getDegree();
        int[] formalDerivativeCoefficients = new int[errorLocatorDegree];
        for (i = 1; i <= errorLocatorDegree; i++) {
            formalDerivativeCoefficients[errorLocatorDegree - i] = this.field.multiply(i, errorLocator.getCoefficient(i));
        }
        ModulusPoly formalDerivative = new ModulusPoly(this.field, formalDerivativeCoefficients);
        int s = errorLocations.length;
        int[] result = new int[s];
        for (i = 0; i < s; i++) {
            int xiInverse = this.field.inverse(errorLocations[i]);
            result[i] = this.field.multiply(this.field.subtract(0, errorEvaluator.evaluateAt(xiInverse)), this.field.inverse(formalDerivative.evaluateAt(xiInverse)));
        }
        return result;
    }
}
