package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: LazyHeaders */
public final class j implements h {
    private final Map<String, List<i>> headers;
    private volatile Map<String, String> jf;

    /* compiled from: LazyHeaders */
    public static final class a {
        private static final String jg = "User-Agent";
        private static final String jh = getSanitizedUserAgent();
        private static final Map<String, List<i>> ji;
        private Map<String, List<i>> headers = ji;
        private boolean jj = true;
        private boolean jk = true;

        static {
            Map hashMap = new HashMap(2);
            if (!TextUtils.isEmpty(jh)) {
                hashMap.put("User-Agent", Collections.singletonList(new b(jh)));
            }
            ji = Collections.unmodifiableMap(hashMap);
        }

        public a a(String str, String str2) {
            return a(str, new b(str2));
        }

        public a a(String str, i iVar) {
            if (this.jk && "User-Agent".equalsIgnoreCase(str)) {
                return b(str, iVar);
            }
            bY();
            o(str).add(iVar);
            return this;
        }

        public a b(String str, String str2) {
            return b(str, str2 == null ? null : new b(str2));
        }

        public a b(String str, i iVar) {
            bY();
            if (iVar == null) {
                this.headers.remove(str);
            } else {
                List o = o(str);
                o.clear();
                o.add(iVar);
            }
            if (this.jk && "User-Agent".equalsIgnoreCase(str)) {
                this.jk = false;
            }
            return this;
        }

        private List<i> o(String str) {
            List<i> list = (List) this.headers.get(str);
            if (list != null) {
                return list;
            }
            List arrayList = new ArrayList();
            this.headers.put(str, arrayList);
            return arrayList;
        }

        private void bY() {
            if (this.jj) {
                this.jj = false;
                this.headers = ca();
            }
        }

        public j bZ() {
            this.jj = true;
            return new j(this.headers);
        }

        private Map<String, List<i>> ca() {
            Map<String, List<i>> hashMap = new HashMap(this.headers.size());
            for (Entry entry : this.headers.entrySet()) {
                hashMap.put(entry.getKey(), new ArrayList((Collection) entry.getValue()));
            }
            return hashMap;
        }

        @VisibleForTesting
        static String getSanitizedUserAgent() {
            String property = System.getProperty("http.agent");
            if (TextUtils.isEmpty(property)) {
                return property;
            }
            int length = property.length();
            StringBuilder stringBuilder = new StringBuilder(property.length());
            for (int i = 0; i < length; i++) {
                char charAt = property.charAt(i);
                if ((charAt > 31 || charAt == 9) && charAt < 127) {
                    stringBuilder.append(charAt);
                } else {
                    stringBuilder.append('?');
                }
            }
            return stringBuilder.toString();
        }
    }

    /* compiled from: LazyHeaders */
    static final class b implements i {
        private final String value;

        b(String str) {
            this.value = str;
        }

        public String bW() {
            return this.value;
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("StringHeaderFactory{value='");
            stringBuilder.append(this.value);
            stringBuilder.append('\'');
            stringBuilder.append('}');
            return stringBuilder.toString();
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof b)) {
                return false;
            }
            return this.value.equals(((b) obj).value);
        }

        public int hashCode() {
            return this.value.hashCode();
        }
    }

    j(Map<String, List<i>> map) {
        this.headers = Collections.unmodifiableMap(map);
    }

    public Map<String, String> getHeaders() {
        if (this.jf == null) {
            synchronized (this) {
                if (this.jf == null) {
                    this.jf = Collections.unmodifiableMap(bX());
                }
            }
        }
        return this.jf;
    }

    private Map<String, String> bX() {
        Map<String, String> hashMap = new HashMap();
        for (Entry entry : this.headers.entrySet()) {
            CharSequence b = b((List) entry.getValue());
            if (!TextUtils.isEmpty(b)) {
                hashMap.put(entry.getKey(), b);
            }
        }
        return hashMap;
    }

    @NonNull
    private String b(@NonNull List<i> list) {
        StringBuilder stringBuilder = new StringBuilder();
        int size = list.size();
        for (int i = 0; i < size; i++) {
            Object bW = ((i) list.get(i)).bW();
            if (!TextUtils.isEmpty(bW)) {
                stringBuilder.append(bW);
                if (i != list.size() - 1) {
                    stringBuilder.append(',');
                }
            }
        }
        return stringBuilder.toString();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LazyHeaders{headers=");
        stringBuilder.append(this.headers);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof j)) {
            return false;
        }
        return this.headers.equals(((j) obj).headers);
    }

    public int hashCode() {
        return this.headers.hashCode();
    }
}
