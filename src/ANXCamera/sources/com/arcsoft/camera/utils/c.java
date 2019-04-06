package com.arcsoft.camera.utils;

import android.content.Context;
import android.database.sqlite.SQLiteFullException;
import android.media.MediaScannerConnection;
import android.media.MediaScannerConnection.MediaScannerConnectionClient;
import android.net.Uri;
import java.util.ArrayList;
import java.util.List;

/* compiled from: MediaUriManager */
public class c implements MediaScannerConnectionClient {
    private static final int c = 100;
    private Context a;
    private String e;
    private MediaScannerConnection eS;
    private List<Uri> ej = new ArrayList();

    public c(Context context) {
        this.a = context;
        this.eS = new MediaScannerConnection(this.a, this);
    }

    public Uri R() {
        return this.ej.isEmpty() ? null : (Uri) this.ej.get(0);
    }

    public List<Uri> S() {
        return this.ej;
    }

    public void a(Uri uri) {
        if (uri != null) {
            this.ej.add(uri);
        }
    }

    public void a(List<Uri> list) {
        if (list != null && !list.isEmpty()) {
            this.ej.addAll(list);
        }
    }

    public boolean isEmpty() {
        return this.ej == null || this.ej.isEmpty();
    }

    public void k(String str) {
        this.e = str;
        this.eS.connect();
    }

    public void onMediaScannerConnected() {
        try {
            this.eS.scanFile(this.e, null);
        } catch (SQLiteFullException e) {
        }
    }

    public void onScanCompleted(String str, Uri uri) {
        try {
            if (this.ej.size() > 100) {
                this.ej.remove(this.ej.size() - 1);
            }
            this.ej.add(0, uri);
        } finally {
            this.eS.disconnect();
        }
    }

    public void release() {
        if (this.eS != null && this.eS.isConnected()) {
            this.eS.disconnect();
        }
    }
}
