package com.google.zxing.client.result;

public final class SMSParsedResult extends ParsedResult {
    private final String body;
    private final String[] numbers;
    private final String subject;
    private final String[] vias;

    public SMSParsedResult(String number, String via, String subject, String body) {
        super(ParsedResultType.SMS);
        this.numbers = new String[]{number};
        this.vias = new String[]{via};
        this.subject = subject;
        this.body = body;
    }

    public SMSParsedResult(String[] numbers, String[] vias, String subject, String body) {
        super(ParsedResultType.SMS);
        this.numbers = numbers;
        this.vias = vias;
        this.subject = subject;
        this.body = body;
    }

    public String getSMSURI() {
        StringBuilder result = new StringBuilder();
        result.append("sms:");
        boolean first = true;
        int i = 0;
        while (i < this.numbers.length) {
            if (first) {
                first = false;
            } else {
                result.append(',');
            }
            result.append(this.numbers[i]);
            if (!(this.vias == null || this.vias[i] == null)) {
                result.append(";via=");
                result.append(this.vias[i]);
            }
            i++;
        }
        boolean hasSubject = false;
        i = this.body != null ? 1 : 0;
        if (this.subject != null) {
            hasSubject = true;
        }
        if (i != 0 || hasSubject) {
            result.append('?');
            if (i != 0) {
                result.append("body=");
                result.append(this.body);
            }
            if (hasSubject) {
                if (i != 0) {
                    result.append('&');
                }
                result.append("subject=");
                result.append(this.subject);
            }
        }
        return result.toString();
    }

    public String[] getNumbers() {
        return this.numbers;
    }

    public String[] getVias() {
        return this.vias;
    }

    public String getSubject() {
        return this.subject;
    }

    public String getBody() {
        return this.body;
    }

    public String getDisplayResult() {
        StringBuilder result = new StringBuilder(100);
        ParsedResult.maybeAppend(this.numbers, result);
        ParsedResult.maybeAppend(this.subject, result);
        ParsedResult.maybeAppend(this.body, result);
        return result.toString();
    }
}
