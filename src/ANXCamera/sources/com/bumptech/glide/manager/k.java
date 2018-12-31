package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.c;
import com.bumptech.glide.i;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@Deprecated
/* compiled from: RequestManagerFragment */
public class k extends Fragment {
    private static final String TAG = "RMFragment";
    @Nullable
    private i X;
    private final a mo;
    private final m mp;
    private final Set<k> mq;
    @Nullable
    private k mr;
    @Nullable
    private Fragment ms;

    /* compiled from: RequestManagerFragment */
    private class a implements m {
        a() {
        }

        @NonNull
        public Set<i> cQ() {
            Set<k> cU = k.this.cU();
            Set<i> hashSet = new HashSet(cU.size());
            for (k kVar : cU) {
                if (kVar.cS() != null) {
                    hashSet.add(kVar.cS());
                }
            }
            return hashSet;
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(super.toString());
            stringBuilder.append("{fragment=");
            stringBuilder.append(k.this);
            stringBuilder.append("}");
            return stringBuilder.toString();
        }
    }

    public k() {
        this(new a());
    }

    @VisibleForTesting
    @SuppressLint({"ValidFragment"})
    k(@NonNull a aVar) {
        this.mp = new a();
        this.mq = new HashSet();
        this.mo = aVar;
    }

    public void c(@Nullable i iVar) {
        this.X = iVar;
    }

    @NonNull
    a cR() {
        return this.mo;
    }

    @Nullable
    public i cS() {
        return this.X;
    }

    @NonNull
    public m cT() {
        return this.mp;
    }

    private void a(k kVar) {
        this.mq.add(kVar);
    }

    private void b(k kVar) {
        this.mq.remove(kVar);
    }

    @TargetApi(17)
    @NonNull
    Set<k> cU() {
        if (equals(this.mr)) {
            return Collections.unmodifiableSet(this.mq);
        }
        if (this.mr == null || VERSION.SDK_INT < 17) {
            return Collections.emptySet();
        }
        Set hashSet = new HashSet();
        for (k kVar : this.mr.cU()) {
            if (c(kVar.getParentFragment())) {
                hashSet.add(kVar);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }

    void b(@Nullable Fragment fragment) {
        this.ms = fragment;
        if (fragment != null && fragment.getActivity() != null) {
            b(fragment.getActivity());
        }
    }

    @Nullable
    @TargetApi(17)
    private Fragment cV() {
        Fragment parentFragment;
        if (VERSION.SDK_INT >= 17) {
            parentFragment = getParentFragment();
        } else {
            parentFragment = null;
        }
        return parentFragment != null ? parentFragment : this.ms;
    }

    @TargetApi(17)
    private boolean c(@NonNull Fragment fragment) {
        Fragment parentFragment = getParentFragment();
        while (true) {
            Fragment parentFragment2 = fragment.getParentFragment();
            if (parentFragment2 == null) {
                return false;
            }
            if (parentFragment2.equals(parentFragment)) {
                return true;
            }
            fragment = fragment.getParentFragment();
        }
    }

    private void b(@NonNull Activity activity) {
        cW();
        this.mr = c.b((Context) activity).k().e(activity);
        if (!equals(this.mr)) {
            this.mr.a(this);
        }
    }

    private void cW() {
        if (this.mr != null) {
            this.mr.b(this);
            this.mr = null;
        }
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        try {
            b(activity);
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to register fragment with root", e);
            }
        }
    }

    public void onDetach() {
        super.onDetach();
        cW();
    }

    public void onStart() {
        super.onStart();
        this.mo.onStart();
    }

    public void onStop() {
        super.onStop();
        this.mo.onStop();
    }

    public void onDestroy() {
        super.onDestroy();
        this.mo.onDestroy();
        cW();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(super.toString());
        stringBuilder.append("{parent=");
        stringBuilder.append(cV());
        stringBuilder.append("}");
        return stringBuilder.toString();
    }
}
