package com.google.zxing.multi;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public final class GenericMultipleBarcodeReader implements MultipleBarcodeReader {
    private static final int MAX_DEPTH = 4;
    private static final int MIN_DIMENSION_TO_RECUR = 100;
    private final Reader delegate;

    public GenericMultipleBarcodeReader(Reader delegate) {
        this.delegate = delegate;
    }

    public Result[] decodeMultiple(BinaryBitmap image) throws NotFoundException {
        return decodeMultiple(image, null);
    }

    public Result[] decodeMultiple(BinaryBitmap image, Map<DecodeHintType, ?> hints) throws NotFoundException {
        List<Result> results = new ArrayList();
        doDecodeMultiple(image, hints, results, 0, 0, 0);
        if (!results.isEmpty()) {
            return (Result[]) results.toArray(new Result[results.size()]);
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private void doDecodeMultiple(BinaryBitmap image, Map<DecodeHintType, ?> hints, List<Result> results, int xOffset, int yOffset, int currentDepth) {
        BinaryBitmap binaryBitmap = image;
        int i = xOffset;
        int i2 = yOffset;
        int i3 = currentDepth;
        if (i3 <= 4) {
            Map<DecodeHintType, ?> map;
            List<Result> list;
            try {
                map = hints;
                try {
                    List list2;
                    Result result = this.delegate.decode(binaryBitmap, map);
                    boolean alreadyFound = false;
                    for (Result existingResult : results) {
                        if (existingResult.getText().equals(result.getText())) {
                            alreadyFound = true;
                            break;
                        }
                        list = results;
                    }
                    boolean alreadyFound2 = alreadyFound;
                    if (alreadyFound2) {
                        list2 = results;
                    } else {
                        list2 = results;
                        list2.add(translateResultPoints(result, i, i2));
                    }
                    ResultPoint[] resultPoints = result.getResultPoints();
                    ResultPoint[] resultPointArr;
                    boolean z;
                    if (resultPoints == null) {
                        resultPointArr = resultPoints;
                        z = alreadyFound2;
                    } else if (resultPoints.length == 0) {
                        Result result2 = result;
                        resultPointArr = resultPoints;
                        z = alreadyFound2;
                    } else {
                        int maxX;
                        float minX;
                        int height;
                        float minY;
                        int width;
                        int width2;
                        int width3 = image.getWidth();
                        int height2 = image.getHeight();
                        float minX2 = (float) width3;
                        float minY2 = (float) height2;
                        boolean length = resultPoints.length;
                        int alreadyFound3 = 0;
                        float maxY = 0.0f;
                        float minX3 = minX2;
                        alreadyFound = false;
                        float minY3 = minY2;
                        int maxX2 = 0;
                        while (alreadyFound < length) {
                            float minX4;
                            float minY4;
                            maxX = maxX2;
                            float minY5 = minY3;
                            minX = minX3;
                            height = height2;
                            resultPointArr = resultPoints;
                            maxX2 = alreadyFound3;
                            alreadyFound3 = width3;
                            ResultPoint point = resultPointArr[alreadyFound];
                            int x = point.getX();
                            float y = point.getY();
                            if (x < minX) {
                                minX4 = x;
                            } else {
                                minX4 = minX;
                            }
                            if (y < minY5) {
                                minY4 = y;
                            } else {
                                minY4 = minY5;
                            }
                            if (x > maxX) {
                                maxX = x;
                            }
                            if (y > maxY) {
                                maxY = y;
                            }
                            alreadyFound++;
                            minX3 = minX4;
                            minY3 = minY4;
                            width3 = alreadyFound3;
                            height2 = height;
                            resultPoints = resultPointArr;
                            alreadyFound3 = maxX2;
                            maxX2 = maxX;
                        }
                        if (minX3 > 100.0f) {
                            BinaryBitmap crop = binaryBitmap.crop(alreadyFound3, alreadyFound3, (int) minX3, height2);
                            height = maxX2;
                            minY = minY3;
                            maxX = height2;
                            width = width3;
                            doDecodeMultiple(crop, map, list2, i, i2, i3 + 1);
                        } else {
                            height = maxX2;
                            minY = minY3;
                            minX = minX3;
                            maxX = height2;
                            width = width3;
                            resultPointArr = resultPoints;
                        }
                        if (minY > 100.0f) {
                            width2 = width;
                            alreadyFound3 = width2;
                            doDecodeMultiple(binaryBitmap.crop(0, 0, width2, (int) minY), map, list2, i, i2, i3 + 1);
                        } else {
                            alreadyFound3 = width;
                        }
                        width2 = height;
                        if (width2 < ((float) (alreadyFound3 - 100))) {
                            height2 = maxX;
                            height = height2;
                            maxX = width2;
                            doDecodeMultiple(binaryBitmap.crop((int) width2, 0, alreadyFound3 - ((int) width2), height2), map, list2, ((int) width2) + i, i2, i3 + 1);
                        } else {
                            height = maxX;
                        }
                        resultPoints = maxY;
                        if (resultPoints < ((float) (height - 100))) {
                            ResultPoint[] resultPointArr2 = resultPoints;
                            doDecodeMultiple(binaryBitmap.crop(0, (int) resultPoints, alreadyFound3, height - ((int) resultPoints)), map, list2, i, i2 + ((int) resultPoints), i3 + 1);
                        } else {
                            maxY = resultPoints;
                        }
                    }
                } catch (ReaderException e) {
                    list = results;
                }
            } catch (ReaderException e2) {
                map = hints;
                list = results;
            }
        }
    }

    private static Result translateResultPoints(Result result, int xOffset, int yOffset) {
        ResultPoint[] oldResultPoints = result.getResultPoints();
        if (oldResultPoints == null) {
            return result;
        }
        int i;
        ResultPoint[] newResultPoints = new ResultPoint[oldResultPoints.length];
        for (i = 0; i < oldResultPoints.length; i++) {
            ResultPoint oldPoint = oldResultPoints[i];
            newResultPoints[i] = new ResultPoint(oldPoint.getX() + ((float) xOffset), oldPoint.getY() + ((float) yOffset));
        }
        i = new Result(result.getText(), result.getRawBytes(), newResultPoints, result.getBarcodeFormat());
        i.putAllMetadata(result.getResultMetadata());
        return i;
    }
}
