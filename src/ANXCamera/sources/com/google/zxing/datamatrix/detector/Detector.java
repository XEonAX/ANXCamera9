package com.google.zxing.datamatrix.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.GridSampler;
import com.google.zxing.common.detector.MathUtils;
import com.google.zxing.common.detector.WhiteRectangleDetector;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public final class Detector {
    private final BitMatrix image;
    private final WhiteRectangleDetector rectangleDetector;

    private static final class ResultPointsAndTransitions {
        private final ResultPoint from;
        private final ResultPoint to;
        private final int transitions;

        private ResultPointsAndTransitions(ResultPoint from, ResultPoint to, int transitions) {
            this.from = from;
            this.to = to;
            this.transitions = transitions;
        }

        /* synthetic */ ResultPointsAndTransitions(ResultPoint resultPoint, ResultPoint resultPoint2, int i, ResultPointsAndTransitions resultPointsAndTransitions) {
            this(resultPoint, resultPoint2, i);
        }

        ResultPoint getFrom() {
            return this.from;
        }

        ResultPoint getTo() {
            return this.to;
        }

        public int getTransitions() {
            return this.transitions;
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(this.from);
            stringBuilder.append("/");
            stringBuilder.append(this.to);
            stringBuilder.append('/');
            stringBuilder.append(this.transitions);
            return stringBuilder.toString();
        }
    }

    private static final class ResultPointsAndTransitionsComparator implements Comparator<ResultPointsAndTransitions>, Serializable {
        private ResultPointsAndTransitionsComparator() {
        }

        /* synthetic */ ResultPointsAndTransitionsComparator(ResultPointsAndTransitionsComparator resultPointsAndTransitionsComparator) {
            this();
        }

        public int compare(ResultPointsAndTransitions o1, ResultPointsAndTransitions o2) {
            return o1.getTransitions() - o2.getTransitions();
        }
    }

    public Detector(BitMatrix image) throws NotFoundException {
        this.image = image;
        this.rectangleDetector = new WhiteRectangleDetector(image);
    }

    public DetectorResult detect() throws NotFoundException {
        Map<ResultPoint, Integer> map;
        ResultPointsAndTransitions resultPointsAndTransitions;
        ResultPointsAndTransitions resultPointsAndTransitions2;
        List<ResultPointsAndTransitions> list;
        ResultPoint resultPoint;
        ResultPoint[] resultPointArr;
        ResultPoint point;
        ResultPoint[] cornerPoints = this.rectangleDetector.detect();
        int i = 0;
        ResultPoint pointA = cornerPoints[0];
        ResultPoint pointB = cornerPoints[1];
        int i2 = 2;
        ResultPoint pointC = cornerPoints[2];
        int i3 = 3;
        ResultPoint pointD = cornerPoints[3];
        List<ResultPointsAndTransitions> transitions = new ArrayList(4);
        transitions.add(transitionsBetween(pointA, pointB));
        transitions.add(transitionsBetween(pointA, pointC));
        transitions.add(transitionsBetween(pointB, pointD));
        transitions.add(transitionsBetween(pointC, pointD));
        Collections.sort(transitions, new ResultPointsAndTransitionsComparator());
        ResultPointsAndTransitions lSideOne = (ResultPointsAndTransitions) transitions.get(0);
        ResultPointsAndTransitions lSideTwo = (ResultPointsAndTransitions) transitions.get(1);
        Map<ResultPoint, Integer> pointCount = new HashMap();
        increment(pointCount, lSideOne.getFrom());
        increment(pointCount, lSideOne.getTo());
        increment(pointCount, lSideTwo.getFrom());
        increment(pointCount, lSideTwo.getTo());
        ResultPoint maybeBottomRight = null;
        ResultPoint maybeTopLeft = null;
        ResultPoint bottomLeft = null;
        for (Entry pointCount2 : pointCount.entrySet()) {
            map = pointCount;
            resultPointsAndTransitions = lSideTwo;
            resultPointsAndTransitions2 = lSideOne;
            list = transitions;
            resultPoint = pointD;
            resultPointArr = cornerPoints;
            pointD = i;
            int i4 = i3;
            point = (ResultPoint) pointCount2.getKey();
            if (((Integer) pointCount2.getValue()).intValue() == 2) {
                bottomLeft = point;
            } else if (maybeTopLeft == null) {
                maybeTopLeft = point;
            } else {
                maybeBottomRight = point;
            }
            i2 = 2;
            i3 = i4;
            pointCount = map;
            lSideTwo = resultPointsAndTransitions;
            lSideOne = resultPointsAndTransitions2;
            transitions = list;
            cornerPoints = resultPointArr;
            i = pointD;
            pointD = resultPoint;
        }
        if (maybeTopLeft == null || bottomLeft == null || maybeBottomRight == null) {
            resultPointsAndTransitions = lSideTwo;
            resultPointsAndTransitions2 = lSideOne;
            list = transitions;
            resultPoint = pointD;
            resultPointArr = cornerPoints;
            throw NotFoundException.getNotFoundInstance();
        }
        ResultPoint topRight;
        ResultPoint topLeft;
        ResultPoint[] corners = new ResultPoint[i3];
        corners[i] = maybeTopLeft;
        corners[1] = bottomLeft;
        corners[i2] = maybeBottomRight;
        ResultPoint.orderBestPatterns(corners);
        ResultPoint bottomRight = corners[i];
        ResultPoint bottomLeft2 = corners[1];
        bottomLeft = corners[i2];
        if (!pointCount.containsKey(pointA)) {
            topRight = pointA;
        } else if (!pointCount.containsKey(pointB)) {
            topRight = pointB;
        } else if (pointCount.containsKey(pointC)) {
            topRight = pointD;
        } else {
            topRight = pointC;
        }
        ResultPoint topRight2 = topRight;
        i2 = transitionsBetween(bottomLeft, topRight2).getTransitions();
        int dimensionRight = transitionsBetween(bottomRight, topRight2).getTransitions();
        ResultPoint topLeft2 = bottomLeft;
        Map<ResultPoint, Integer> pointCount3 = pointCount;
        if ((i2 & 1) == 1) {
            i2++;
        }
        i2 += 2;
        if ((dimensionRight & 1) == 1) {
            dimensionRight++;
        }
        dimensionRight += 2;
        ResultPointsAndTransitions lSideTwo2 = lSideTwo;
        ResultPoint[] resultPointArr2;
        if (4 * i2 >= 7 * dimensionRight) {
            resultPointArr = cornerPoints;
            cornerPoints = 4;
            resultPointArr2 = corners;
            topLeft = topLeft2;
        } else if (4 * dimensionRight >= 7 * i2) {
            resultPointsAndTransitions2 = lSideOne;
            resultPointArr = cornerPoints;
            cornerPoints = 4;
            resultPointArr2 = corners;
            topLeft = topLeft2;
            map = pointCount3;
            resultPointsAndTransitions = lSideTwo2;
            list = transitions;
        } else {
            point = topLeft2;
            map = pointCount3;
            ResultPoint topLeft3 = point;
            resultPointsAndTransitions = lSideTwo2;
            list = transitions;
            cornerPoints = 4;
            bottomLeft = correctTopRight(bottomLeft2, bottomRight, topLeft3, topRight2, Math.min(dimensionRight, i2));
            if (bottomLeft == null) {
                bottomLeft = topRight2;
            }
            corners = topLeft3;
            pointCount = Math.max(transitionsBetween(corners, bottomLeft).getTransitions(), transitionsBetween(bottomRight, bottomLeft).getTransitions()) + 1;
            if ((pointCount & 1) == 1) {
                pointCount++;
            }
            pointCount = sampleGrid(this.image, corners, bottomLeft2, bottomRight, bottomLeft, pointCount, pointCount);
            cornerPoints = corners;
            resultPoint = pointD;
            int i5 = dimensionRight;
            return new DetectorResult(pointCount, new ResultPoint[]{cornerPoints, bottomLeft2, bottomRight, bottomLeft});
        }
        cornerPoints = topLeft;
        bottomLeft = correctTopRightRectangular(bottomLeft2, bottomRight, topLeft, topRight2, i2, dimensionRight);
        if (bottomLeft == null) {
            bottomLeft = topRight2;
        }
        pointCount = transitionsBetween(cornerPoints, bottomLeft).getTransitions();
        lSideTwo = transitionsBetween(bottomRight, bottomLeft).getTransitions();
        if ((pointCount & 1) == 1) {
            pointCount++;
        }
        if ((lSideTwo & 1) == 1) {
            lSideTwo++;
        }
        Map<ResultPoint, Integer> map2 = pointCount;
        pointCount = sampleGrid(this.image, cornerPoints, bottomLeft2, bottomRight, bottomLeft, pointCount, lSideTwo);
        return new DetectorResult(pointCount, new ResultPoint[]{cornerPoints, bottomLeft2, bottomRight, bottomLeft});
    }

    private ResultPoint correctTopRightRectangular(ResultPoint bottomLeft, ResultPoint bottomRight, ResultPoint topLeft, ResultPoint topRight, int dimensionTop, int dimensionRight) {
        float corr = ((float) distance(bottomLeft, bottomRight)) / ((float) dimensionTop);
        int norm = distance(topLeft, topRight);
        ResultPoint c1 = new ResultPoint(topRight.getX() + (corr * ((topRight.getX() - topLeft.getX()) / ((float) norm))), topRight.getY() + (corr * ((topRight.getY() - topLeft.getY()) / ((float) norm))));
        float corr2 = ((float) distance(bottomLeft, topLeft)) / ((float) dimensionRight);
        int norm2 = distance(bottomRight, topRight);
        ResultPoint c2 = new ResultPoint(topRight.getX() + (corr2 * ((topRight.getX() - bottomRight.getX()) / ((float) norm2))), topRight.getY() + (corr2 * ((topRight.getY() - bottomRight.getY()) / ((float) norm2))));
        if (isValid(c1)) {
            if (isValid(c2) && Math.abs(dimensionTop - transitionsBetween(topLeft, c1).getTransitions()) + Math.abs(dimensionRight - transitionsBetween(bottomRight, c1).getTransitions()) > Math.abs(dimensionTop - transitionsBetween(topLeft, c2).getTransitions()) + Math.abs(dimensionRight - transitionsBetween(bottomRight, c2).getTransitions())) {
                return c2;
            }
            return c1;
        } else if (isValid(c2)) {
            return c2;
        } else {
            return null;
        }
    }

    private ResultPoint correctTopRight(ResultPoint bottomLeft, ResultPoint bottomRight, ResultPoint topLeft, ResultPoint topRight, int dimension) {
        float corr = ((float) distance(bottomLeft, bottomRight)) / ((float) dimension);
        int norm = distance(topLeft, topRight);
        ResultPoint c1 = new ResultPoint(topRight.getX() + (corr * ((topRight.getX() - topLeft.getX()) / ((float) norm))), topRight.getY() + (corr * ((topRight.getY() - topLeft.getY()) / ((float) norm))));
        float corr2 = ((float) distance(bottomLeft, topLeft)) / ((float) dimension);
        int norm2 = distance(bottomRight, topRight);
        ResultPoint c2 = new ResultPoint(topRight.getX() + (corr2 * ((topRight.getX() - bottomRight.getX()) / ((float) norm2))), topRight.getY() + (corr2 * ((topRight.getY() - bottomRight.getY()) / ((float) norm2))));
        if (isValid(c1)) {
            if (!isValid(c2)) {
                return c1;
            }
            return Math.abs(transitionsBetween(topLeft, c1).getTransitions() - transitionsBetween(bottomRight, c1).getTransitions()) <= Math.abs(transitionsBetween(topLeft, c2).getTransitions() - transitionsBetween(bottomRight, c2).getTransitions()) ? c1 : c2;
        } else if (isValid(c2)) {
            return c2;
        } else {
            return null;
        }
    }

    private boolean isValid(ResultPoint p) {
        return p.getX() >= 0.0f && p.getX() < ((float) this.image.getWidth()) && p.getY() > 0.0f && p.getY() < ((float) this.image.getHeight());
    }

    private static int distance(ResultPoint a, ResultPoint b) {
        return MathUtils.round(ResultPoint.distance(a, b));
    }

    private static void increment(Map<ResultPoint, Integer> table, ResultPoint key) {
        Integer value = (Integer) table.get(key);
        int i = 1;
        if (value != null) {
            i = 1 + value.intValue();
        }
        table.put(key, Integer.valueOf(i));
    }

    private static BitMatrix sampleGrid(BitMatrix image, ResultPoint topLeft, ResultPoint bottomLeft, ResultPoint bottomRight, ResultPoint topRight, int dimensionX, int dimensionY) throws NotFoundException {
        int i = dimensionX;
        int i2 = dimensionY;
        return GridSampler.getInstance().sampleGrid(image, i, i2, 0.5f, 0.5f, ((float) i) - 0.5f, 0.5f, ((float) i) - 0.5f, ((float) i2) - 0.5f, 0.5f, ((float) i2) - 0.5f, topLeft.getX(), topLeft.getY(), topRight.getX(), topRight.getY(), bottomRight.getX(), bottomRight.getY(), bottomLeft.getX(), bottomLeft.getY());
    }

    private ResultPointsAndTransitions transitionsBetween(ResultPoint from, ResultPoint to) {
        int fromX;
        Detector detector = this;
        int fromX2 = (int) from.getX();
        boolean fromY = (int) from.getY();
        boolean toX = (int) to.getX();
        boolean toY = (int) to.getY();
        int xstep = 1;
        boolean steep = Math.abs(toY - fromY) > Math.abs(toX - fromX2);
        if (steep) {
            boolean temp = fromX2;
            fromX2 = fromY;
            fromY = temp;
            temp = toX;
            toX = toY;
            toY = temp;
        }
        int dx = Math.abs(toX - fromX2);
        int dy = Math.abs(toY - fromY);
        int error = (-dx) / 2;
        int ystep = fromY < toY ? 1 : -1;
        if (fromX2 >= toX) {
            xstep = -1;
        }
        int transitions = 0;
        boolean inBlack = detector.image.get(steep ? fromY : fromX2, steep ? fromX2 : fromY);
        boolean x = fromX2;
        int y = fromY;
        while (x != toX) {
            BitMatrix bitMatrix = detector.image;
            boolean isBlack = steep ? y : x;
            if (steep) {
                fromX = fromX2;
                fromX2 = x;
            } else {
                fromX = fromX2;
                fromX2 = y;
            }
            isBlack = bitMatrix.get(isBlack, fromX2);
            if (isBlack != inBlack) {
                transitions++;
                inBlack = isBlack;
            }
            error += dy;
            ResultPoint resultPoint;
            if (error <= 0) {
                resultPoint = from;
            } else if (y == toY) {
                break;
            } else {
                resultPoint = from;
                y += ystep;
                error -= dx;
            }
            x += xstep;
            fromX2 = fromX;
            detector = this;
        }
        fromX = fromX2;
        return new ResultPointsAndTransitions(from, to, transitions, null);
    }
}
