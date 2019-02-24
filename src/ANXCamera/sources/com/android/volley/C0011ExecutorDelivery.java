package com.android.volley;

import android.os.Handler;
import com.android.volley.ExecutorDelivery.C0009ResponseDeliveryRunnable;
import java.util.concurrent.Executor;

/* renamed from: com.android.volley.ExecutorDelivery */
public class C0011ExecutorDelivery implements C0010ResponseDelivery {
    private final Executor mResponsePoster;

    public C0011ExecutorDelivery(Handler handler) {
        this.mResponsePoster = /* anonymous class already generated */;
    }

    public C0011ExecutorDelivery(Executor executor) {
        this.mResponsePoster = executor;
    }

    public void postResponse(C0021Request<?> request, C0027Response<?> response) {
        postResponse(request, response, null);
    }

    public void postResponse(C0021Request<?> request, C0027Response<?> response, Runnable runnable) {
        request.markDelivered();
        request.addMarker("post-response");
        this.mResponsePoster.execute(new C0009ResponseDeliveryRunnable(this, request, response, runnable));
    }

    public void postError(C0021Request<?> request, C0000VolleyError error) {
        request.addMarker("post-error");
        this.mResponsePoster.execute(new C0009ResponseDeliveryRunnable(this, request, C0027Response.error(error), null));
    }
}
