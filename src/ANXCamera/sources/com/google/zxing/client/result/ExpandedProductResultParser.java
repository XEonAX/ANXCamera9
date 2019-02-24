package com.google.zxing.client.result;

import com.android.camera.constant.CameraScene;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import java.util.HashMap;
import java.util.Map;

public final class ExpandedProductResultParser extends ResultParser {
    public ExpandedProductParsedResult parse(Result result) {
        BarcodeFormat format = result.getBarcodeFormat();
        if (format != BarcodeFormat.RSS_EXPANDED) {
            return null;
        }
        String rawText = ResultParser.getMassagedText(result);
        Map<String, String> uncommonAIs = new HashMap();
        String productID = null;
        String sscc = null;
        String lotNumber = null;
        String productionDate = null;
        String packagingDate = null;
        String bestBeforeDate = null;
        String expirationDate = null;
        String weight = null;
        String weightType = null;
        String weightIncrement = null;
        String price = null;
        String priceIncrement = null;
        String priceCurrency = null;
        int i = 0;
        while (i < rawText.length()) {
            BarcodeFormat format2 = format;
            int i2 = i;
            String ai = findAIvalue(i2, rawText);
            if (ai == null) {
                return null;
            }
            i = i2 + (ai.length() + 2);
            String value = findValue(i, rawText);
            i += value.length();
            if (ai == "00") {
                sscc = value;
            } else if (ai == "01") {
                productID = value;
            } else if (ai == CameraScene.SUNSET) {
                lotNumber = value;
            } else if (ai == "11") {
                productionDate = value;
            } else if (ai == CameraScene.SPORTS) {
                packagingDate = value;
            } else if (ai == "15") {
                bestBeforeDate = value;
            } else if (ai == "17") {
                expirationDate = value;
            } else if (ai == "3100" || ai == "3101" || ai == "3102" || ai == "3103" || ai == "3104" || ai == "3105" || ai == "3106" || ai == "3107" || ai == "3108" || ai == "3109") {
                weight = value;
                weightType = ExpandedProductParsedResult.KILOGRAM;
                weightIncrement = ai.substring(3);
            } else if (ai == "3200" || ai == "3201" || ai == "3202" || ai == "3203" || ai == "3204" || ai == "3205" || ai == "3206" || ai == "3207" || ai == "3208" || ai == "3209") {
                weight = value;
                weightType = ExpandedProductParsedResult.POUND;
                weightIncrement = ai.substring(3);
            } else if (ai == "3920" || ai == "3921" || ai == "3922" || ai == "3923") {
                price = value;
                priceIncrement = ai.substring(3);
            } else if (ai != "3930" && ai != "3931" && ai != "3932" && ai != "3933") {
                uncommonAIs.put(ai, value);
            } else if (value.length() < 4) {
                return null;
            } else {
                price = value.substring(3);
                priceCurrency = value.substring(0, 3);
                priceIncrement = ai.substring(3);
            }
            format = format2;
        }
        format = i;
        return new ExpandedProductParsedResult(rawText, productID, sscc, lotNumber, productionDate, packagingDate, bestBeforeDate, expirationDate, weight, weightType, weightIncrement, price, priceIncrement, priceCurrency, uncommonAIs);
    }

    private static String findAIvalue(int i, String rawText) {
        if (rawText.charAt(i) != '(') {
            return null;
        }
        CharSequence rawTextAux = rawText.substring(i + 1);
        StringBuilder buf = new StringBuilder();
        for (int index = 0; index < rawTextAux.length(); index++) {
            char currentChar = rawTextAux.charAt(index);
            if (currentChar == ')') {
                return buf.toString();
            }
            if (currentChar < '0' || currentChar > '9') {
                return null;
            }
            buf.append(currentChar);
        }
        return buf.toString();
    }

    private static String findValue(int i, String rawText) {
        StringBuilder buf = new StringBuilder();
        String rawTextAux = rawText.substring(i);
        for (int index = 0; index < rawTextAux.length(); index++) {
            char c = rawTextAux.charAt(index);
            if (c == '(') {
                if (findAIvalue(index, rawTextAux) != null) {
                    break;
                }
                buf.append('(');
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    }
}
