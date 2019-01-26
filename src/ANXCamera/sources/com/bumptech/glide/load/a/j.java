package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.text.TextUtils;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.HttpException;
import com.bumptech.glide.load.model.g;
import com.bumptech.glide.util.e;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: HttpUrlFetcher */
public class j implements d<InputStream> {
    @VisibleForTesting
    static final b DEFAULT_CONNECTION_FACTORY = new a();
    private static final String TAG = "HttpUrlFetcher";
    private static final int dj = 5;
    private static final int dk = -1;
    private final g dl;
    private final b dm;
    /* renamed from: do */
    private InputStream f1do;
    private volatile boolean dp;
    private final int timeout;
    private HttpURLConnection urlConnection;

    /* compiled from: HttpUrlFetcher */
    interface b {
        HttpURLConnection c(URL url) throws IOException;
    }

    /* compiled from: HttpUrlFetcher */
    private static class a implements b {
        a() {
        }

        public HttpURLConnection c(URL url) throws IOException {
            return (HttpURLConnection) url.openConnection();
        }
    }

    public j(g gVar, int i) {
        this(gVar, i, DEFAULT_CONNECTION_FACTORY);
    }

    @VisibleForTesting
    j(g gVar, int i, b bVar) {
        this.dl = gVar;
        this.timeout = i;
        this.dm = bVar;
    }

    public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super InputStream> aVar) {
        long eE = e.eE();
        String str;
        StringBuilder stringBuilder;
        try {
            aVar.i(a(this.dl.toURL(), 0, null, this.dl.getHeaders()));
            if (Log.isLoggable(TAG, 2)) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Finished http url fetcher fetch in ");
                stringBuilder.append(e.e(eE));
                Log.v(str, stringBuilder.toString());
            }
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to load data for url", e);
            }
            aVar.b(e);
            if (Log.isLoggable(TAG, 2)) {
                str = TAG;
                stringBuilder = new StringBuilder();
            }
        } catch (Throwable th) {
            if (Log.isLoggable(TAG, 2)) {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Finished http url fetcher fetch in ");
                stringBuilder2.append(e.e(eE));
                Log.v(TAG, stringBuilder2.toString());
            }
        }
    }

    private InputStream a(URL url, int i, URL url2, Map<String, String> map) throws IOException {
        if (i < 5) {
            if (url2 != null) {
                try {
                    if (url.toURI().equals(url2.toURI())) {
                        throw new HttpException("In re-direct loop");
                    }
                } catch (URISyntaxException e) {
                }
            }
            this.urlConnection = this.dm.c(url);
            for (Entry entry : map.entrySet()) {
                this.urlConnection.addRequestProperty((String) entry.getKey(), (String) entry.getValue());
            }
            this.urlConnection.setConnectTimeout(this.timeout);
            this.urlConnection.setReadTimeout(this.timeout);
            this.urlConnection.setUseCaches(false);
            this.urlConnection.setDoInput(true);
            this.urlConnection.setInstanceFollowRedirects(false);
            this.urlConnection.connect();
            this.f1do = this.urlConnection.getInputStream();
            if (this.dp) {
                return null;
            }
            int responseCode = this.urlConnection.getResponseCode();
            if (l(responseCode)) {
                return a(this.urlConnection);
            }
            if (m(responseCode)) {
                Object headerField = this.urlConnection.getHeaderField(HttpRequest.HEADER_LOCATION);
                if (TextUtils.isEmpty(headerField)) {
                    throw new HttpException("Received empty or null redirect url");
                }
                URL url3 = new URL(url, headerField);
                cleanup();
                return a(url3, i + 1, url, map);
            } else if (responseCode == -1) {
                throw new HttpException(responseCode);
            } else {
                throw new HttpException(this.urlConnection.getResponseMessage(), responseCode);
            }
        }
        throw new HttpException("Too many (> 5) redirects!");
    }

    private static boolean l(int i) {
        return i / 100 == 2;
    }

    private static boolean m(int i) {
        return i / 100 == 3;
    }

    private InputStream a(HttpURLConnection httpURLConnection) throws IOException {
        if (TextUtils.isEmpty(httpURLConnection.getContentEncoding())) {
            this.f1do = com.bumptech.glide.util.b.a(httpURLConnection.getInputStream(), (long) httpURLConnection.getContentLength());
        } else {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Got non empty content encoding: ");
                stringBuilder.append(httpURLConnection.getContentEncoding());
                Log.d(str, stringBuilder.toString());
            }
            this.f1do = httpURLConnection.getInputStream();
        }
        return this.f1do;
    }

    public void cleanup() {
        if (this.f1do != null) {
            try {
                this.f1do.close();
            } catch (IOException e) {
            }
        }
        if (this.urlConnection != null) {
            this.urlConnection.disconnect();
        }
        this.urlConnection = null;
    }

    public void cancel() {
        this.dp = true;
    }

    @NonNull
    public Class<InputStream> ad() {
        return InputStream.class;
    }

    @NonNull
    public DataSource ae() {
        return DataSource.REMOTE;
    }
}
