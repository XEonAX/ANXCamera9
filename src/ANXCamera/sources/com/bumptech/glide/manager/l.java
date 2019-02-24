package com.bumptech.glide.manager;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.app.FragmentManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.util.ArrayMap;
import android.util.Log;
import android.view.View;
import com.bumptech.glide.c;
import com.bumptech.glide.i;
import com.bumptech.glide.util.k;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/* compiled from: RequestManagerRetriever */
public class l implements Callback {
    @VisibleForTesting
    static final String FRAGMENT_TAG = "com.bumptech.glide.manager";
    private static final String TAG = "RMRetriever";
    private static final a mB = new a() {
        @NonNull
        public i a(@NonNull c cVar, @NonNull h hVar, @NonNull m mVar, @NonNull Context context) {
            return new i(cVar, hVar, mVar, context);
        }
    };
    private static final int mt = 1;
    private static final int mu = 2;
    private static final String mv = "key";
    private final Handler handler;
    private final Bundle mA = new Bundle();
    private volatile i mw;
    private final a mx;
    private final ArrayMap<View, Fragment> my = new ArrayMap();
    private final ArrayMap<View, android.app.Fragment> mz = new ArrayMap();
    @VisibleForTesting
    final Map<FragmentManager, k> pendingRequestManagerFragments = new HashMap();
    @VisibleForTesting
    final Map<android.support.v4.app.FragmentManager, SupportRequestManagerFragment> pendingSupportRequestManagerFragments = new HashMap();

    /* compiled from: RequestManagerRetriever */
    public interface a {
        @NonNull
        i a(@NonNull c cVar, @NonNull h hVar, @NonNull m mVar, @NonNull Context context);
    }

    public l(@Nullable a aVar) {
        if (aVar == null) {
            aVar = mB;
        }
        this.mx = aVar;
        this.handler = new Handler(Looper.getMainLooper(), this);
    }

    @NonNull
    private i h(@NonNull Context context) {
        if (this.mw == null) {
            synchronized (this) {
                if (this.mw == null) {
                    this.mw = this.mx.a(c.b(context.getApplicationContext()), new b(), new g(), context.getApplicationContext());
                }
            }
        }
        return this.mw;
    }

    @NonNull
    public i i(@NonNull Context context) {
        if (context != null) {
            if (k.eH() && !(context instanceof Application)) {
                if (context instanceof FragmentActivity) {
                    return b((FragmentActivity) context);
                }
                if (context instanceof Activity) {
                    return c((Activity) context);
                }
                if (context instanceof ContextWrapper) {
                    return i(((ContextWrapper) context).getBaseContext());
                }
            }
            return h(context);
        }
        throw new IllegalArgumentException("You cannot start a load on a null Context");
    }

    @NonNull
    public i b(@NonNull FragmentActivity fragmentActivity) {
        if (k.eI()) {
            return i(fragmentActivity.getApplicationContext());
        }
        d((Activity) fragmentActivity);
        return a((Context) fragmentActivity, fragmentActivity.getSupportFragmentManager(), null, f(fragmentActivity));
    }

    @NonNull
    public i b(@NonNull Fragment fragment) {
        com.bumptech.glide.util.i.a(fragment.getActivity(), "You cannot start a load on a fragment before it is attached or after it is destroyed");
        if (k.eI()) {
            return i(fragment.getActivity().getApplicationContext());
        }
        return a(fragment.getActivity(), fragment.getChildFragmentManager(), fragment, fragment.isVisible());
    }

    @NonNull
    public i c(@NonNull Activity activity) {
        if (k.eI()) {
            return i(activity.getApplicationContext());
        }
        d(activity);
        return a((Context) activity, activity.getFragmentManager(), null, f(activity));
    }

    @NonNull
    public i c(@NonNull View view) {
        if (k.eI()) {
            return i(view.getContext().getApplicationContext());
        }
        com.bumptech.glide.util.i.checkNotNull(view);
        com.bumptech.glide.util.i.a(view.getContext(), "Unable to obtain a request manager for a view without a Context");
        Activity j = j(view.getContext());
        if (j == null) {
            return i(view.getContext().getApplicationContext());
        }
        if (j instanceof FragmentActivity) {
            Fragment a = a(view, (FragmentActivity) j);
            return a != null ? b(a) : c(j);
        }
        android.app.Fragment a2 = a(view, j);
        if (a2 == null) {
            return c(j);
        }
        return d(a2);
    }

