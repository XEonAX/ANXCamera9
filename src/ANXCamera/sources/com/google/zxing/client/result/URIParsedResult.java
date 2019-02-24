package com.google.zxing.client.result;

import java.util.regex.Pattern;

public final class URIParsedResult extends ParsedResult {
    private static final Pattern USER_IN_HOST = Pattern.compile(":/*([^/@]+)@[^/]+");
    private final String title;
    private final String uri;

    public URIParsedResult(String uri, String title) {
        super(ParsedResultType.URI);
        this.uri = massageURI(uri);
        this.title = title;
    }

    public String getURI() {
        return this.uri;
    }

    public String getTitle() {
        return this.title;
    }

    public boolean isPossiblyMaliciousURI() {
        return USER_IN_HOST.matcher(this.uri).find();
    }

    public String getDisplayResult() {
        StringBuilder result = new StringBuilder(30);
        ParsedResult.maybeAppend(this.title, result);
        ParsedResult.maybeAppend(this.uri, result);
        return result.toString();
    }

    private static String massageURI(String uri) {
        uri = uri.trim();
        int protocolEnd = uri.indexOf(58);
        StringBuilder stringBuilder;
        if (protocolEnd < 0) {
            stringBuilder = new StringBuilder("http://");
            stringBuilder.append(uri);
            return stringBuilder.toString();
        } else if (!isColonFollowedByPortNumber(uri, protocolEnd)) {
            return uri;
        } else {
            stringBuilder = new StringBuilder("http://");
            stringBuilder.append(uri);
            return stringBuilder.toString();
        }
    }

    private static boolean isColonFollowedByPortNumber(String uri, int protocolEnd) {
        int start = protocolEnd + 1;
        int nextSlash = uri.indexOf(47, start);
        if (nextSlash < 0) {
            nextSlash = uri.length();
        }
        return ResultParser.isSubstringOfDigits(uri, start, nextSlash - start);
    }
}
