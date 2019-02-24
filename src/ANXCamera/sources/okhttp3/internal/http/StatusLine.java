package okhttp3.internal.http;

import java.io.IOException;
import java.net.ProtocolException;
import okhttp3.Protocol;
import okhttp3.Response;

public final class StatusLine {
    public static final int HTTP_CONTINUE = 100;
    public static final int HTTP_PERM_REDIRECT = 308;
    public static final int HTTP_TEMP_REDIRECT = 307;
    public final int code;
    public final String message;
    public final Protocol protocol;

    public StatusLine(Protocol protocol, int i, String str) {
        this.protocol = protocol;
        this.code = i;
        this.message = str;
    }

    public static StatusLine get(Response response) {
        return new StatusLine(response.protocol(), response.code(), response.message());
    }

    public static StatusLine parse(String str) throws IOException {
        StringBuilder stringBuilder;
        Protocol protocol;
        int i = 9;
        if (str.startsWith("HTTP/1.")) {
            if (str.length() < 9 || str.charAt(8) != ' ') {
                stringBuilder = new StringBuilder();
                stringBuilder.append("Unexpected status line: ");
                stringBuilder.append(str);
                throw new ProtocolException(stringBuilder.toString());
            }
            int charAt = str.charAt(7) - 48;
            if (charAt == 0) {
                protocol = Protocol.HTTP_1_0;
            } else if (charAt == 1) {
                protocol = Protocol.HTTP_1_1;
            } else {
                stringBuilder = new StringBuilder();
                stringBuilder.append("Unexpected status line: ");
                stringBuilder.append(str);
                throw new ProtocolException(stringBuilder.toString());
            }
        } else if (str.startsWith("ICY ")) {
            protocol = Protocol.HTTP_1_0;
            i = 4;
        } else {
            stringBuilder = new StringBuilder();
            stringBuilder.append("Unexpected status line: ");
            stringBuilder.append(str);
            throw new ProtocolException(stringBuilder.toString());
        }
        int i2 = i + 3;
        if (str.length() >= i2) {
            try {
                int parseInt = Integer.parseInt(str.substring(i, i2));
                String str2 = "";
                if (str.length() > i2) {
                    if (str.charAt(i2) == ' ') {
                        str2 = str.substring(i + 4);
                    } else {
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("Unexpected status line: ");
                        stringBuilder.append(str);
                        throw new ProtocolException(stringBuilder.toString());
                    }
                }
                return new StatusLine(protocol, parseInt, str2);
            } catch (NumberFormatException e) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("Unexpected status line: ");
                stringBuilder.append(str);
                throw new ProtocolException(stringBuilder.toString());
            }
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append("Unexpected status line: ");
        stringBuilder.append(str);
        throw new ProtocolException(stringBuilder.toString());
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.protocol == Protocol.HTTP_1_0 ? "HTTP/1.0" : "HTTP/1.1");
        stringBuilder.append(' ');
        stringBuilder.append(this.code);
        if (this.message != null) {
            stringBuilder.append(' ');
            stringBuilder.append(this.message);
        }
        return stringBuilder.toString();
    }
}
