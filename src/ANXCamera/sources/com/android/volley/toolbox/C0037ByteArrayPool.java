package com.android.volley.toolbox;

import com.android.volley.toolbox.ByteArrayPool.C00361;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* renamed from: com.android.volley.toolbox.ByteArrayPool */
public class C0037ByteArrayPool {
    protected static final Comparator<byte[]> BUF_COMPARATOR = new C00361();
    private List<byte[]> mBuffersByLastUse;
    private List<byte[]> mBuffersBySize;
    private int mCurrentSize;
    private final int mSizeLimit;

    public C0037ByteArrayPool(int sizeLimit) {
        this.mSizeLimit = sizeLimit;
    }

    public synchronized byte[] getBuf(int len) {
        for (int i = 0; i < this.mBuffersBySize.size(); i++) {
            byte[] buf = (byte[]) this.mBuffersBySize.get(i);
            if (buf.length >= len) {
                this.mCurrentSize -= buf.length;
                this.mBuffersBySize.remove(i);
                this.mBuffersByLastUse.remove(buf);
                return buf;
            }
        }
        return new byte[len];
    }

    /* JADX WARNING: Missing block: B:15:0x002f, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void returnBuf(byte[] buf) {
        if (buf != null) {
            if (buf.length <= this.mSizeLimit) {
                this.mBuffersByLastUse.add(buf);
                int pos = Collections.binarySearch(this.mBuffersBySize, buf, BUF_COMPARATOR);
                if (pos < 0) {
                    pos = (-pos) - 1;
                }
                this.mBuffersBySize.add(pos, buf);
                this.mCurrentSize += buf.length;
                trim();
            }
        }
    }

    private synchronized void trim() {
        while (this.mCurrentSize > this.mSizeLimit) {
            byte[] buf = (byte[]) this.mBuffersByLastUse.remove(0);
            this.mBuffersBySize.remove(buf);
            this.mCurrentSize -= buf.length;
        }
    }
}