    private static void a(@Nullable Collection<Fragment> collection, @NonNull Map<View, Fragment> map) {
        if (collection != null) {
            for (Fragment fragment : collection) {
                if (fragment != null) {
                    if (fragment.getView() != null) {
                        map.put(fragment.getView(), fragment);
                        a(fragment.getChildFragmentManager().getFragments(), (Map) map);
                    }
                }
            }
        }
    }

    @Nullable
    private Fragment a(@NonNull View view, @NonNull FragmentActivity fragmentActivity) {
        this.my.clear();
        a(fragmentActivity.getSupportFragmentManager().getFragments(), this.my);
        View findViewById = fragmentActivity.findViewById(16908290);
        Fragment fragment = null;
        while (!view.equals(findViewById)) {
            fragment = (Fragment) this.my.get(view);
            if (fragment != null || !(view.getParent() instanceof View)) {
                break;
            }
            view = (View) view.getParent();
        }
        this.my.clear();
        return fragment;
    }

    @Nullable
    @Deprecated
    private android.app.Fragment a(@NonNull View view, @NonNull Activity activity) {
        this.mz.clear();
        a(activity.getFragmentManager(), this.mz);
        View findViewById = activity.findViewById(16908290);
        android.app.Fragment fragment = null;
        while (!view.equals(findViewById)) {
            fragment = (android.app.Fragment) this.mz.get(view);
            if (fragment != null || !(view.getParent() instanceof View)) {
                break;
            }
            view = (View) view.getParent();
        }
        this.mz.clear();
        return fragment;
    }

    @TargetApi(26)
    @Deprecated
    private void a(@NonNull FragmentManager fragmentManager, @NonNull ArrayMap<View, android.app.Fragment> arrayMap) {
        if (VERSION.SDK_INT >= 26) {
            for (android.app.Fragment fragment : fragmentManager.getFragments()) {
                if (fragment.getView() != null) {
                    arrayMap.put(fragment.getView(), fragment);
                    a(fragment.getChildFragmentManager(), (ArrayMap) arrayMap);
                }
            }
            return;
        }
        b(fragmentManager, arrayMap);
    }

    @Deprecated
    private void b(@NonNull FragmentManager fragmentManager, @NonNull ArrayMap<View, android.app.Fragment> arrayMap) {
        int i = 0;
        while (true) {
            int i2 = i + 1;
            this.mA.putInt(mv, i);
            android.app.Fragment fragment = null;
            try {
                fragment = fragmentManager.getFragment(this.mA, mv);
            } catch (Exception e) {
            }
            if (fragment != null) {
                if (fragment.getView() != null) {
                    arrayMap.put(fragment.getView(), fragment);
                    if (VERSION.SDK_INT >= 17) {
                        a(fragment.getChildFragmentManager(), (ArrayMap) arrayMap);
                    }
                }
                i = i2;
            } else {
                return;
            }
        }
    }

    @Nullable
    private Activity j(@NonNull Context context) {
        if (context instanceof Activity) {
            return (Activity) context;
        }
        if (context instanceof ContextWrapper) {
            return j(((ContextWrapper) context).getBaseContext());
        }
        return null;
    }

    @TargetApi(17)
    private static void d(@NonNull Activity activity) {
        if (VERSION.SDK_INT >= 17 && activity.isDestroyed()) {
            throw new IllegalArgumentException("You cannot start a load for a destroyed activity");
        }
    }

    @TargetApi(17)
    @Deprecated
    @NonNull
    public i d(@NonNull android.app.Fragment fragment) {
        if (fragment.getActivity() == null) {
            throw new IllegalArgumentException("You cannot start a load on a fragment before it is attached");
        } else if (k.eI() || VERSION.SDK_INT < 17) {
            return i(fragment.getActivity().getApplicationContext());
        } else {
            return a(fragment.getActivity(), fragment.getChildFragmentManager(), fragment, fragment.isVisible());
        }
    }

