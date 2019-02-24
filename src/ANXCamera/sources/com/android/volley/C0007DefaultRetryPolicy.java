package com.android.volley;

/* renamed from: com.android.volley.DefaultRetryPolicy */
public class C0007DefaultRetryPolicy implements C0006RetryPolicy {
    public static final float DEFAULT_BACKOFF_MULT = 1.0f;
    public static final int DEFAULT_MAX_RETRIES = 1;
    public static final int DEFAULT_TIMEOUT_MS = 2500;
    private final float mBackoffMultiplier;
    private int mCurrentRetryCount;
    private int mCurrentTimeoutMs;
    private final int mMaxNumRetries;

    public C0007DefaultRetryPolicy() {
        this(2500, 1, 1.0f);
    }

    public C0007DefaultRetryPolicy(int initialTimeoutMs, int maxNumRetries, float backoffMultiplier) {
        this.mCurrentTimeoutMs = initialTimeoutMs;
        this.mMaxNumRetries = maxNumRetries;
        this.mBackoffMultiplier = backoffMultiplier;
    }

    public int getCurrentTimeout() {
        return this.mCurrentTimeoutMs;
    }

    public int getCurrentRetryCount() {
        return this.mCurrentRetryCount;
    }

    public void retry(C0000VolleyError error) throws C0000VolleyError {
        this.mCurrentRetryCount++;
        this.mCurrentTimeoutMs = (int) (((float) this.mCurrentTimeoutMs) + (((float) this.mCurrentTimeoutMs) * this.mBackoffMultiplier));
        if (!hasAttemptRemaining()) {
            throw error;
        }
    }

    protected boolean hasAttemptRemaining() {
        return this.mCurrentRetryCount <= this.mMaxNumRetries;
    }
}
