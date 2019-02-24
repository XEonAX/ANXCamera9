package com.android.volley.toolbox;

import com.android.volley.C0001AuthFailureError;
import com.android.volley.C0021Request;
import java.io.IOException;
import java.util.Map;
import org.apache.http.HttpResponse;

/* renamed from: com.android.volley.toolbox.HttpStack */
public interface C0043HttpStack {
    HttpResponse performRequest(C0021Request<?> c0021Request, Map<String, String> map) throws IOException, C0001AuthFailureError;
}
