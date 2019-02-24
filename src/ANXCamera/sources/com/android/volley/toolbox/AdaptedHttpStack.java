package com.android.volley.toolbox;

import com.android.volley.C0001AuthFailureError;
import com.android.volley.C0021Request;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.conn.ConnectTimeoutException;

class AdaptedHttpStack extends BaseHttpStack {
    private final C0043HttpStack mHttpStack;

    AdaptedHttpStack(C0043HttpStack c0043HttpStack) {
        this.mHttpStack = c0043HttpStack;
    }

    public HttpResponse executeRequest(C0021Request<?> c0021Request, Map<String, String> map) throws IOException, C0001AuthFailureError {
        try {
            HttpResponse performRequest = this.mHttpStack.performRequest(c0021Request, map);
            int statusCode = performRequest.getStatusLine().getStatusCode();
            Header[] allHeaders = performRequest.getAllHeaders();
            List arrayList = new ArrayList(allHeaders.length);
            for (Header header : allHeaders) {
                arrayList.add(new com.android.volley.Header(header.getName(), header.getValue()));
            }
            if (performRequest.getEntity() == null) {
                return new HttpResponse(statusCode, arrayList);
            }
            long contentLength = performRequest.getEntity().getContentLength();
            if (((long) ((int) contentLength)) == contentLength) {
                return new HttpResponse(statusCode, arrayList, (int) performRequest.getEntity().getContentLength(), performRequest.getEntity().getContent());
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Response too large: ");
            stringBuilder.append(contentLength);
            throw new IOException(stringBuilder.toString());
        } catch (ConnectTimeoutException e) {
            throw new SocketTimeoutException(e.getMessage());
        }
    }
}
