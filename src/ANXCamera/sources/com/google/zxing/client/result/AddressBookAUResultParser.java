package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.ArrayList;
import java.util.List;

public final class AddressBookAUResultParser extends ResultParser {
    public AddressBookParsedResult parse(Result result) {
        String rawText = ResultParser.getMassagedText(result);
        AddressBookParsedResult addressBookParsedResult = null;
        if (!rawText.contains("MEMORY") || !rawText.contains("\r\n")) {
            return null;
        }
        String name = ResultParser.matchSinglePrefixedField("NAME1:", rawText, 13, true);
        String pronunciation = ResultParser.matchSinglePrefixedField("NAME2:", rawText, 13, true);
        String[] phoneNumbers = matchMultipleValuePrefix("TEL", 3, rawText, true);
        String[] emails = matchMultipleValuePrefix("MAIL", 3, rawText, true);
        String note = ResultParser.matchSinglePrefixedField("MEMORY:", rawText, 13, false);
        if (ResultParser.matchSinglePrefixedField("ADD:", rawText, 13, true) != null) {
            addressBookParsedResult = new String[]{ResultParser.matchSinglePrefixedField("ADD:", rawText, 13, true)};
        }
        return new AddressBookParsedResult(ResultParser.maybeWrap(name), null, pronunciation, phoneNumbers, null, emails, null, null, note, addressBookParsedResult, null, null, null, null, null, null);
    }

    private static String[] matchMultipleValuePrefix(String prefix, int max, String rawText, boolean trim) {
        List<String> values = null;
        for (int i = 1; i <= max; i++) {
            StringBuilder stringBuilder = new StringBuilder(String.valueOf(prefix));
            stringBuilder.append(i);
            stringBuilder.append(':');
            String value = ResultParser.matchSinglePrefixedField(stringBuilder.toString(), rawText, 13, trim);
            if (value == null) {
                break;
            }
            if (values == null) {
                values = new ArrayList(max);
            }
            values.add(value);
        }
        if (values == null) {
            return null;
        }
        return (String[]) values.toArray(new String[values.size()]);
    }
}
