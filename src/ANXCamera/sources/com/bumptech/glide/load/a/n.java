package com.bumptech.glide.load.a;

import android.content.ContentResolver;
import android.content.UriMatcher;
import android.net.Uri;
import android.provider.ContactsContract.Contacts;
import android.support.annotation.NonNull;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: StreamLocalUriFetcher */
public class n extends l<InputStream> {
    private static final int dA = 4;
    private static final int dB = 5;
    private static final UriMatcher dC = new UriMatcher(-1);
    private static final int dx = 1;
    private static final int dy = 2;
    private static final int dz = 3;

    static {
        dC.addURI("com.android.contacts", "contacts/lookup/*/#", 1);
        dC.addURI("com.android.contacts", "contacts/lookup/*", 1);
        dC.addURI("com.android.contacts", "contacts/#/photo", 2);
        dC.addURI("com.android.contacts", "contacts/#", 3);
        dC.addURI("com.android.contacts", "contacts/#/display_photo", 4);
        dC.addURI("com.android.contacts", "phone_lookup/*", 5);
    }

    public n(ContentResolver contentResolver, Uri uri) {
        super(contentResolver, uri);
    }

    /* renamed from: d */
    protected InputStream b(Uri uri, ContentResolver contentResolver) throws FileNotFoundException {
        InputStream e = e(uri, contentResolver);
        if (e != null) {
            return e;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("InputStream is null for ");
        stringBuilder.append(uri);
        throw new FileNotFoundException(stringBuilder.toString());
    }

    private InputStream e(Uri uri, ContentResolver contentResolver) throws FileNotFoundException {
        int match = dC.match(uri);
        if (match != 1) {
            if (match == 3) {
                return openContactPhotoInputStream(contentResolver, uri);
            }
            if (match != 5) {
                return contentResolver.openInputStream(uri);
            }
        }
        uri = Contacts.lookupContact(contentResolver, uri);
        if (uri != null) {
            return openContactPhotoInputStream(contentResolver, uri);
        }
        throw new FileNotFoundException("Contact cannot be found");
    }

    private InputStream openContactPhotoInputStream(ContentResolver contentResolver, Uri uri) {
        return Contacts.openContactPhotoInputStream(contentResolver, uri, true);
    }

    /* renamed from: d */
    protected void h(InputStream inputStream) throws IOException {
        inputStream.close();
    }

    @NonNull
    public Class<InputStream> ad() {
        return InputStream.class;
    }
}
