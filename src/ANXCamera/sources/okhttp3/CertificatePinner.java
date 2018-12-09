package okhttp3;

import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.Nullable;
import javax.net.ssl.SSLPeerUnverifiedException;
import okhttp3.internal.Util;
import okhttp3.internal.tls.CertificateChainCleaner;
import okio.ByteString;

public final class CertificatePinner {
    public static final CertificatePinner DEFAULT = new Builder().build();
    @Nullable
    private final CertificateChainCleaner certificateChainCleaner;
    private final Set<Pin> pins;

    public static final class Builder {
        private final List<Pin> pins = new ArrayList();

        public Builder add(String str, String... strArr) {
            if (str != null) {
                for (String pin : strArr) {
                    this.pins.add(new Pin(str, pin));
                }
                return this;
            }
            throw new NullPointerException("pattern == null");
        }

        public CertificatePinner build() {
            return new CertificatePinner(new LinkedHashSet(this.pins), null);
        }
    }

    static final class Pin {
        private static final String WILDCARD = "*.";
        final String canonicalHostname;
        final ByteString hash;
        final String hashAlgorithm;
        final String pattern;

        Pin(String str, String str2) {
            StringBuilder stringBuilder;
            this.pattern = str;
            if (str.startsWith(WILDCARD)) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("http://");
                stringBuilder.append(str.substring(WILDCARD.length()));
                str = HttpUrl.parse(stringBuilder.toString()).host();
            } else {
                stringBuilder = new StringBuilder();
                stringBuilder.append("http://");
                stringBuilder.append(str);
                str = HttpUrl.parse(stringBuilder.toString()).host();
            }
            this.canonicalHostname = str;
            if (str2.startsWith("sha1/")) {
                this.hashAlgorithm = "sha1/";
                this.hash = ByteString.decodeBase64(str2.substring("sha1/".length()));
            } else if (str2.startsWith("sha256/")) {
                this.hashAlgorithm = "sha256/";
                this.hash = ByteString.decodeBase64(str2.substring("sha256/".length()));
            } else {
                stringBuilder = new StringBuilder();
                stringBuilder.append("pins must start with 'sha256/' or 'sha1/': ");
                stringBuilder.append(str2);
                throw new IllegalArgumentException(stringBuilder.toString());
            }
            if (this.hash == null) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("pins must be base64: ");
                stringBuilder.append(str2);
                throw new IllegalArgumentException(stringBuilder.toString());
            }
        }

        /* JADX WARNING: Missing block: B:5:0x0030, code:
            if (r11.regionMatches(false, r0 + 1, r10.canonicalHostname, 0, r10.canonicalHostname.length()) != false) goto L_0x0034;
     */
        boolean matches(java.lang.String r11) {
            /*
            r10 = this;
            r0 = r10.pattern;
            r1 = "*.";
            r0 = r0.startsWith(r1);
            if (r0 == 0) goto L_0x0035;
        L_0x000a:
            r0 = 46;
            r0 = r11.indexOf(r0);
            r1 = r11.length();
            r1 = r1 - r0;
            r2 = 1;
            r1 = r1 - r2;
            r3 = r10.canonicalHostname;
            r3 = r3.length();
            if (r1 != r3) goto L_0x0033;
        L_0x001f:
            r5 = 0;
            r6 = r0 + 1;
            r7 = r10.canonicalHostname;
            r8 = 0;
            r0 = r10.canonicalHostname;
            r9 = r0.length();
            r4 = r11;
            r11 = r4.regionMatches(r5, r6, r7, r8, r9);
            if (r11 == 0) goto L_0x0033;
        L_0x0032:
            goto L_0x0034;
        L_0x0033:
            r2 = 0;
        L_0x0034:
            return r2;
        L_0x0035:
            r0 = r10.canonicalHostname;
            r11 = r11.equals(r0);
            return r11;
            */
            throw new UnsupportedOperationException("Method not decompiled: okhttp3.CertificatePinner.Pin.matches(java.lang.String):boolean");
        }

        public boolean equals(Object obj) {
            if (obj instanceof Pin) {
                Pin pin = (Pin) obj;
                if (this.pattern.equals(pin.pattern) && this.hashAlgorithm.equals(pin.hashAlgorithm) && this.hash.equals(pin.hash)) {
                    return true;
                }
            }
            return false;
        }

        public int hashCode() {
            return (31 * (((527 + this.pattern.hashCode()) * 31) + this.hashAlgorithm.hashCode())) + this.hash.hashCode();
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(this.hashAlgorithm);
            stringBuilder.append(this.hash.base64());
            return stringBuilder.toString();
        }
    }

    CertificatePinner(Set<Pin> set, @Nullable CertificateChainCleaner certificateChainCleaner) {
        this.pins = set;
        this.certificateChainCleaner = certificateChainCleaner;
    }

    /* JADX WARNING: Missing block: B:8:0x001c, code:
            if (r3.pins.equals(r4.pins) != false) goto L_0x0020;
     */
    public boolean equals(@javax.annotation.Nullable java.lang.Object r4) {
        /*
        r3 = this;
        r0 = 1;
        if (r4 != r3) goto L_0x0004;
    L_0x0003:
        return r0;
    L_0x0004:
        r1 = r4 instanceof okhttp3.CertificatePinner;
        if (r1 == 0) goto L_0x001f;
    L_0x0008:
        r1 = r3.certificateChainCleaner;
        r4 = (okhttp3.CertificatePinner) r4;
        r2 = r4.certificateChainCleaner;
        r1 = okhttp3.internal.Util.equal(r1, r2);
        if (r1 == 0) goto L_0x001f;
    L_0x0014:
        r1 = r3.pins;
        r4 = r4.pins;
        r4 = r1.equals(r4);
        if (r4 == 0) goto L_0x001f;
    L_0x001e:
        goto L_0x0020;
    L_0x001f:
        r0 = 0;
    L_0x0020:
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.CertificatePinner.equals(java.lang.Object):boolean");
    }

    public int hashCode() {
        return (31 * (this.certificateChainCleaner != null ? this.certificateChainCleaner.hashCode() : 0)) + this.pins.hashCode();
    }

    public void check(String str, List<Certificate> list) throws SSLPeerUnverifiedException {
        List findMatchingPins = findMatchingPins(str);
        if (!findMatchingPins.isEmpty()) {
            List list2;
            int i;
            if (this.certificateChainCleaner != null) {
                list2 = this.certificateChainCleaner.clean(list2, str);
            }
            int size = list2.size();
            int i2 = 0;
            for (i = 0; i < size; i++) {
                X509Certificate x509Certificate = (X509Certificate) list2.get(i);
                int size2 = findMatchingPins.size();
                Object obj = null;
                Object obj2 = obj;
                for (int i3 = 0; i3 < size2; i3++) {
                    Pin pin = (Pin) findMatchingPins.get(i3);
                    if (pin.hashAlgorithm.equals("sha256/")) {
                        if (obj == null) {
                            obj = sha256(x509Certificate);
                        }
                        if (pin.hash.equals(obj)) {
                            return;
                        }
                    } else if (pin.hashAlgorithm.equals("sha1/")) {
                        if (obj2 == null) {
                            obj2 = sha1(x509Certificate);
                        }
                        if (pin.hash.equals(obj2)) {
                            return;
                        }
                    } else {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("unsupported hashAlgorithm: ");
                        stringBuilder.append(pin.hashAlgorithm);
                        throw new AssertionError(stringBuilder.toString());
                    }
                }
            }
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Certificate pinning failure!");
            stringBuilder2.append("\n  Peer certificate chain:");
            i = list2.size();
            for (int i4 = 0; i4 < i; i4++) {
                X509Certificate x509Certificate2 = (X509Certificate) list2.get(i4);
                stringBuilder2.append("\n    ");
                stringBuilder2.append(pin(x509Certificate2));
                stringBuilder2.append(": ");
                stringBuilder2.append(x509Certificate2.getSubjectDN().getName());
            }
            stringBuilder2.append("\n  Pinned certificates for ");
            stringBuilder2.append(str);
            stringBuilder2.append(":");
            int size3 = findMatchingPins.size();
            while (i2 < size3) {
                Pin pin2 = (Pin) findMatchingPins.get(i2);
                stringBuilder2.append("\n    ");
                stringBuilder2.append(pin2);
                i2++;
            }
            throw new SSLPeerUnverifiedException(stringBuilder2.toString());
        }
    }

    public void check(String str, Certificate... certificateArr) throws SSLPeerUnverifiedException {
        check(str, Arrays.asList(certificateArr));
    }

    List<Pin> findMatchingPins(String str) {
        List<Pin> emptyList = Collections.emptyList();
        for (Pin pin : this.pins) {
            if (pin.matches(str)) {
                if (emptyList.isEmpty()) {
                    emptyList = new ArrayList();
                }
                emptyList.add(pin);
            }
        }
        return emptyList;
    }

    CertificatePinner withCertificateChainCleaner(@Nullable CertificateChainCleaner certificateChainCleaner) {
        if (Util.equal(this.certificateChainCleaner, certificateChainCleaner)) {
            return this;
        }
        return new CertificatePinner(this.pins, certificateChainCleaner);
    }

    public static String pin(Certificate certificate) {
        if (certificate instanceof X509Certificate) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("sha256/");
            stringBuilder.append(sha256((X509Certificate) certificate).base64());
            return stringBuilder.toString();
        }
        throw new IllegalArgumentException("Certificate pinning requires X509 certificates");
    }

    static ByteString sha1(X509Certificate x509Certificate) {
        return ByteString.of(x509Certificate.getPublicKey().getEncoded()).sha1();
    }

    static ByteString sha256(X509Certificate x509Certificate) {
        return ByteString.of(x509Certificate.getPublicKey().getEncoded()).sha256();
    }
}
