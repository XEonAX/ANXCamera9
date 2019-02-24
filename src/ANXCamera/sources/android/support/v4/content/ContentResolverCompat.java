package android.support.v4.content;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build.VERSION;
import android.support.v4.os.CancellationSignal;
import android.support.v4.os.OperationCanceledException;

public class ContentResolverCompat {
    private static final ContentResolverCompatImpl IMPL;

    interface ContentResolverCompatImpl {
        Cursor query(ContentResolver contentResolver, Uri uri, String[] strArr, String str, String[] strArr2, String str2, CancellationSignal cancellationSignal);
    }

    static class ContentResolverCompatImplBase implements ContentResolverCompatImpl {
        ContentResolverCompatImplBase() {
        }

        public Cursor query(ContentResolver resolver, Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder, CancellationSignal cancellationSignal) {
            if (cancellationSignal != null) {
                cancellationSignal.throwIfCanceled();
            }
            return resolver.query(uri, projection, selection, selectionArgs, sortOrder);
        }
    }

    static class ContentResolverCompatImplJB extends ContentResolverCompatImplBase {
        ContentResolverCompatImplJB() {
        }

        public Cursor query(ContentResolver resolver, Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder, CancellationSignal cancellationSignal) {
            RuntimeException e;
            if (cancellationSignal != null) {
                try {
                    e = cancellationSignal.getCancellationSignalObject();
                } catch (RuntimeException e2) {
                    if (ContentResolverCompatJellybean.isFrameworkOperationCanceledException(e2)) {
                        throw new OperationCanceledException();
                    }
                    throw e2;
                }
            }
            e2 = null;
            return ContentResolverCompatJellybean.query(resolver, uri, projection, selection, selectionArgs, sortOrder, e2);
        }
    }

    static {
        if (VERSION.SDK_INT >= 16) {
            IMPL = new ContentResolverCompatImplJB();
        } else {
            IMPL = new ContentResolverCompatImplBase();
        }
    }

    private ContentResolverCompat() {
    }

    public static Cursor query(ContentResolver resolver, Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder, CancellationSignal cancellationSignal) {
        return IMPL.query(resolver, uri, projection, selection, selectionArgs, sortOrder, cancellationSignal);
    }
}
