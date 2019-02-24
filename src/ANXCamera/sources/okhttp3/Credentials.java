package okhttp3;

import java.nio.charset.Charset;
import okhttp3.internal.Util;
import okio.ByteString;

public final class Credentials {
    private Credentials() {
    }

    public static String basic(String str, String str2) {
        return basic(str, str2, Util.ISO_8859_1);
    }

    public static String basic(String str, String str2, Charset charset) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(":");
        stringBuilder.append(str2);
        str = ByteString.encodeString(stringBuilder.toString(), charset).base64();
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("Basic ");
        stringBuilder2.append(str);
        return stringBuilder2.toString();
    }
}
