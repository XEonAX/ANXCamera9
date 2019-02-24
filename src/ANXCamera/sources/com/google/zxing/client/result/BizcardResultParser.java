package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.ArrayList;
import java.util.List;

public final class BizcardResultParser extends AbstractDoCoMoResultParser {
    public AddressBookParsedResult parse(Result result) {
        String rawText = ResultParser.getMassagedText(result);
        if (!rawText.startsWith("BIZCARD:")) {
            return null;
        }
        String fullName = buildName(AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("N:", rawText, true), AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("X:", rawText, true));
        String title = AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("T:", rawText, true);
        String org = AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("C:", rawText, true);
        String[] addresses = AbstractDoCoMoResultParser.matchDoCoMoPrefixedField("A:", rawText, true);
        String phoneNumber1 = AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("B:", rawText, true);
        String phoneNumber2 = AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("M:", rawText, true);
        String phoneNumber3 = AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("F:", rawText, true);
        return new AddressBookParsedResult(ResultParser.maybeWrap(fullName), null, null, buildPhoneNumbers(phoneNumber1, phoneNumber2, phoneNumber3), null, ResultParser.maybeWrap(AbstractDoCoMoResultParser.matchSingleDoCoMoPrefixedField("E:", rawText, true)), null, null, null, addresses, null, org, null, title, null, null);
    }

    private static String[] buildPhoneNumbers(String number1, String number2, String number3) {
        List<String> numbers = new ArrayList(3);
        if (number1 != null) {
            numbers.add(number1);
        }
        if (number2 != null) {
            numbers.add(number2);
        }
        if (number3 != null) {
            numbers.add(number3);
        }
        int size = numbers.size();
        if (size == 0) {
            return null;
        }
        return (String[]) numbers.toArray(new String[size]);
    }

    private static String buildName(String firstName, String lastName) {
        if (firstName == null) {
            return lastName;
        }
        String str;
        if (lastName == null) {
            str = firstName;
        } else {
            StringBuilder stringBuilder = new StringBuilder(String.valueOf(firstName));
            stringBuilder.append(' ');
            stringBuilder.append(lastName);
            str = stringBuilder.toString();
        }
        return str;
    }
}
