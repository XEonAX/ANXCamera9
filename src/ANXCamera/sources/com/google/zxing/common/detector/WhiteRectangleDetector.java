package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;

public final class WhiteRectangleDetector {
    private static final int CORR = 1;
    private static final int INIT_SIZE = 10;
    private final int downInit;
    private final int height;
    private final BitMatrix image;
    private final int leftInit;
    private final int rightInit;
    private final int upInit;
    private final int width;

    public WhiteRectangleDetector(BitMatrix image) throws NotFoundException {
        this(image, 10, image.getWidth() / 2, image.getHeight() / 2);
    }

    public WhiteRectangleDetector(BitMatrix image, int initSize, int x, int y) throws NotFoundException {
        this.image = image;
        this.height = image.getHeight();
        this.width = image.getWidth();
        int halfsize = initSize / 2;
        this.leftInit = x - halfsize;
        this.rightInit = x + halfsize;
        this.upInit = y - halfsize;
        this.downInit = y + halfsize;
        if (this.upInit < 0 || this.leftInit < 0 || this.downInit >= this.height || this.rightInit >= this.width) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    public ResultPoint[] detect() throws NotFoundException {
        boolean rightBorderNotWhite;
        boolean atLeastOneBlackPointFoundOnBorder;
        boolean bottomBorderNotWhite;
        boolean leftBorderNotWhite;
        int left = this.leftInit;
        int right = this.rightInit;
        int up = this.upInit;
        int down = this.downInit;
        boolean sizeExceeded = false;
        boolean aBlackPointFoundOnBorder = true;
        boolean atLeastOneBlackPointFoundOnBorder2 = false;
        boolean atLeastOneBlackPointFoundOnRight = false;
        boolean atLeastOneBlackPointFoundOnBottom = false;
        boolean atLeastOneBlackPointFoundOnLeft = false;
        boolean atLeastOneBlackPointFoundOnTop = false;
        while (aBlackPointFoundOnBorder) {
            aBlackPointFoundOnBorder = false;
            rightBorderNotWhite = true;
            while (true) {
                if ((rightBorderNotWhite || !atLeastOneBlackPointFoundOnRight) && right < this.width) {
                    atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder2;
                    rightBorderNotWhite = containsBlackPoint(up, down, right, false);
                    if (rightBorderNotWhite) {
                        right++;
                        aBlackPointFoundOnBorder = true;
                        atLeastOneBlackPointFoundOnRight = true;
                    } else if (!atLeastOneBlackPointFoundOnRight) {
                        right++;
                    }
                    atLeastOneBlackPointFoundOnBorder2 = atLeastOneBlackPointFoundOnBorder;
                }
            }
            if (right >= this.width) {
                sizeExceeded = true;
                break;
            }
            bottomBorderNotWhite = true;
            while (true) {
                if ((bottomBorderNotWhite || !atLeastOneBlackPointFoundOnBottom) && down < this.height) {
                    atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder2;
                    bottomBorderNotWhite = containsBlackPoint(left, right, down, true);
                    if (bottomBorderNotWhite) {
                        down++;
                        aBlackPointFoundOnBorder = true;
                        atLeastOneBlackPointFoundOnBottom = true;
                    } else if (!atLeastOneBlackPointFoundOnBottom) {
                        down++;
                    }
                    atLeastOneBlackPointFoundOnBorder2 = atLeastOneBlackPointFoundOnBorder;
                }
            }
            if (down >= this.height) {
                sizeExceeded = true;
                break;
            }
            leftBorderNotWhite = true;
            while (true) {
                if ((leftBorderNotWhite || !atLeastOneBlackPointFoundOnLeft) && left >= 0) {
                    atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder2;
                    leftBorderNotWhite = containsBlackPoint(up, down, left, false);
                    if (leftBorderNotWhite) {
                        left--;
                        aBlackPointFoundOnBorder = true;
                        atLeastOneBlackPointFoundOnLeft = true;
                    } else if (!atLeastOneBlackPointFoundOnLeft) {
                        left--;
                    }
                    atLeastOneBlackPointFoundOnBorder2 = atLeastOneBlackPointFoundOnBorder;
                }
            }
            if (left < 0) {
                sizeExceeded = true;
                break;
            }
            boolean topBorderNotWhite = true;
            while (true) {
                if ((topBorderNotWhite || !atLeastOneBlackPointFoundOnTop) && up >= 0) {
                    atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder2;
                    topBorderNotWhite = containsBlackPoint(left, right, up, true);
                    if (topBorderNotWhite) {
                        up--;
                        aBlackPointFoundOnBorder = true;
                        atLeastOneBlackPointFoundOnTop = true;
                    } else if (!atLeastOneBlackPointFoundOnTop) {
                        up--;
                    }
                    atLeastOneBlackPointFoundOnBorder2 = atLeastOneBlackPointFoundOnBorder;
                }
            }
            if (up < 0) {
                sizeExceeded = true;
                break;
            }
            atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder2;
            if (aBlackPointFoundOnBorder) {
                atLeastOneBlackPointFoundOnBorder2 = true;
            } else {
                atLeastOneBlackPointFoundOnBorder2 = atLeastOneBlackPointFoundOnBorder;
            }
        }
        int i;
        int i2;
        boolean z;
        boolean z2;
        if (sizeExceeded || !atLeastOneBlackPointFoundOnBorder2) {
            i = right;
            i2 = up;
            z = sizeExceeded;
            z2 = aBlackPointFoundOnBorder;
            atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder2;
            throw NotFoundException.getNotFoundInstance();
        }
        rightBorderNotWhite = right - left;
        leftBorderNotWhite = null;
        bottomBorderNotWhite = true;
        while (bottomBorderNotWhite < rightBorderNotWhite) {
            z = sizeExceeded;
            z2 = aBlackPointFoundOnBorder;
            atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder2;
            leftBorderNotWhite = getBlackPointOnSegment((float) left, (float) (down - bottomBorderNotWhite), (float) (left + bottomBorderNotWhite), (float) down);
            if (leftBorderNotWhite) {
                break;
            }
            i = right;
            i2 = up;
            bottomBorderNotWhite++;
            sizeExceeded = z;
            aBlackPointFoundOnBorder = z2;
            atLeastOneBlackPointFoundOnBorder2 = atLeastOneBlackPointFoundOnBorder;
        }
        z = sizeExceeded;
        z2 = aBlackPointFoundOnBorder;
        atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder2;
        if (leftBorderNotWhite) {
            int left2;
            ResultPoint t = null;
            aBlackPointFoundOnBorder = true;
            while (aBlackPointFoundOnBorder < rightBorderNotWhite) {
                left2 = left;
                t = getBlackPointOnSegment((float) left, (float) (up + aBlackPointFoundOnBorder), (float) (left + aBlackPointFoundOnBorder), (float) up);
                if (t != null) {
                    break;
                }
                i2 = up;
                aBlackPointFoundOnBorder++;
                left = left2;
            }
            left2 = left;
            if (t != null) {
                left = 0;
                for (aBlackPointFoundOnBorder = true; aBlackPointFoundOnBorder < rightBorderNotWhite; aBlackPointFoundOnBorder++) {
                    ResultPoint x = left;
                    left = getBlackPointOnSegment((float) right, (float) (up + aBlackPointFoundOnBorder), (float) (right - aBlackPointFoundOnBorder), (float) up);
                    if (left != 0) {
                        break;
                    }
                    i2 = up;
                }
                if (left != 0) {
                    int i3 = null;
                    atLeastOneBlackPointFoundOnBorder2 = true;
                    while (atLeastOneBlackPointFoundOnBorder2 < rightBorderNotWhite) {
                        i2 = up;
                        i = right;
                        i3 = getBlackPointOnSegment((float) right, (float) (down - atLeastOneBlackPointFoundOnBorder2), (float) (right - atLeastOneBlackPointFoundOnBorder2), (float) down);
                        if (i3 != 0) {
                            break;
                        }
                        atLeastOneBlackPointFoundOnBorder2++;
                        up = i2;
                        right = i;
                    }
                    i = right;
                    i2 = up;
                    if (i3 != 0) {
                        return centerEdges(i3, leftBorderNotWhite, left, t);
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
                i2 = up;
                throw NotFoundException.getNotFoundInstance();
            }
            i2 = up;
            throw NotFoundException.getNotFoundInstance();
        }
        i = right;
        i2 = up;
        throw NotFoundException.getNotFoundInstance();
    }

    private ResultPoint getBlackPointOnSegment(float aX, float aY, float bX, float bY) {
        int dist = MathUtils.round(MathUtils.distance(aX, aY, bX, bY));
        float xStep = (bX - aX) / ((float) dist);
        float yStep = (bY - aY) / ((float) dist);
        for (int i = 0; i < dist; i++) {
            int x = MathUtils.round((((float) i) * xStep) + aX);
            int y = MathUtils.round((((float) i) * yStep) + aY);
            if (this.image.get(x, y)) {
                return new ResultPoint((float) x, (float) y);
            }
        }
        return null;
    }

    private ResultPoint[] centerEdges(ResultPoint y, ResultPoint z, ResultPoint x, ResultPoint t) {
        float yi = y.getX();
        float yj = y.getY();
        float zi = z.getX();
        float zj = z.getY();
        float xi = x.getX();
        float xj = x.getY();
        float ti = t.getX();
        float tj = t.getY();
        if (yi < ((float) this.width) / 2.0f) {
            return new ResultPoint[]{new ResultPoint(ti - 1.0f, tj + 1.0f), new ResultPoint(zi + 1.0f, zj + 1.0f), new ResultPoint(xi - 1.0f, xj - 1.0f), new ResultPoint(yi + 1.0f, yj - 1.0f)};
        }
        return new ResultPoint[]{new ResultPoint(ti + 1.0f, tj + 1.0f), new ResultPoint(zi + 1.0f, zj - 1.0f), new ResultPoint(xi - 1.0f, xj + 1.0f), new ResultPoint(yi - 1.0f, yj - 1.0f)};
    }

    private boolean containsBlackPoint(int a, int b, int fixed, boolean horizontal) {
        int x;
        if (horizontal) {
            for (x = a; x <= b; x++) {
                if (this.image.get(x, fixed)) {
                    return true;
                }
            }
        } else {
            for (x = a; x <= b; x++) {
                if (this.image.get(fixed, x)) {
                    return true;
                }
            }
        }
        return false;
    }
}
