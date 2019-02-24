package com.android.volley.toolbox;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import com.android.volley.C0007DefaultRetryPolicy;
import com.android.volley.C0015NetworkResponse;
import com.android.volley.C0017ParseError;
import com.android.volley.C0021Request;
import com.android.volley.C0027Response;
import com.android.volley.C0032VolleyLog;
import com.android.volley.Request.C0020Priority;
import com.android.volley.Response.C0025ErrorListener;
import com.android.volley.Response.C0026Listener;

/* renamed from: com.android.volley.toolbox.ImageRequest */
public class C0057ImageRequest extends C0021Request<Bitmap> {
    private static final float IMAGE_BACKOFF_MULT = 2.0f;
    private static final int IMAGE_MAX_RETRIES = 2;
    private static final int IMAGE_TIMEOUT_MS = 1000;
    private static final Object sDecodeLock = new Object();
    private final Config mDecodeConfig;
    private final C0026Listener<Bitmap> mListener;
    private final int mMaxHeight;
    private final int mMaxWidth;

    public C0057ImageRequest(String url, C0026Listener<Bitmap> listener, int maxWidth, int maxHeight, Config decodeConfig, C0025ErrorListener errorListener) {
        super(0, url, errorListener);
        setRetryPolicy(new C0007DefaultRetryPolicy(1000, 2, 2.0f));
        this.mListener = listener;
        this.mDecodeConfig = decodeConfig;
        this.mMaxWidth = maxWidth;
        this.mMaxHeight = maxHeight;
    }

    public C0020Priority getPriority() {
        return C0020Priority.LOW;
    }

    private static int getResizedDimension(int maxPrimary, int maxSecondary, int actualPrimary, int actualSecondary) {
        if (maxPrimary == 0 && maxSecondary == 0) {
            return actualPrimary;
        }
        if (maxPrimary == 0) {
            return (int) (((double) actualPrimary) * (((double) maxSecondary) / ((double) actualSecondary)));
        } else if (maxSecondary == 0) {
            return maxPrimary;
        } else {
            double ratio = ((double) actualSecondary) / ((double) actualPrimary);
            int resized = maxPrimary;
            if (((double) resized) * ratio > ((double) maxSecondary)) {
                resized = (int) (((double) maxSecondary) / ratio);
            }
            return resized;
        }
    }

    protected C0027Response<Bitmap> parseNetworkResponse(C0015NetworkResponse response) {
        C0027Response<Bitmap> doParse;
        synchronized (sDecodeLock) {
            try {
                doParse = doParse(response);
            } catch (Throwable e) {
                C0032VolleyLog.e("Caught OOM for %d byte image, url=%s", Integer.valueOf(response.data.length), getUrl());
                return C0027Response.error(new C0017ParseError(e));
            }
        }
        return doParse;
    }

    private C0027Response<Bitmap> doParse(C0015NetworkResponse response) {
        Bitmap bitmap;
        byte[] data = response.data;
        Options decodeOptions = new Options();
        if (this.mMaxWidth == 0 && this.mMaxHeight == 0) {
            decodeOptions.inPreferredConfig = this.mDecodeConfig;
            bitmap = BitmapFactory.decodeByteArray(data, 0, data.length, decodeOptions);
        } else {
            decodeOptions.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(data, 0, data.length, decodeOptions);
            int actualWidth = decodeOptions.outWidth;
            int actualHeight = decodeOptions.outHeight;
            int desiredWidth = C0057ImageRequest.getResizedDimension(this.mMaxWidth, this.mMaxHeight, actualWidth, actualHeight);
            int desiredHeight = C0057ImageRequest.getResizedDimension(this.mMaxHeight, this.mMaxWidth, actualHeight, actualWidth);
            decodeOptions.inJustDecodeBounds = false;
            decodeOptions.inSampleSize = C0057ImageRequest.findBestSampleSize(actualWidth, actualHeight, desiredWidth, desiredHeight);
            Bitmap tempBitmap = BitmapFactory.decodeByteArray(data, 0, data.length, decodeOptions);
            if (tempBitmap == null || (tempBitmap.getWidth() <= desiredWidth && tempBitmap.getHeight() <= desiredHeight)) {
                bitmap = tempBitmap;
            } else {
                bitmap = Bitmap.createScaledBitmap(tempBitmap, desiredWidth, desiredHeight, true);
                tempBitmap.recycle();
            }
        }
        if (bitmap == null) {
            return C0027Response.error(new C0017ParseError(response));
        }
        return C0027Response.success(bitmap, C0045HttpHeaderParser.parseCacheHeaders(response));
    }

    protected void deliverResponse(Bitmap response) {
        this.mListener.onResponse(response);
    }

    static int findBestSampleSize(int actualWidth, int actualHeight, int desiredWidth, int desiredHeight) {
        float n = 1.0f;
        while (((double) (n * 2.0f)) <= Math.min(((double) actualWidth) / ((double) desiredWidth), ((double) actualHeight) / ((double) desiredHeight))) {
            n *= 2.0f;
        }
        return (int) n;
    }
}