    @Deprecated
    @NonNull
    k e(Activity activity) {
        return a(activity.getFragmentManager(), null, f(activity));
    }

    @NonNull
    private k a(@NonNull FragmentManager fragmentManager, @Nullable android.app.Fragment fragment, boolean z) {
        k kVar = (k) fragmentManager.findFragmentByTag(FRAGMENT_TAG);
        if (kVar == null) {
            kVar = (k) this.pendingRequestManagerFragments.get(fragmentManager);
            if (kVar == null) {
                kVar = new k();
                kVar.b(fragment);
                if (z) {
                    kVar.cR().onStart();
                }
                this.pendingRequestManagerFragments.put(fragmentManager, kVar);
                fragmentManager.beginTransaction().add(kVar, FRAGMENT_TAG).commitAllowingStateLoss();
                this.handler.obtainMessage(1, fragmentManager).sendToTarget();
            }
        }
        return kVar;
    }

    @Deprecated
    @NonNull
    private i a(@NonNull Context context, @NonNull FragmentManager fragmentManager, @Nullable android.app.Fragment fragment, boolean z) {
        k a = a(fragmentManager, fragment, z);
        i cS = a.cS();
        if (cS != null) {
            return cS;
        }
        cS = this.mx.a(c.b(context), a.cR(), a.cT(), context);
        a.c(cS);
        return cS;
    }

    @NonNull
    SupportRequestManagerFragment c(FragmentActivity fragmentActivity) {
        return a(fragmentActivity.getSupportFragmentManager(), null, f(fragmentActivity));
    }

    private static boolean f(Activity activity) {
        return activity.isFinishing() ^ 1;
    }

    @NonNull
    private SupportRequestManagerFragment a(@NonNull android.support.v4.app.FragmentManager fragmentManager, @Nullable Fragment fragment, boolean z) {
        SupportRequestManagerFragment supportRequestManagerFragment = (SupportRequestManagerFragment) fragmentManager.findFragmentByTag(FRAGMENT_TAG);
        if (supportRequestManagerFragment == null) {
            supportRequestManagerFragment = (SupportRequestManagerFragment) this.pendingSupportRequestManagerFragments.get(fragmentManager);
            if (supportRequestManagerFragment == null) {
                supportRequestManagerFragment = new SupportRequestManagerFragment();
                supportRequestManagerFragment.c(fragment);
                if (z) {
                    supportRequestManagerFragment.cR().onStart();
                }
                this.pendingSupportRequestManagerFragments.put(fragmentManager, supportRequestManagerFragment);
                fragmentManager.beginTransaction().add(supportRequestManagerFragment, FRAGMENT_TAG).commitAllowingStateLoss();
                this.handler.obtainMessage(2, fragmentManager).sendToTarget();
            }
        }
        return supportRequestManagerFragment;
    }

    @NonNull
    private i a(@NonNull Context context, @NonNull android.support.v4.app.FragmentManager fragmentManager, @Nullable Fragment fragment, boolean z) {
        SupportRequestManagerFragment a = a(fragmentManager, fragment, z);
        i cS = a.cS();
        if (cS != null) {
            return cS;
        }
        cS = this.mx.a(c.b(context), a.cR(), a.cT(), context);
        a.c(cS);
        return cS;
    }

    public boolean handleMessage(Message message) {
        Object obj = null;
        boolean z = true;
        Object remove;
        switch (message.what) {
            case 1:
                obj = (FragmentManager) message.obj;
                remove = this.pendingRequestManagerFragments.remove(obj);
                break;
            case 2:
                obj = (android.support.v4.app.FragmentManager) message.obj;
                remove = this.pendingSupportRequestManagerFragments.remove(obj);
                break;
            default:
                z = false;
                remove = null;
                break;
        }
        if (z && remove == null && Log.isLoggable(TAG, 5)) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to remove expected request manager fragment, manager: ");
            stringBuilder.append(obj);
            Log.w(str, stringBuilder.toString());
        }
        return z;
    }
}
