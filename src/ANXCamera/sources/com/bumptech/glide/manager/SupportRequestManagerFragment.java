package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import com.bumptech.glide.c;
import com.bumptech.glide.i;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class SupportRequestManagerFragment extends Fragment {
    private static final String TAG = "SupportRMFragment";
    @Nullable
    private i X;
    @Nullable
    private SupportRequestManagerFragment mF;
    @Nullable
    private Fragment mG;
    private final a mn;
    private final m mo;
    private final Set<SupportRequestManagerFragment> mp;

    private class a implements m {
        a() {
        }

        @NonNull
        public Set<i> cQ() {
            Set<SupportRequestManagerFragment> cU = SupportRequestManagerFragment.this.cU();
            Set<i> hashSet = new HashSet(cU.size());
            for (SupportRequestManagerFragment supportRequestManagerFragment : cU) {
                if (supportRequestManagerFragment.cS() != null) {
                    hashSet.add(supportRequestManagerFragment.cS());
                }
            }
            return hashSet;
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(super.toString());
            stringBuilder.append("{fragment=");
            stringBuilder.append(SupportRequestManagerFragment.this);
            stringBuilder.append("}");
            return stringBuilder.toString();
        }
    }

    public SupportRequestManagerFragment() {
        this(new a());
    }

    @VisibleForTesting
    @SuppressLint({"ValidFragment"})
    public SupportRequestManagerFragment(@NonNull a aVar) {
        this.mo = new a();
        this.mp = new HashSet();
        this.mn = aVar;
    }

    public void c(@Nullable i iVar) {
        this.X = iVar;
    }

    @NonNull
    a cR() {
        return this.mn;
    }

    @Nullable
    public i cS() {
        return this.X;
    }

    @NonNull
    public m cT() {
        return this.mo;
    }

    private void a(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.mp.add(supportRequestManagerFragment);
    }

    private void b(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.mp.remove(supportRequestManagerFragment);
    }

    @NonNull
    Set<SupportRequestManagerFragment> cU() {
        if (this.mF == null) {
            return Collections.emptySet();
        }
        if (equals(this.mF)) {
            return Collections.unmodifiableSet(this.mp);
        }
        Set hashSet = new HashSet();
        for (SupportRequestManagerFragment supportRequestManagerFragment : this.mF.cU()) {
            if (d(supportRequestManagerFragment.cZ())) {
                hashSet.add(supportRequestManagerFragment);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }

    void c(@Nullable Fragment fragment) {
        this.mG = fragment;
        if (fragment != null && fragment.getActivity() != null) {
            d(fragment.getActivity());
        }
    }

    @Nullable
    private Fragment cZ() {
        Fragment parentFragment = getParentFragment();
        return parentFragment != null ? parentFragment : this.mG;
    }

    private boolean d(@NonNull Fragment fragment) {
        Fragment cZ = cZ();
        while (true) {
            Fragment parentFragment = fragment.getParentFragment();
            if (parentFragment == null) {
                return false;
            }
            if (parentFragment.equals(cZ)) {
                return true;
            }
            fragment = fragment.getParentFragment();
        }
    }

    private void d(@NonNull FragmentActivity fragmentActivity) {
        cW();
        this.mF = c.b((Context) fragmentActivity).k().c(fragmentActivity);
        if (!equals(this.mF)) {
            this.mF.a(this);
        }
    }

    private void cW() {
        if (this.mF != null) {
            this.mF.b(this);
            this.mF = null;
        }
    }

    public void onAttach(Context context) {
        super.onAttach(context);
        try {
            d(getActivity());
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to register fragment with root", e);
            }
        }
    }

    public void onDetach() {
        super.onDetach();
        this.mG = null;
        cW();
    }

    public void onStart() {
        super.onStart();
        this.mn.onStart();
    }

    public void onStop() {
        super.onStop();
        this.mn.onStop();
    }

    public void onDestroy() {
        super.onDestroy();
        this.mn.onDestroy();
        cW();
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(super.toString());
        stringBuilder.append("{parent=");
        stringBuilder.append(cZ());
        stringBuilder.append("}");
        return stringBuilder.toString();
    }
}
