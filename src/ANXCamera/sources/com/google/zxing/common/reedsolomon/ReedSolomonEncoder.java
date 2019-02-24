package com.google.zxing.common.reedsolomon;

import java.util.ArrayList;
import java.util.List;

public final class ReedSolomonEncoder {
    private final List<GenericGFPoly> cachedGenerators = new ArrayList();
    private final GenericGF field;

    public ReedSolomonEncoder(GenericGF field) {
        this.field = field;
        this.cachedGenerators.add(new GenericGFPoly(field, new int[]{1}));
    }

    private GenericGFPoly buildGenerator(int degree) {
        if (degree >= this.cachedGenerators.size()) {
            GenericGFPoly lastGenerator = (GenericGFPoly) this.cachedGenerators.get(this.cachedGenerators.size() - 1);
            for (int d = this.cachedGenerators.size(); d <= degree; d++) {
                GenericGFPoly nextGenerator = lastGenerator.multiply(new GenericGFPoly(this.field, new int[]{1, this.field.exp((d - 1) + this.field.getGeneratorBase())}));
                this.cachedGenerators.add(nextGenerator);
                lastGenerator = nextGenerator;
            }
        }
        return (GenericGFPoly) this.cachedGenerators.get(degree);
    }

    public void encode(int[] toEncode, int ecBytes) {
        if (ecBytes != 0) {
            int dataBytes = toEncode.length - ecBytes;
            if (dataBytes > 0) {
                GenericGFPoly generator = buildGenerator(ecBytes);
                int[] infoCoefficients = new int[dataBytes];
                System.arraycopy(toEncode, 0, infoCoefficients, 0, dataBytes);
                int[] coefficients = new GenericGFPoly(this.field, infoCoefficients).multiplyByMonomial(ecBytes, 1).divide(generator)[1].getCoefficients();
                int numZeroCoefficients = ecBytes - coefficients.length;
                for (int i = 0; i < numZeroCoefficients; i++) {
                    toEncode[dataBytes + i] = 0;
                }
                System.arraycopy(coefficients, 0, toEncode, dataBytes + numZeroCoefficients, coefficients.length);
                return;
            }
            throw new IllegalArgumentException("No data bytes provided");
        }
        throw new IllegalArgumentException("No error correction bytes");
    }
}
