package com.google.zxing.client.result;

import com.google.zxing.Result;

public final class AddressBookDoCoMoResultParser extends AbstractDoCoMoResultParser {
    public AddressBookParsedResult parse(Result result) {
        String rawText = ResultParser.getMassagedText(result);
        if (!rawText.startsWith("MECARD:")) {
            return null;
        }
        String[] rawName = AbstractDoCoMoResultParser.matchDoCoMoPrefixedField("N:", rawText, true);
        if (rawName == null) {
            return null;
        }
        String name = parseName(rawName[0]);
        String pronunciation = AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("SOUND:", rawText, true);
        String[] phoneNumbers = AbstractDoCoMoResultParser.matchDoCoMoPrefixedField("TEL:", rawText, true);
        String[] emails = AbstractDoCoMoResultParser.matchDoCoMoPrefixedField("EMAIL:", rawText, true);
        String note = AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("NOTE:", rawText, false);
        String[] addresses = AbstractDoCoMoResultParser.matchDoCoMoPrefixedField("ADR:", rawText, true);
        String birthday = AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("BDAY:", rawText, true);
        if (!ResultParser.isStringOfDigits(birthday, 8)) {
            birthday = null;
        }
        String birthday2 = birthday;
        String[] urls = AbstractDoCoMoResultParser.matchDoCoMoPrefixedField("URL:", rawText, true);
        return new AddressBookParsedResult(ResultParser.maybeWrap(name), null, pronunciation, phoneNumbers, null, emails, null, null, note, addresses, null, AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("ORG:", rawText, true), birthday2, null, urls, null);
    }

    private static String parseName(String name) {
        int comma = name.indexOf(44);
        if (comma < 0) {
            return name;
        }
        StringBuilder stringBuilder = new StringBuilder(String.valueOf(name.substring(comma + 1)));
        stringBuilder.append(' ');
        stringBuilder.append(name.substring(0, comma));
        return stringBuilder.toString();
    }
}
