package com.android.volley.toolbox;

import com.android.volley.C0001AuthFailureError;
import com.android.volley.C0021Request;
import com.android.volley.toolbox.HttpClientStack.C0042HttpPatch;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpOptions;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpTrace;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

/* renamed from: com.android.volley.toolbox.HttpClientStack */
public class C0044HttpClientStack implements C0043HttpStack {
    private static final String HEADER_CONTENT_TYPE = "Content-Type";
    protected final HttpClient mClient;

    public C0044HttpClientStack(HttpClient client) {
        this.mClient = client;
    }

    private static void addHeaders(HttpUriRequest httpRequest, Map<String, String> headers) {
        for (String key : headers.keySet()) {
            httpRequest.setHeader(key, (String) headers.get(key));
        }
    }

    private static List<NameValuePair> getPostParameterPairs(Map<String, String> postParams) {
        List<NameValuePair> result = new ArrayList(postParams.size());
        for (String key : postParams.keySet()) {
            result.add(new BasicNameValuePair(key, (String) postParams.get(key)));
        }
        return result;
    }

    public HttpResponse performRequest(C0021Request<?> request, Map<String, String> additionalHeaders) throws IOException, C0001AuthFailureError {
        HttpUriRequest httpRequest = C0044HttpClientStack.createHttpRequest(request, additionalHeaders);
        C0044HttpClientStack.addHeaders(httpRequest, additionalHeaders);
        C0044HttpClientStack.addHeaders(httpRequest, request.getHeaders());
        onPrepareRequest(httpRequest);
        HttpParams httpParams = httpRequest.getParams();
        int timeoutMs = request.getTimeoutMs();
        HttpConnectionParams.setConnectionTimeout(httpParams, 5000);
        HttpConnectionParams.setSoTimeout(httpParams, timeoutMs);
        return this.mClient.execute(httpRequest);
    }

    static HttpUriRequest createHttpRequest(C0021Request<?> request, Map<String, String> map) throws C0001AuthFailureError {
        switch (request.getMethod()) {
            case -1:
                byte[] postBody = request.getPostBody();
                if (postBody == null) {
                    return new HttpGet(request.getUrl());
                }
                HttpPost postRequest = new HttpPost(request.getUrl());
                postRequest.addHeader("Content-Type", request.getPostBodyContentType());
                postRequest.setEntity(new ByteArrayEntity(postBody));
                return postRequest;
            case 0:
                return new HttpGet(request.getUrl());
            case 1:
                HttpPost postRequest2 = new HttpPost(request.getUrl());
                postRequest2.addHeader("Content-Type", request.getBodyContentType());
                C0044HttpClientStack.setEntityIfNonEmptyBody(postRequest2, request);
                return postRequest2;
            case 2:
                HttpPut putRequest = new HttpPut(request.getUrl());
                putRequest.addHeader("Content-Type", request.getBodyContentType());
                C0044HttpClientStack.setEntityIfNonEmptyBody(putRequest, request);
                return putRequest;
            case 3:
                return new HttpDelete(request.getUrl());
            case 4:
                return new HttpHead(request.getUrl());
            case 5:
                return new HttpOptions(request.getUrl());
            case 6:
                return new HttpTrace(request.getUrl());
            case 7:
                C0042HttpPatch patchRequest = new C0042HttpPatch(request.getUrl());
                patchRequest.addHeader("Content-Type", request.getBodyContentType());
                C0044HttpClientStack.setEntityIfNonEmptyBody(patchRequest, request);
                return patchRequest;
            default:
                throw new IllegalStateException("Unknown request method.");
        }
    }

    private static void setEntityIfNonEmptyBody(HttpEntityEnclosingRequestBase httpRequest, C0021Request<?> request) throws C0001AuthFailureError {
        byte[] body = request.getBody();
        if (body != null) {
            httpRequest.setEntity(new ByteArrayEntity(body));
        }
    }

    protected void onPrepareRequest(HttpUriRequest request) throws IOException {
    }
}
