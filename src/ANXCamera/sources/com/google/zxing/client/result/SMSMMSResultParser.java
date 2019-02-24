package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public final class SMSMMSResultParser extends ResultParser {
    public SMSParsedResult parse(Result result) {
        String rawText = ResultParser.getMassagedText(result);
        if (!rawText.startsWith("sms:") && !rawText.startsWith("SMS:") && !rawText.startsWith("mms:") && !rawText.startsWith("MMS:")) {
            return null;
        }
        String smsURIWithoutQuery;
        Map<String, String> nameValuePairs = ResultParser.parseNameValuePairs(rawText);
        String subject = null;
        String body = null;
        boolean querySyntax = false;
        if (!(nameValuePairs == null || nameValuePairs.isEmpty())) {
            subject = (String) nameValuePairs.get("subject");
            body = (String) nameValuePairs.get("body");
            querySyntax = true;
        }
        int queryStart = rawText.indexOf(63, 4);
        if (queryStart < 0 || !querySyntax) {
            smsURIWithoutQuery = rawText.substring(4);
        } else {
            smsURIWithoutQuery = rawText.substring(4, queryStart);
        }
        int lastComma = -1;
        List<String> numbers = new ArrayList(1);
        ArrayList vias = new ArrayList(1);
        while (true) {
            int indexOf = smsURIWithoutQuery.indexOf(44, lastComma + 1);
            int comma = indexOf;
            if (indexOf <= lastComma) {
                addNumberVia(numbers, vias, smsURIWithoutQuery.substring(lastComma + 1));
                return new SMSParsedResult((String[]) numbers.toArray(new String[numbers.size()]), (String[]) vias.toArray(new String[vias.size()]), subject, body);
            }
            addNumberVia(numbers, vias, smsURIWithoutQuery.substring(lastComma + 1, comma));
            lastComma = comma;
        }
    }

    private static void addNumberVia(Collection<String> numbers, Collection<String> vias, String numberPart) {
        int numberEnd = numberPart.indexOf(59);
        String via = null;
        if (numberEnd < 0) {
            numbers.add(numberPart);
            vias.add(null);
            return;
        }
        numbers.add(numberPart.substring(0, numberEnd));
        String maybeVia = numberPart.substring(numberEnd + 1);
        if (maybeVia.startsWith("via=")) {
            via = maybeVia.substring(4);
        }
        vias.add(via);
    }
}
