package com.android.volley.toolbox;

import com.android.volley.C0001AuthFailureError;
import com.android.volley.C0021Request;
import com.android.volley.Header;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.message.BasicStatusLine;

public abstract class BaseHttpStack implements C0043HttpStack {
    public abstract HttpResponse executeRequest(C0021Request<?> c0021Request, Map<String, String> map) throws IOException, C0001AuthFailureError;

    @Deprecated
    public final HttpResponse performRequest(C0021Request<?> c0021Request, Map<String, String> map) throws IOException, C0001AuthFailureError {
        HttpResponse executeRequest = executeRequest(c0021Request, map);
        HttpResponse basicHttpResponse = new BasicHttpResponse(new BasicStatusLine(new ProtocolVersion("HTTP", 1, 1), executeRequest.getStatusCode(), ""));
        List arrayList = new ArrayList();
        for (Header header : executeRequest.getHeaders()) {
            arrayList.add(new BasicHeader(header.getName(), header.getValue()));
        }
        basicHttpResponse.setHeaders((org.apache.http.Header[]) arrayList.toArray(new org.apache.http.Header[arrayList.size()]));
        InputStream content = executeRequest.getContent();
        if (content != null) {
            HttpEntity basicHttpEntity = new BasicHttpEntity();
            basicHttpEntity.setContent(content);
            basicHttpEntity.setContentLength((long) executeRequest.getContentLength());
            basicHttpResponse.setEntity(basicHttpEntity);
        }
        return basicHttpResponse;
    }
}
