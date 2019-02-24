package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.support.annotation.CallSuper;
import android.support.v4.app.BackStackRecord.TransitionState;
import android.support.v4.app.Fragment.SavedState;
import android.support.v4.app.FragmentManager.BackStackEntry;
import android.support.v4.app.FragmentManager.OnBackStackChangedListener;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.LogWriter;
import android.support.v4.view.LayoutInflaterFactory;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* compiled from: FragmentManager */
final class FragmentManagerImpl extends FragmentManager implements LayoutInflaterFactory {
    static final Interpolator ACCELERATE_CUBIC = new AccelerateInterpolator(1.5f);
    static final Interpolator ACCELERATE_QUINT = new AccelerateInterpolator(2.5f);
    static final int ANIM_DUR = 220;
    public static final int ANIM_STYLE_CLOSE_ENTER = 3;
    public static final int ANIM_STYLE_CLOSE_EXIT = 4;
    public static final int ANIM_STYLE_FADE_ENTER = 5;
    public static final int ANIM_STYLE_FADE_EXIT = 6;
    public static final int ANIM_STYLE_OPEN_ENTER = 1;
    public static final int ANIM_STYLE_OPEN_EXIT = 2;
    static boolean DEBUG = false;
    static final Interpolator DECELERATE_CUBIC = new DecelerateInterpolator(1.5f);
    static final Interpolator DECELERATE_QUINT = new DecelerateInterpolator(2.5f);
    static final boolean HONEYCOMB;
    static final String TAG = "FragmentManager";
    static final String TARGET_REQUEST_CODE_STATE_TAG = "android:target_req_state";
    static final String TARGET_STATE_TAG = "android:target_state";
    static final String USER_VISIBLE_HINT_TAG = "android:user_visible_hint";
    static final String VIEW_STATE_TAG = "android:view_state";
    ArrayList<Fragment> mActive;
    ArrayList<Fragment> mAdded;
    ArrayList<Integer> mAvailBackStackIndices;
    ArrayList<Integer> mAvailIndices;
    ArrayList<BackStackRecord> mBackStack;
    ArrayList<OnBackStackChangedListener> mBackStackChangeListeners;
    ArrayList<BackStackRecord> mBackStackIndices;
    FragmentContainer mContainer;
    FragmentController mController;
    ArrayList<Fragment> mCreatedMenus;
    int mCurState = 0;
    boolean mDestroyed;
    Runnable mExecCommit = new Runnable() {
        public void run() {
            FragmentManagerImpl.this.execPendingActions();
        }
    };
    boolean mExecutingActions;
    boolean mHavePendingDeferredStart;
    FragmentHostCallback mHost;
    boolean mNeedMenuInvalidate;
    String mNoTransactionsBecause;
    Fragment mParent;
    ArrayList<Runnable> mPendingActions;
    SparseArray<Parcelable> mStateArray = null;
    Bundle mStateBundle = null;
    boolean mStateSaved;
    Runnable[] mTmpActions;

    /* compiled from: FragmentManager */
    static class AnimateOnHWLayerIfNeededListener implements AnimationListener {
        private boolean mShouldRunOnHWLayer = false;
        private View mView;

        public AnimateOnHWLayerIfNeededListener(View v, Animation anim) {
            if (v != null && anim != null) {
                this.mView = v;
            }
        }

        @CallSuper
        public void onAnimationStart(Animation animation) {
            this.mShouldRunOnHWLayer = FragmentManagerImpl.shouldRunOnHWLayer(this.mView, animation);
            if (this.mShouldRunOnHWLayer) {
                ViewCompat.setLayerType(this.mView, 2, null);
            }
        }

        @CallSuper
        public void onAnimationEnd(Animation animation) {
            if (this.mShouldRunOnHWLayer) {
                ViewCompat.setLayerType(this.mView, 0, null);
            }
        }

        public void onAnimationRepeat(Animation animation) {
        }
    }

    /* compiled from: FragmentManager */
    static class FragmentTag {
        public static final int[] Fragment = new int[]{16842755, 16842960, 16842961};
        public static final int Fragment_id = 1;
        public static final int Fragment_name = 0;
        public static final int Fragment_tag = 2;

        FragmentTag() {
        }
    }

    FragmentManagerImpl() {
    }

    static {
        boolean z = false;
        if (VERSION.SDK_INT >= 11) {
            z = true;
        }
        HONEYCOMB = z;
    }

    static boolean modifiesAlpha(Animation anim) {
        if (anim instanceof AlphaAnimation) {
            return true;
        }
        if (anim instanceof AnimationSet) {
            List<Animation> anims = ((AnimationSet) anim).getAnimations();
            for (int i = 0; i < anims.size(); i++) {
                if (anims.get(i) instanceof AlphaAnimation) {
                    return true;
                }
            }
        }
        return false;
    }

    static boolean shouldRunOnHWLayer(View v, Animation anim) {
        return VERSION.SDK_INT >= 16 && ViewCompat.getLayerType(v) == 0 && ViewCompat.hasOverlappingRendering(v) && modifiesAlpha(anim);
    }

    private void throwException(RuntimeException ex) {
        Log.e(TAG, ex.getMessage());
        Log.e(TAG, "Activity state:");
        PrintWriter pw = new PrintWriter(new LogWriter(TAG));
        if (this.mHost != null) {
            try {
                this.mHost.onDump("  ", null, pw, new String[0]);
            } catch (Exception e) {
                Log.e(TAG, "Failed dumping state", e);
            }
        } else {
            try {
                dump("  ", null, pw, new String[0]);
            } catch (Exception e2) {
                Log.e(TAG, "Failed dumping state", e2);
            }
        }
        throw ex;
    }

    public FragmentTransaction beginTransaction() {
        return new BackStackRecord(this);
    }

    public boolean executePendingTransactions() {
        return execPendingActions();
    }

    public void popBackStack() {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, -1, 0);
            }
        }, false);
    }

    public boolean popBackStackImmediate() {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mHost.getHandler(), null, -1, 0);
    }

    public void popBackStack(final String name, final int flags) {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), name, -1, flags);
            }
        }, false);
    }

    public boolean popBackStackImmediate(String name, int flags) {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mHost.getHandler(), name, -1, flags);
    }

    public void popBackStack(final int id, final int flags) {
        if (id >= 0) {
            enqueueAction(new Runnable() {
                public void run() {
                    FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, id, flags);
                }
            }, false);
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Bad id: ");
        stringBuilder.append(id);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public boolean popBackStackImmediate(int id, int flags) {
        checkStateLoss();
        executePendingTransactions();
        if (id >= 0) {
            return popBackStackState(this.mHost.getHandler(), null, id, flags);
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Bad id: ");
        stringBuilder.append(id);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public int getBackStackEntryCount() {
        return this.mBackStack != null ? this.mBackStack.size() : 0;
    }

    public BackStackEntry getBackStackEntryAt(int index) {
        return (BackStackEntry) this.mBackStack.get(index);
    }

    public void addOnBackStackChangedListener(OnBackStackChangedListener listener) {
        if (this.mBackStackChangeListeners == null) {
            this.mBackStackChangeListeners = new ArrayList();
        }
        this.mBackStackChangeListeners.add(listener);
    }

    public void removeOnBackStackChangedListener(OnBackStackChangedListener listener) {
        if (this.mBackStackChangeListeners != null) {
            this.mBackStackChangeListeners.remove(listener);
        }
    }

    public void putFragment(Bundle bundle, String key, Fragment fragment) {
        if (fragment.mIndex < 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Fragment ");
            stringBuilder.append(fragment);
            stringBuilder.append(" is not currently in the FragmentManager");
            throwException(new IllegalStateException(stringBuilder.toString()));
        }
        bundle.putInt(key, fragment.mIndex);
    }

    public Fragment getFragment(Bundle bundle, String key) {
        int index = bundle.getInt(key, -1);
        if (index == -1) {
            return null;
        }
        if (index >= this.mActive.size()) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Fragment no longer exists for key ");
            stringBuilder.append(key);
            stringBuilder.append(": index ");
            stringBuilder.append(index);
            throwException(new IllegalStateException(stringBuilder.toString()));
        }
        Fragment f = (Fragment) this.mActive.get(index);
        if (f == null) {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Fragment no longer exists for key ");
            stringBuilder2.append(key);
            stringBuilder2.append(": index ");
            stringBuilder2.append(index);
            throwException(new IllegalStateException(stringBuilder2.toString()));
        }
        return f;
    }

    public List<Fragment> getFragments() {
        return this.mActive;
    }

    public SavedState saveFragmentInstanceState(Fragment fragment) {
        if (fragment.mIndex < 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Fragment ");
            stringBuilder.append(fragment);
            stringBuilder.append(" is not currently in the FragmentManager");
            throwException(new IllegalStateException(stringBuilder.toString()));
        }
        SavedState savedState = null;
        if (fragment.mState <= 0) {
            return null;
        }
        Bundle result = saveFragmentBasicState(fragment);
        if (result != null) {
            savedState = new SavedState(result);
        }
        return savedState;
    }

    public boolean isDestroyed() {
        return this.mDestroyed;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("FragmentManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        if (this.mParent != null) {
            DebugUtils.buildShortClassTag(this.mParent, sb);
        } else {
            DebugUtils.buildShortClassTag(this.mHost, sb);
        }
        sb.append("}}");
        return sb.toString();
    }

    public void dump(String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
        int N;
        int i;
        Fragment f;
        BackStackRecord bs;
        String innerPrefix = new StringBuilder();
        innerPrefix.append(prefix);
        innerPrefix.append("    ");
        innerPrefix = innerPrefix.toString();
        int i2 = 0;
        if (this.mActive != null) {
            N = this.mActive.size();
            if (N > 0) {
                writer.print(prefix);
                writer.print("Active Fragments in ");
                writer.print(Integer.toHexString(System.identityHashCode(this)));
                writer.println(":");
                for (i = 0; i < N; i++) {
                    f = (Fragment) this.mActive.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(f);
                    if (f != null) {
                        f.dump(innerPrefix, fd, writer, args);
                    }
                }
            }
        }
        if (this.mAdded != null) {
            N = this.mAdded.size();
            if (N > 0) {
                writer.print(prefix);
                writer.println("Added Fragments:");
                for (i = 0; i < N; i++) {
                    f = (Fragment) this.mAdded.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(f.toString());
                }
            }
        }
        if (this.mCreatedMenus != null) {
            N = this.mCreatedMenus.size();
            if (N > 0) {
                writer.print(prefix);
                writer.println("Fragments Created Menus:");
                for (i = 0; i < N; i++) {
                    f = (Fragment) this.mCreatedMenus.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(f.toString());
                }
            }
        }
        if (this.mBackStack != null) {
            N = this.mBackStack.size();
            if (N > 0) {
                writer.print(prefix);
                writer.println("Back Stack:");
                for (i = 0; i < N; i++) {
                    bs = (BackStackRecord) this.mBackStack.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(bs.toString());
                    bs.dump(innerPrefix, fd, writer, args);
                }
            }
        }
        synchronized (this) {
            if (this.mBackStackIndices != null) {
                N = this.mBackStackIndices.size();
                if (N > 0) {
                    writer.print(prefix);
                    writer.println("Back Stack Indices:");
                    for (i = 0; i < N; i++) {
                        bs = (BackStackRecord) this.mBackStackIndices.get(i);
                        writer.print(prefix);
                        writer.print("  #");
                        writer.print(i);
                        writer.print(": ");
                        writer.println(bs);
                    }
                }
            }
            if (this.mAvailBackStackIndices != null && this.mAvailBackStackIndices.size() > 0) {
                writer.print(prefix);
                writer.print("mAvailBackStackIndices: ");
                writer.println(Arrays.toString(this.mAvailBackStackIndices.toArray()));
            }
        }
        if (this.mPendingActions != null) {
            N = this.mPendingActions.size();
            if (N > 0) {
                writer.print(prefix);
                writer.println("Pending Actions:");
                while (i2 < N) {
                    Runnable r = (Runnable) this.mPendingActions.get(i2);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i2);
                    writer.print(": ");
                    writer.println(r);
                    i2++;
                }
            }
        }
        writer.print(prefix);
        writer.println("FragmentManager misc state:");
        writer.print(prefix);
        writer.print("  mHost=");
        writer.println(this.mHost);
        writer.print(prefix);
        writer.print("  mContainer=");
        writer.println(this.mContainer);
        if (this.mParent != null) {
            writer.print(prefix);
            writer.print("  mParent=");
            writer.println(this.mParent);
        }
        writer.print(prefix);
        writer.print("  mCurState=");
        writer.print(this.mCurState);
        writer.print(" mStateSaved=");
        writer.print(this.mStateSaved);
        writer.print(" mDestroyed=");
        writer.println(this.mDestroyed);
        if (this.mNeedMenuInvalidate) {
            writer.print(prefix);
            writer.print("  mNeedMenuInvalidate=");
            writer.println(this.mNeedMenuInvalidate);
        }
        if (this.mNoTransactionsBecause != null) {
            writer.print(prefix);
            writer.print("  mNoTransactionsBecause=");
            writer.println(this.mNoTransactionsBecause);
        }
        if (this.mAvailIndices != null && this.mAvailIndices.size() > 0) {
            writer.print(prefix);
            writer.print("  mAvailIndices: ");
            writer.println(Arrays.toString(this.mAvailIndices.toArray()));
        }
    }

    static Animation makeOpenCloseAnimation(Context context, float startScale, float endScale, float startAlpha, float endAlpha) {
        AnimationSet set = new AnimationSet(false);
        ScaleAnimation scale = new ScaleAnimation(startScale, endScale, startScale, endScale, 1, 0.5f, 1, 0.5f);
        scale.setInterpolator(DECELERATE_QUINT);
        scale.setDuration(220);
        set.addAnimation(scale);
        AlphaAnimation alpha = new AlphaAnimation(startAlpha, endAlpha);
        alpha.setInterpolator(DECELERATE_CUBIC);
        alpha.setDuration(220);
        set.addAnimation(alpha);
        return set;
    }

    static Animation makeFadeAnimation(Context context, float start, float end) {
        AlphaAnimation anim = new AlphaAnimation(start, end);
        anim.setInterpolator(DECELERATE_CUBIC);
        anim.setDuration(220);
        return anim;
    }

    Animation loadAnimation(Fragment fragment, int transit, boolean enter, int transitionStyle) {
        Animation animObj = fragment.onCreateAnimation(transit, enter, fragment.mNextAnim);
        if (animObj != null) {
            return animObj;
        }
        if (fragment.mNextAnim != 0) {
            Animation anim = AnimationUtils.loadAnimation(this.mHost.getContext(), fragment.mNextAnim);
            if (anim != null) {
                return anim;
            }
        }
        if (transit == 0) {
            return null;
        }
        int styleIndex = transitToStyleIndex(transit, enter);
        if (styleIndex < 0) {
            return null;
        }
        switch (styleIndex) {
            case 1:
                return makeOpenCloseAnimation(this.mHost.getContext(), 1.125f, 1.0f, 0.0f, 1.0f);
            case 2:
                return makeOpenCloseAnimation(this.mHost.getContext(), 1.0f, 0.975f, 1.0f, 0.0f);
            case 3:
                return makeOpenCloseAnimation(this.mHost.getContext(), 0.975f, 1.0f, 0.0f, 1.0f);
            case 4:
                return makeOpenCloseAnimation(this.mHost.getContext(), 1.0f, 1.075f, 1.0f, 0.0f);
            case 5:
                return makeFadeAnimation(this.mHost.getContext(), 0.0f, 1.0f);
            case 6:
                return makeFadeAnimation(this.mHost.getContext(), 1.0f, 0.0f);
            default:
                if (transitionStyle == 0 && this.mHost.onHasWindowAnimations()) {
                    transitionStyle = this.mHost.onGetWindowAnimations();
                }
                return transitionStyle == 0 ? null : null;
        }
    }

    public void performPendingDeferredStart(Fragment f) {
        if (f.mDeferStart) {
            if (this.mExecutingActions) {
                this.mHavePendingDeferredStart = true;
                return;
            }
            f.mDeferStart = false;
            moveToState(f, this.mCurState, 0, 0, false);
        }
    }

    /* JADX WARNING: Missing block: B:6:0x0014, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void setHWLayerAnimListenerIfAlpha(View v, Animation anim) {
        if (!(v == null || anim == null || !shouldRunOnHWLayer(v, anim))) {
            anim.setAnimationListener(new AnimateOnHWLayerIfNeededListener(v, anim));
        }
    }

    /* JADX WARNING: Missing block: B:69:0x0139, code:
            if (r13 <= 1) goto L_0x020c;
     */
    /* JADX WARNING: Missing block: B:71:0x013d, code:
            if (DEBUG == false) goto L_0x0155;
     */
    /* JADX WARNING: Missing block: B:72:0x013f, code:
            r0 = TAG;
            r3 = new java.lang.StringBuilder();
            r3.append("moveto ACTIVITY_CREATED: ");
            r3.append(r7);
            android.util.Log.v(r0, r3.toString());
     */
    /* JADX WARNING: Missing block: B:74:0x0157, code:
            if (r7.mFromLayout != false) goto L_0x01fc;
     */
    /* JADX WARNING: Missing block: B:75:0x0159, code:
            r0 = null;
     */
    /* JADX WARNING: Missing block: B:76:0x015c, code:
            if (r7.mContainerId == 0) goto L_0x01a8;
     */
    /* JADX WARNING: Missing block: B:77:0x015e, code:
            r0 = (android.view.ViewGroup) r6.mContainer.onFindViewById(r7.mContainerId);
     */
    /* JADX WARNING: Missing block: B:78:0x0169, code:
            if (r0 != null) goto L_0x01a8;
     */
    /* JADX WARNING: Missing block: B:80:0x016d, code:
            if (r7.mRestored != false) goto L_0x01a8;
     */
    /* JADX WARNING: Missing block: B:81:0x016f, code:
            r4 = new java.lang.StringBuilder();
            r4.append("No view found for id 0x");
            r4.append(java.lang.Integer.toHexString(r7.mContainerId));
            r4.append(" (");
            r4.append(r18.getResources().getResourceName(r7.mContainerId));
            r4.append(") for fragment ");
            r4.append(r7);
            throwException(new java.lang.IllegalArgumentException(r4.toString()));
     */
    /* JADX WARNING: Missing block: B:82:0x01a8, code:
            r7.mContainer = r0;
            r7.mView = r7.performCreateView(r7.getLayoutInflater(r7.mSavedFragmentState), r0, r7.mSavedFragmentState);
     */
    /* JADX WARNING: Missing block: B:83:0x01ba, code:
            if (r7.mView == null) goto L_0x01fa;
     */
    /* JADX WARNING: Missing block: B:84:0x01bc, code:
            r7.mInnerView = r7.mView;
     */
    /* JADX WARNING: Missing block: B:85:0x01c2, code:
            if (android.os.Build.VERSION.SDK_INT < 11) goto L_0x01ca;
     */
    /* JADX WARNING: Missing block: B:86:0x01c4, code:
            android.support.v4.view.ViewCompat.setSaveFromParentEnabled(r7.mView, false);
     */
    /* JADX WARNING: Missing block: B:87:0x01ca, code:
            r7.mView = android.support.v4.app.NoSaveStateFrameLayout.wrap(r7.mView);
     */
    /* JADX WARNING: Missing block: B:88:0x01d2, code:
            if (r0 == null) goto L_0x01e9;
     */
    /* JADX WARNING: Missing block: B:89:0x01d4, code:
            r2 = loadAnimation(r7, r8, true, r9);
     */
    /* JADX WARNING: Missing block: B:90:0x01d8, code:
            if (r2 == null) goto L_0x01e4;
     */
    /* JADX WARNING: Missing block: B:91:0x01da, code:
            setHWLayerAnimListenerIfAlpha(r7.mView, r2);
            r7.mView.startAnimation(r2);
     */
    /* JADX WARNING: Missing block: B:92:0x01e4, code:
            r0.addView(r7.mView);
     */
    /* JADX WARNING: Missing block: B:94:0x01eb, code:
            if (r7.mHidden == false) goto L_0x01f2;
     */
    /* JADX WARNING: Missing block: B:95:0x01ed, code:
            r7.mView.setVisibility(8);
     */
    /* JADX WARNING: Missing block: B:96:0x01f2, code:
            r7.onViewCreated(r7.mView, r7.mSavedFragmentState);
     */
    /* JADX WARNING: Missing block: B:97:0x01fa, code:
            r7.mInnerView = null;
     */
    /* JADX WARNING: Missing block: B:98:0x01fc, code:
            r7.performActivityCreated(r7.mSavedFragmentState);
     */
    /* JADX WARNING: Missing block: B:99:0x0203, code:
            if (r7.mView == null) goto L_0x020a;
     */
    /* JADX WARNING: Missing block: B:100:0x0205, code:
            r7.restoreViewState(r7.mSavedFragmentState);
     */
    /* JADX WARNING: Missing block: B:101:0x020a, code:
            r7.mSavedFragmentState = null;
     */
    /* JADX WARNING: Missing block: B:102:0x020c, code:
            if (r13 <= 3) goto L_0x022b;
     */
    /* JADX WARNING: Missing block: B:104:0x0210, code:
            if (DEBUG == false) goto L_0x0228;
     */
    /* JADX WARNING: Missing block: B:105:0x0212, code:
            r0 = TAG;
            r1 = new java.lang.StringBuilder();
            r1.append("moveto STARTED: ");
            r1.append(r7);
            android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Missing block: B:106:0x0228, code:
            r18.performStart();
     */
    /* JADX WARNING: Missing block: B:108:0x022c, code:
            if (r13 <= 4) goto L_0x03ba;
     */
    /* JADX WARNING: Missing block: B:110:0x0230, code:
            if (DEBUG == false) goto L_0x0248;
     */
    /* JADX WARNING: Missing block: B:111:0x0232, code:
            r0 = TAG;
            r1 = new java.lang.StringBuilder();
            r1.append("moveto RESUMED: ");
            r1.append(r7);
            android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Missing block: B:112:0x0248, code:
            r7.mResumed = true;
            r18.performResume();
            r7.mSavedFragmentState = null;
            r7.mSavedViewState = null;
     */
    /* JADX WARNING: Missing block: B:126:0x029d, code:
            if (r13 >= 4) goto L_0x02bc;
     */
    /* JADX WARNING: Missing block: B:128:0x02a1, code:
            if (DEBUG == false) goto L_0x02b9;
     */
    /* JADX WARNING: Missing block: B:129:0x02a3, code:
            r0 = TAG;
            r1 = new java.lang.StringBuilder();
            r1.append("movefrom STARTED: ");
            r1.append(r7);
            android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Missing block: B:130:0x02b9, code:
            r18.performStop();
     */
    /* JADX WARNING: Missing block: B:131:0x02bc, code:
            if (r13 >= 3) goto L_0x02db;
     */
    /* JADX WARNING: Missing block: B:133:0x02c0, code:
            if (DEBUG == false) goto L_0x02d8;
     */
    /* JADX WARNING: Missing block: B:134:0x02c2, code:
            r0 = TAG;
            r1 = new java.lang.StringBuilder();
            r1.append("movefrom STOPPED: ");
            r1.append(r7);
            android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Missing block: B:135:0x02d8, code:
            r18.performReallyStop();
     */
    /* JADX WARNING: Missing block: B:137:0x02dc, code:
            if (r13 >= 2) goto L_0x0348;
     */
    /* JADX WARNING: Missing block: B:139:0x02e0, code:
            if (DEBUG == false) goto L_0x02f8;
     */
    /* JADX WARNING: Missing block: B:140:0x02e2, code:
            r0 = TAG;
            r1 = new java.lang.StringBuilder();
            r1.append("movefrom ACTIVITY_CREATED: ");
            r1.append(r7);
            android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Missing block: B:142:0x02fa, code:
            if (r7.mView == null) goto L_0x030b;
     */
    /* JADX WARNING: Missing block: B:144:0x0302, code:
            if (r6.mHost.onShouldSaveFragmentState(r7) == false) goto L_0x030b;
     */
    /* JADX WARNING: Missing block: B:146:0x0306, code:
            if (r7.mSavedViewState != null) goto L_0x030b;
     */
    /* JADX WARNING: Missing block: B:147:0x0308, code:
            saveFragmentViewState(r18);
     */
    /* JADX WARNING: Missing block: B:148:0x030b, code:
            r18.performDestroyView();
     */
    /* JADX WARNING: Missing block: B:149:0x0310, code:
            if (r7.mView == null) goto L_0x0342;
     */
    /* JADX WARNING: Missing block: B:151:0x0314, code:
            if (r7.mContainer == null) goto L_0x0342;
     */
    /* JADX WARNING: Missing block: B:152:0x0316, code:
            r0 = null;
     */
    /* JADX WARNING: Missing block: B:153:0x0319, code:
            if (r6.mCurState <= 0) goto L_0x0323;
     */
    /* JADX WARNING: Missing block: B:155:0x031d, code:
            if (r6.mDestroyed != false) goto L_0x0323;
     */
    /* JADX WARNING: Missing block: B:156:0x031f, code:
            r0 = loadAnimation(r7, r8, false, r9);
     */
    /* JADX WARNING: Missing block: B:157:0x0323, code:
            if (r0 == null) goto L_0x033b;
     */
    /* JADX WARNING: Missing block: B:158:0x0325, code:
            r1 = r7;
            r7.mAnimatingAway = r7.mView;
            r7.mStateAfterAnimating = r13;
            r0.setAnimationListener(new android.support.v4.app.FragmentManagerImpl.AnonymousClass5(r6, r7.mView, r0));
            r7.mView.startAnimation(r0);
     */
    /* JADX WARNING: Missing block: B:159:0x033b, code:
            r7.mContainer.removeView(r7.mView);
     */
    /* JADX WARNING: Missing block: B:160:0x0342, code:
            r7.mContainer = null;
            r7.mView = null;
            r7.mInnerView = null;
     */
    /* JADX WARNING: Missing block: B:161:0x0348, code:
            if (r13 >= 1) goto L_0x03ba;
     */
    /* JADX WARNING: Missing block: B:163:0x034c, code:
            if (r6.mDestroyed == false) goto L_0x0359;
     */
    /* JADX WARNING: Missing block: B:165:0x0350, code:
            if (r7.mAnimatingAway == null) goto L_0x0359;
     */
    /* JADX WARNING: Missing block: B:166:0x0352, code:
            r0 = r7.mAnimatingAway;
            r7.mAnimatingAway = null;
            r0.clearAnimation();
     */
    /* JADX WARNING: Missing block: B:168:0x035b, code:
            if (r7.mAnimatingAway == null) goto L_0x0361;
     */
    /* JADX WARNING: Missing block: B:169:0x035d, code:
            r7.mStateAfterAnimating = r13;
            r13 = 1;
     */
    /* JADX WARNING: Missing block: B:171:0x0363, code:
            if (DEBUG == false) goto L_0x037b;
     */
    /* JADX WARNING: Missing block: B:172:0x0365, code:
            r0 = TAG;
            r1 = new java.lang.StringBuilder();
            r1.append("movefrom CREATED: ");
            r1.append(r7);
            android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Missing block: B:174:0x037d, code:
            if (r7.mRetaining != false) goto L_0x0382;
     */
    /* JADX WARNING: Missing block: B:175:0x037f, code:
            r18.performDestroy();
     */
    /* JADX WARNING: Missing block: B:176:0x0382, code:
            r7.mCalled = false;
            r18.onDetach();
     */
    /* JADX WARNING: Missing block: B:177:0x0389, code:
            if (r7.mCalled == false) goto L_0x039e;
     */
    /* JADX WARNING: Missing block: B:178:0x038b, code:
            if (r22 != false) goto L_0x03ba;
     */
    /* JADX WARNING: Missing block: B:180:0x038f, code:
            if (r7.mRetaining != false) goto L_0x0395;
     */
    /* JADX WARNING: Missing block: B:181:0x0391, code:
            makeInactive(r18);
     */
    /* JADX WARNING: Missing block: B:182:0x0395, code:
            r7.mHost = null;
            r7.mParentFragment = null;
            r7.mFragmentManager = null;
            r7.mChildFragmentManager = null;
     */
    /* JADX WARNING: Missing block: B:183:0x039e, code:
            r2 = new java.lang.StringBuilder();
            r2.append("Fragment ");
            r2.append(r7);
            r2.append(" did not call through to super.onDetach()");
     */
    /* JADX WARNING: Missing block: B:184:0x03b9, code:
            throw new android.support.v4.app.SuperNotCalledException(r2.toString());
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    void moveToState(Fragment f, int newState, int transit, int transitionStyle, boolean keepActive) {
        int newState2;
        Fragment fragment = f;
        int i = transit;
        int i2 = transitionStyle;
        if (!fragment.mAdded || fragment.mDetached) {
            newState2 = newState;
            if (newState2 > 1) {
                newState2 = 1;
            }
        } else {
            newState2 = newState;
        }
        if (fragment.mRemoving && newState > fragment.mState) {
            newState2 = fragment.mState;
        }
        if (fragment.mDeferStart && fragment.mState < 4 && newState > 3) {
            newState2 = 3;
        }
        int newState3 = newState2;
        String str;
        StringBuilder stringBuilder;
        if (fragment.mState >= newState3) {
            if (fragment.mState > newState3) {
                switch (fragment.mState) {
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    case 4:
                        break;
                    case 5:
                        if (newState3 < 5) {
                            if (DEBUG) {
                                str = TAG;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("movefrom RESUMED: ");
                                stringBuilder.append(fragment);
                                Log.v(str, stringBuilder.toString());
                            }
                            f.performPause();
                            fragment.mResumed = false;
                            break;
                        }
                        break;
                }
            }
        } else if (!fragment.mFromLayout || fragment.mInLayout) {
            if (fragment.mAnimatingAway != null) {
                fragment.mAnimatingAway = null;
                moveToState(fragment, fragment.mStateAfterAnimating, 0, 0, true);
            }
            switch (fragment.mState) {
                case 0:
                    if (DEBUG) {
                        str = TAG;
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("moveto CREATED: ");
                        stringBuilder2.append(fragment);
                        Log.v(str, stringBuilder2.toString());
                    }
                    if (fragment.mSavedFragmentState != null) {
                        fragment.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
                        fragment.mSavedViewState = fragment.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                        fragment.mTarget = getFragment(fragment.mSavedFragmentState, TARGET_STATE_TAG);
                        if (fragment.mTarget != null) {
                            fragment.mTargetRequestCode = fragment.mSavedFragmentState.getInt(TARGET_REQUEST_CODE_STATE_TAG, 0);
                        }
                        fragment.mUserVisibleHint = fragment.mSavedFragmentState.getBoolean(USER_VISIBLE_HINT_TAG, true);
                        if (!fragment.mUserVisibleHint) {
                            fragment.mDeferStart = true;
                            if (newState3 > 3) {
                                newState3 = 3;
                            }
                        }
                    }
                    fragment.mHost = this.mHost;
                    fragment.mParentFragment = this.mParent;
                    fragment.mFragmentManager = this.mParent != null ? this.mParent.mChildFragmentManager : this.mHost.getFragmentManagerImpl();
                    fragment.mCalled = false;
                    fragment.onAttach(this.mHost.getContext());
                    if (fragment.mCalled) {
                        if (fragment.mParentFragment == null) {
                            this.mHost.onAttachFragment(fragment);
                        }
                        if (!fragment.mRetaining) {
                            fragment.performCreate(fragment.mSavedFragmentState);
                        }
                        fragment.mRetaining = false;
                        if (fragment.mFromLayout) {
                            fragment.mView = fragment.performCreateView(fragment.getLayoutInflater(fragment.mSavedFragmentState), null, fragment.mSavedFragmentState);
                            if (fragment.mView == null) {
                                fragment.mInnerView = null;
                                break;
                            }
                            fragment.mInnerView = fragment.mView;
                            if (VERSION.SDK_INT >= 11) {
                                ViewCompat.setSaveFromParentEnabled(fragment.mView, false);
                            } else {
                                fragment.mView = NoSaveStateFrameLayout.wrap(fragment.mView);
                            }
                            if (fragment.mHidden) {
                                fragment.mView.setVisibility(8);
                            }
                            fragment.onViewCreated(fragment.mView, fragment.mSavedFragmentState);
                            break;
                        }
                    }
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Fragment ");
                    stringBuilder.append(fragment);
                    stringBuilder.append(" did not call through to super.onAttach()");
                    throw new SuperNotCalledException(stringBuilder.toString());
                    break;
                case 1:
                    break;
                case 2:
                case 3:
                    break;
                case 4:
                    break;
            }
        } else {
            return;
        }
        fragment.mState = newState3;
    }

    void moveToState(Fragment f) {
        moveToState(f, this.mCurState, 0, 0, false);
    }

    void moveToState(int newState, boolean always) {
        moveToState(newState, 0, 0, always);
    }

    void moveToState(int newState, int transit, int transitStyle, boolean always) {
        if (this.mHost == null && newState != 0) {
            throw new IllegalStateException("No host");
        } else if (always || this.mCurState != newState) {
            this.mCurState = newState;
            if (this.mActive != null) {
                boolean loadersRunning = false;
                for (int i = 0; i < this.mActive.size(); i++) {
                    Fragment f = (Fragment) this.mActive.get(i);
                    if (f != null) {
                        moveToState(f, newState, transit, transitStyle, false);
                        if (f.mLoaderManager != null) {
                            loadersRunning |= f.mLoaderManager.hasRunningLoaders();
                        }
                    }
                }
                if (!loadersRunning) {
                    startPendingDeferredFragments();
                }
                if (this.mNeedMenuInvalidate && this.mHost != null && this.mCurState == 5) {
                    this.mHost.onSupportInvalidateOptionsMenu();
                    this.mNeedMenuInvalidate = false;
                }
            }
        }
    }

    void startPendingDeferredFragments() {
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment f = (Fragment) this.mActive.get(i);
                if (f != null) {
                    performPendingDeferredStart(f);
                }
            }
        }
    }

    void makeActive(Fragment f) {
        if (f.mIndex < 0) {
            if (this.mAvailIndices == null || this.mAvailIndices.size() <= 0) {
                if (this.mActive == null) {
                    this.mActive = new ArrayList();
                }
                f.setIndex(this.mActive.size(), this.mParent);
                this.mActive.add(f);
            } else {
                f.setIndex(((Integer) this.mAvailIndices.remove(this.mAvailIndices.size() - 1)).intValue(), this.mParent);
                this.mActive.set(f.mIndex, f);
            }
            if (DEBUG) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Allocated fragment index ");
                stringBuilder.append(f);
                Log.v(str, stringBuilder.toString());
            }
        }
    }

    void makeInactive(Fragment f) {
        if (f.mIndex >= 0) {
            if (DEBUG) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Freeing fragment index ");
                stringBuilder.append(f);
                Log.v(str, stringBuilder.toString());
            }
            this.mActive.set(f.mIndex, null);
            if (this.mAvailIndices == null) {
                this.mAvailIndices = new ArrayList();
            }
            this.mAvailIndices.add(Integer.valueOf(f.mIndex));
            this.mHost.inactivateFragment(f.mWho);
            f.initState();
        }
    }

    public void addFragment(Fragment fragment, boolean moveToStateNow) {
        StringBuilder stringBuilder;
        if (this.mAdded == null) {
            this.mAdded = new ArrayList();
        }
        if (DEBUG) {
            String str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("add: ");
            stringBuilder.append(fragment);
            Log.v(str, stringBuilder.toString());
        }
        makeActive(fragment);
        if (!fragment.mDetached) {
            if (this.mAdded.contains(fragment)) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("Fragment already added: ");
                stringBuilder.append(fragment);
                throw new IllegalStateException(stringBuilder.toString());
            }
            this.mAdded.add(fragment);
            fragment.mAdded = true;
            fragment.mRemoving = false;
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            if (moveToStateNow) {
                moveToState(fragment);
            }
        }
    }

    public void removeFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("remove: ");
            stringBuilder.append(fragment);
            stringBuilder.append(" nesting=");
            stringBuilder.append(fragment.mBackStackNesting);
            Log.v(str, stringBuilder.toString());
        }
        boolean inactive = fragment.isInBackStack() ^ true;
        if (!fragment.mDetached || inactive) {
            if (this.mAdded != null) {
                this.mAdded.remove(fragment);
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mAdded = false;
            fragment.mRemoving = true;
            moveToState(fragment, inactive ? 0 : 1, transition, transitionStyle, false);
        }
    }

    public void hideFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("hide: ");
            stringBuilder.append(fragment);
            Log.v(str, stringBuilder.toString());
        }
        if (!fragment.mHidden) {
            fragment.mHidden = true;
            if (fragment.mView != null) {
                Animation anim = loadAnimation(fragment, transition, null, transitionStyle);
                if (anim != null) {
                    setHWLayerAnimListenerIfAlpha(fragment.mView, anim);
                    fragment.mView.startAnimation(anim);
                }
                fragment.mView.setVisibility(8);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(true);
        }
    }

    public void showFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("show: ");
            stringBuilder.append(fragment);
            Log.v(str, stringBuilder.toString());
        }
        if (fragment.mHidden) {
            fragment.mHidden = false;
            if (fragment.mView != null) {
                Animation anim = loadAnimation(fragment, transition, true, transitionStyle);
                if (anim != null) {
                    setHWLayerAnimListenerIfAlpha(fragment.mView, anim);
                    fragment.mView.startAnimation(anim);
                }
                fragment.mView.setVisibility(0);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(false);
        }
    }

    public void detachFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("detach: ");
            stringBuilder.append(fragment);
            Log.v(str, stringBuilder.toString());
        }
        if (!fragment.mDetached) {
            fragment.mDetached = true;
            if (fragment.mAdded) {
                if (this.mAdded != null) {
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("remove from detach: ");
                        stringBuilder2.append(fragment);
                        Log.v(str2, stringBuilder2.toString());
                    }
                    this.mAdded.remove(fragment);
                }
                if (fragment.mHasMenu && fragment.mMenuVisible) {
                    this.mNeedMenuInvalidate = true;
                }
                fragment.mAdded = false;
                moveToState(fragment, 1, transition, transitionStyle, false);
            }
        }
    }

    public void attachFragment(Fragment fragment, int transition, int transitionStyle) {
        String str;
        StringBuilder stringBuilder;
        if (DEBUG) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("attach: ");
            stringBuilder.append(fragment);
            Log.v(str, stringBuilder.toString());
        }
        if (fragment.mDetached) {
            fragment.mDetached = false;
            if (!fragment.mAdded) {
                if (this.mAdded == null) {
                    this.mAdded = new ArrayList();
                }
                if (this.mAdded.contains(fragment)) {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Fragment already added: ");
                    stringBuilder.append(fragment);
                    throw new IllegalStateException(stringBuilder.toString());
                }
                if (DEBUG) {
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("add from attach: ");
                    stringBuilder.append(fragment);
                    Log.v(str, stringBuilder.toString());
                }
                this.mAdded.add(fragment);
                fragment.mAdded = true;
                if (fragment.mHasMenu && fragment.mMenuVisible) {
                    this.mNeedMenuInvalidate = true;
                }
                moveToState(fragment, this.mCurState, transition, transitionStyle, false);
            }
        }
    }

    public Fragment findFragmentById(int id) {
        int i;
        Fragment f;
        if (this.mAdded != null) {
            for (i = this.mAdded.size() - 1; i >= 0; i--) {
                f = (Fragment) this.mAdded.get(i);
                if (f != null && f.mFragmentId == id) {
                    return f;
                }
            }
        }
        if (this.mActive != null) {
            for (i = this.mActive.size() - 1; i >= 0; i--) {
                f = (Fragment) this.mActive.get(i);
                if (f != null && f.mFragmentId == id) {
                    return f;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByTag(String tag) {
        int i;
        Fragment f;
        if (!(this.mAdded == null || tag == null)) {
            for (i = this.mAdded.size() - 1; i >= 0; i--) {
                f = (Fragment) this.mAdded.get(i);
                if (f != null && tag.equals(f.mTag)) {
                    return f;
                }
            }
        }
        if (!(this.mActive == null || tag == null)) {
            for (i = this.mActive.size() - 1; i >= 0; i--) {
                f = (Fragment) this.mActive.get(i);
                if (f != null && tag.equals(f.mTag)) {
                    return f;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByWho(String who) {
        if (!(this.mActive == null || who == null)) {
            for (int i = this.mActive.size() - 1; i >= 0; i--) {
                Fragment f = (Fragment) this.mActive.get(i);
                if (f != null) {
                    Fragment findFragmentByWho = f.findFragmentByWho(who);
                    f = findFragmentByWho;
                    if (findFragmentByWho != null) {
                        return f;
                    }
                }
            }
        }
        return null;
    }

    private void checkStateLoss() {
        if (this.mStateSaved) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        } else if (this.mNoTransactionsBecause != null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Can not perform this action inside of ");
            stringBuilder.append(this.mNoTransactionsBecause);
            throw new IllegalStateException(stringBuilder.toString());
        }
    }

    public void enqueueAction(Runnable action, boolean allowStateLoss) {
        if (!allowStateLoss) {
            checkStateLoss();
        }
        synchronized (this) {
            if (this.mDestroyed || this.mHost == null) {
                throw new IllegalStateException("Activity has been destroyed");
            }
            if (this.mPendingActions == null) {
                this.mPendingActions = new ArrayList();
            }
            this.mPendingActions.add(action);
            if (this.mPendingActions.size() == 1) {
                this.mHost.getHandler().removeCallbacks(this.mExecCommit);
                this.mHost.getHandler().post(this.mExecCommit);
            }
        }
    }

    public int allocBackStackIndex(BackStackRecord bse) {
        synchronized (this) {
            int index;
            String str;
            StringBuilder stringBuilder;
            if (this.mAvailBackStackIndices == null || this.mAvailBackStackIndices.size() <= 0) {
                if (this.mBackStackIndices == null) {
                    this.mBackStackIndices = new ArrayList();
                }
                index = this.mBackStackIndices.size();
                if (DEBUG) {
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Setting back stack index ");
                    stringBuilder.append(index);
                    stringBuilder.append(" to ");
                    stringBuilder.append(bse);
                    Log.v(str, stringBuilder.toString());
                }
                this.mBackStackIndices.add(bse);
                return index;
            }
            index = ((Integer) this.mAvailBackStackIndices.remove(this.mAvailBackStackIndices.size() - 1)).intValue();
            if (DEBUG) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Adding back stack index ");
                stringBuilder.append(index);
                stringBuilder.append(" with ");
                stringBuilder.append(bse);
                Log.v(str, stringBuilder.toString());
            }
            this.mBackStackIndices.set(index, bse);
            return index;
        }
    }

    public void setBackStackIndex(int index, BackStackRecord bse) {
        synchronized (this) {
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList();
            }
            int N = this.mBackStackIndices.size();
            String str;
            StringBuilder stringBuilder;
            if (index < N) {
                if (DEBUG) {
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Setting back stack index ");
                    stringBuilder.append(index);
                    stringBuilder.append(" to ");
                    stringBuilder.append(bse);
                    Log.v(str, stringBuilder.toString());
                }
                this.mBackStackIndices.set(index, bse);
            } else {
                while (N < index) {
                    this.mBackStackIndices.add(null);
                    if (this.mAvailBackStackIndices == null) {
                        this.mAvailBackStackIndices = new ArrayList();
                    }
                    if (DEBUG) {
                        str = TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("Adding available back stack index ");
                        stringBuilder.append(N);
                        Log.v(str, stringBuilder.toString());
                    }
                    this.mAvailBackStackIndices.add(Integer.valueOf(N));
                    N++;
                }
                if (DEBUG) {
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Adding back stack index ");
                    stringBuilder.append(index);
                    stringBuilder.append(" with ");
                    stringBuilder.append(bse);
                    Log.v(str, stringBuilder.toString());
                }
                this.mBackStackIndices.add(bse);
            }
        }
    }

    public void freeBackStackIndex(int index) {
        synchronized (this) {
            this.mBackStackIndices.set(index, null);
            if (this.mAvailBackStackIndices == null) {
                this.mAvailBackStackIndices = new ArrayList();
            }
            if (DEBUG) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Freeing back stack index ");
                stringBuilder.append(index);
                Log.v(str, stringBuilder.toString());
            }
            this.mAvailBackStackIndices.add(Integer.valueOf(index));
        }
    }

    /* JADX WARNING: Missing block: B:18:0x0051, code:
            r6.mExecutingActions = true;
            r3 = 0;
     */
    /* JADX WARNING: Missing block: B:19:0x0055, code:
            if (r3 >= r2) goto L_0x0066;
     */
    /* JADX WARNING: Missing block: B:20:0x0057, code:
            r6.mTmpActions[r3].run();
            r6.mTmpActions[r3] = null;
            r3 = r3 + 1;
     */
    /* JADX WARNING: Missing block: B:25:0x006d, code:
            if (r6.mHavePendingDeferredStart == false) goto L_0x0099;
     */
    /* JADX WARNING: Missing block: B:26:0x006f, code:
            r3 = false;
            r2 = 0;
     */
    /* JADX WARNING: Missing block: B:28:0x0078, code:
            if (r2 >= r6.mActive.size()) goto L_0x0092;
     */
    /* JADX WARNING: Missing block: B:29:0x007a, code:
            r4 = (android.support.v4.app.Fragment) r6.mActive.get(r2);
     */
    /* JADX WARNING: Missing block: B:30:0x0082, code:
            if (r4 == null) goto L_0x008f;
     */
    /* JADX WARNING: Missing block: B:32:0x0086, code:
            if (r4.mLoaderManager == null) goto L_0x008f;
     */
    /* JADX WARNING: Missing block: B:33:0x0088, code:
            r3 = r3 | r4.mLoaderManager.hasRunningLoaders();
     */
    /* JADX WARNING: Missing block: B:34:0x008f, code:
            r2 = r2 + 1;
     */
    /* JADX WARNING: Missing block: B:35:0x0092, code:
            if (r3 != false) goto L_0x0099;
     */
    /* JADX WARNING: Missing block: B:36:0x0094, code:
            r6.mHavePendingDeferredStart = false;
            startPendingDeferredFragments();
     */
    /* JADX WARNING: Missing block: B:37:0x0099, code:
            return r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean execPendingActions() {
        if (this.mExecutingActions) {
            throw new IllegalStateException("Recursive entry to executePendingTransactions");
        } else if (Looper.myLooper() == this.mHost.getHandler().getLooper()) {
            boolean didSomething = false;
            boolean numActions = didSomething;
            while (true) {
                synchronized (this) {
                    if (this.mPendingActions == null || this.mPendingActions.size() == 0) {
                        break;
                    }
                    int numActions2 = this.mPendingActions.size();
                    if (this.mTmpActions == null || this.mTmpActions.length < numActions2) {
                        this.mTmpActions = new Runnable[numActions2];
                    }
                    this.mPendingActions.toArray(this.mTmpActions);
                    this.mPendingActions.clear();
                    this.mHost.getHandler().removeCallbacks(this.mExecCommit);
                }
                this.mExecutingActions = false;
                didSomething = true;
            }
            while (true) {
            }
        } else {
            throw new IllegalStateException("Must be called from main thread of process");
        }
    }

    void reportBackStackChanged() {
        if (this.mBackStackChangeListeners != null) {
            for (int i = 0; i < this.mBackStackChangeListeners.size(); i++) {
                ((OnBackStackChangedListener) this.mBackStackChangeListeners.get(i)).onBackStackChanged();
            }
        }
    }

    void addBackStackState(BackStackRecord state) {
        if (this.mBackStack == null) {
            this.mBackStack = new ArrayList();
        }
        this.mBackStack.add(state);
        reportBackStackChanged();
    }

    boolean popBackStackState(Handler handler, String name, int id, int flags) {
        String str = name;
        int i = id;
        if (this.mBackStack == null) {
            return false;
        }
        int last;
        if (str == null && i < 0 && (flags & 1) == 0) {
            last = this.mBackStack.size() - 1;
            if (last < 0) {
                return false;
            }
            BackStackRecord bss = (BackStackRecord) this.mBackStack.remove(last);
            SparseArray<Fragment> firstOutFragments = new SparseArray();
            SparseArray<Fragment> lastInFragments = new SparseArray();
            bss.calculateBackFragments(firstOutFragments, lastInFragments);
            bss.popFromBackStack(true, null, firstOutFragments, lastInFragments);
            reportBackStackChanged();
        } else {
            last = -1;
            if (str != null || i >= 0) {
                BackStackRecord bss2;
                last = this.mBackStack.size() - 1;
                while (last >= 0) {
                    bss2 = (BackStackRecord) this.mBackStack.get(last);
                    if ((str != null && str.equals(bss2.getName())) || (i >= 0 && i == bss2.mIndex)) {
                        break;
                    }
                    last--;
                }
                if (last < 0) {
                    return false;
                }
                if ((flags & 1) != 0) {
                    last--;
                    while (last >= 0) {
                        bss2 = (BackStackRecord) this.mBackStack.get(last);
                        if ((str == null || !str.equals(bss2.getName())) && (i < 0 || i != bss2.mIndex)) {
                            break;
                        }
                        last--;
                    }
                }
            }
            if (last == this.mBackStack.size() - 1) {
                return false;
            }
            int i2;
            int i3;
            ArrayList<BackStackRecord> states = new ArrayList();
            for (i2 = this.mBackStack.size() - 1; i2 > last; i2--) {
                states.add(this.mBackStack.remove(i2));
            }
            i2 = states.size() - 1;
            SparseArray<Fragment> firstOutFragments2 = new SparseArray();
            SparseArray<Fragment> lastInFragments2 = new SparseArray();
            for (i3 = 0; i3 <= i2; i3++) {
                ((BackStackRecord) states.get(i3)).calculateBackFragments(firstOutFragments2, lastInFragments2);
            }
            TransitionState state = null;
            i3 = 0;
            while (i3 <= i2) {
                if (DEBUG) {
                    String str2 = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Popping back stack state: ");
                    stringBuilder.append(states.get(i3));
                    Log.v(str2, stringBuilder.toString());
                }
                state = ((BackStackRecord) states.get(i3)).popFromBackStack(i3 == i2, state, firstOutFragments2, lastInFragments2);
                i3++;
            }
            reportBackStackChanged();
        }
        return true;
    }

    ArrayList<Fragment> retainNonConfig() {
        ArrayList<Fragment> fragments = null;
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment f = (Fragment) this.mActive.get(i);
                if (f != null && f.mRetainInstance) {
                    if (fragments == null) {
                        fragments = new ArrayList();
                    }
                    fragments.add(f);
                    f.mRetaining = true;
                    f.mTargetIndex = f.mTarget != null ? f.mTarget.mIndex : -1;
                    if (DEBUG) {
                        String str = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("retainNonConfig: keeping retained ");
                        stringBuilder.append(f);
                        Log.v(str, stringBuilder.toString());
                    }
                }
            }
        }
        return fragments;
    }

    void saveFragmentViewState(Fragment f) {
        if (f.mInnerView != null) {
            if (this.mStateArray == null) {
                this.mStateArray = new SparseArray();
            } else {
                this.mStateArray.clear();
            }
            f.mInnerView.saveHierarchyState(this.mStateArray);
            if (this.mStateArray.size() > 0) {
                f.mSavedViewState = this.mStateArray;
                this.mStateArray = null;
            }
        }
    }

    Bundle saveFragmentBasicState(Fragment f) {
        Bundle result = null;
        if (this.mStateBundle == null) {
            this.mStateBundle = new Bundle();
        }
        f.performSaveInstanceState(this.mStateBundle);
        if (!this.mStateBundle.isEmpty()) {
            result = this.mStateBundle;
            this.mStateBundle = null;
        }
        if (f.mView != null) {
            saveFragmentViewState(f);
        }
        if (f.mSavedViewState != null) {
            if (result == null) {
                result = new Bundle();
            }
            result.putSparseParcelableArray(VIEW_STATE_TAG, f.mSavedViewState);
        }
        if (!f.mUserVisibleHint) {
            if (result == null) {
                result = new Bundle();
            }
            result.putBoolean(USER_VISIBLE_HINT_TAG, f.mUserVisibleHint);
        }
        return result;
    }

    Parcelable saveAllState() {
        execPendingActions();
        if (HONEYCOMB) {
            this.mStateSaved = true;
        }
        if (this.mActive == null || this.mActive.size() <= 0) {
            return null;
        }
        StringBuilder stringBuilder;
        int N = this.mActive.size();
        FragmentState[] active = new FragmentState[N];
        int i = 0;
        boolean haveFragments = false;
        for (int i2 = 0; i2 < N; i2++) {
            Fragment f = (Fragment) this.mActive.get(i2);
            if (f != null) {
                StringBuilder stringBuilder2;
                if (f.mIndex < 0) {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Failure saving state: active ");
                    stringBuilder.append(f);
                    stringBuilder.append(" has cleared index: ");
                    stringBuilder.append(f.mIndex);
                    throwException(new IllegalStateException(stringBuilder.toString()));
                }
                haveFragments = true;
                FragmentState fs = new FragmentState(f);
                active[i2] = fs;
                if (f.mState <= 0 || fs.mSavedFragmentState != null) {
                    fs.mSavedFragmentState = f.mSavedFragmentState;
                } else {
                    fs.mSavedFragmentState = saveFragmentBasicState(f);
                    if (f.mTarget != null) {
                        if (f.mTarget.mIndex < 0) {
                            stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("Failure saving state: ");
                            stringBuilder2.append(f);
                            stringBuilder2.append(" has target not in fragment manager: ");
                            stringBuilder2.append(f.mTarget);
                            throwException(new IllegalStateException(stringBuilder2.toString()));
                        }
                        if (fs.mSavedFragmentState == null) {
                            fs.mSavedFragmentState = new Bundle();
                        }
                        putFragment(fs.mSavedFragmentState, TARGET_STATE_TAG, f.mTarget);
                        if (f.mTargetRequestCode != 0) {
                            fs.mSavedFragmentState.putInt(TARGET_REQUEST_CODE_STATE_TAG, f.mTargetRequestCode);
                        }
                    }
                }
                if (DEBUG) {
                    String str = TAG;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Saved state of ");
                    stringBuilder2.append(f);
                    stringBuilder2.append(": ");
                    stringBuilder2.append(fs.mSavedFragmentState);
                    Log.v(str, stringBuilder2.toString());
                }
            }
        }
        if (haveFragments) {
            int[] added = null;
            BackStackState[] backStack = null;
            if (this.mAdded != null) {
                N = this.mAdded.size();
                if (N > 0) {
                    added = new int[N];
                    for (int i3 = 0; i3 < N; i3++) {
                        added[i3] = ((Fragment) this.mAdded.get(i3)).mIndex;
                        if (added[i3] < 0) {
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("Failure saving state: active ");
                            stringBuilder.append(this.mAdded.get(i3));
                            stringBuilder.append(" has cleared index: ");
                            stringBuilder.append(added[i3]);
                            throwException(new IllegalStateException(stringBuilder.toString()));
                        }
                        if (DEBUG) {
                            String str2 = TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("saveAllState: adding fragment #");
                            stringBuilder.append(i3);
                            stringBuilder.append(": ");
                            stringBuilder.append(this.mAdded.get(i3));
                            Log.v(str2, stringBuilder.toString());
                        }
                    }
                }
            }
            if (this.mBackStack != null) {
                N = this.mBackStack.size();
                if (N > 0) {
                    backStack = new BackStackState[N];
                    while (i < N) {
                        backStack[i] = new BackStackState((BackStackRecord) this.mBackStack.get(i));
                        if (DEBUG) {
                            String str3 = TAG;
                            StringBuilder stringBuilder3 = new StringBuilder();
                            stringBuilder3.append("saveAllState: adding back stack #");
                            stringBuilder3.append(i);
                            stringBuilder3.append(": ");
                            stringBuilder3.append(this.mBackStack.get(i));
                            Log.v(str3, stringBuilder3.toString());
                        }
                        i++;
                    }
                }
            }
            FragmentManagerState fms = new FragmentManagerState();
            fms.mActive = active;
            fms.mAdded = added;
            fms.mBackStack = backStack;
            return fms;
        }
        if (DEBUG) {
            Log.v(TAG, "saveAllState: no fragments!");
        }
        return null;
    }

    void restoreAllState(Parcelable state, List<Fragment> nonConfig) {
        if (state != null) {
            FragmentManagerState fms = (FragmentManagerState) state;
            if (fms.mActive != null) {
                int i;
                Fragment f;
                String str;
                StringBuilder stringBuilder;
                if (nonConfig != null) {
                    for (i = 0; i < nonConfig.size(); i++) {
                        f = (Fragment) nonConfig.get(i);
                        if (DEBUG) {
                            str = TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("restoreAllState: re-attaching retained ");
                            stringBuilder.append(f);
                            Log.v(str, stringBuilder.toString());
                        }
                        FragmentState fs = fms.mActive[f.mIndex];
                        fs.mInstance = f;
                        f.mSavedViewState = null;
                        f.mBackStackNesting = 0;
                        f.mInLayout = false;
                        f.mAdded = false;
                        f.mTarget = null;
                        if (fs.mSavedFragmentState != null) {
                            fs.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
                            f.mSavedViewState = fs.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                            f.mSavedFragmentState = fs.mSavedFragmentState;
                        }
                    }
                }
                this.mActive = new ArrayList(fms.mActive.length);
                if (this.mAvailIndices != null) {
                    this.mAvailIndices.clear();
                }
                for (i = 0; i < fms.mActive.length; i++) {
                    FragmentState fs2 = fms.mActive[i];
                    if (fs2 != null) {
                        Fragment f2 = fs2.instantiate(this.mHost, this.mParent);
                        if (DEBUG) {
                            String str2 = TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("restoreAllState: active #");
                            stringBuilder2.append(i);
                            stringBuilder2.append(": ");
                            stringBuilder2.append(f2);
                            Log.v(str2, stringBuilder2.toString());
                        }
                        this.mActive.add(f2);
                        fs2.mInstance = null;
                    } else {
                        this.mActive.add(null);
                        if (this.mAvailIndices == null) {
                            this.mAvailIndices = new ArrayList();
                        }
                        if (DEBUG) {
                            str = TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("restoreAllState: avail #");
                            stringBuilder.append(i);
                            Log.v(str, stringBuilder.toString());
                        }
                        this.mAvailIndices.add(Integer.valueOf(i));
                    }
                }
                if (nonConfig != null) {
                    for (i = 0; i < nonConfig.size(); i++) {
                        f = (Fragment) nonConfig.get(i);
                        if (f.mTargetIndex >= 0) {
                            if (f.mTargetIndex < this.mActive.size()) {
                                f.mTarget = (Fragment) this.mActive.get(f.mTargetIndex);
                            } else {
                                str = TAG;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("Re-attaching retained fragment ");
                                stringBuilder.append(f);
                                stringBuilder.append(" target no longer exists: ");
                                stringBuilder.append(f.mTargetIndex);
                                Log.w(str, stringBuilder.toString());
                                f.mTarget = null;
                            }
                        }
                    }
                }
                if (fms.mAdded != null) {
                    this.mAdded = new ArrayList(fms.mAdded.length);
                    for (i = 0; i < fms.mAdded.length; i++) {
                        f = (Fragment) this.mActive.get(fms.mAdded[i]);
                        if (f == null) {
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("No instantiated fragment for index #");
                            stringBuilder.append(fms.mAdded[i]);
                            throwException(new IllegalStateException(stringBuilder.toString()));
                        }
                        f.mAdded = true;
                        if (DEBUG) {
                            str = TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("restoreAllState: added #");
                            stringBuilder.append(i);
                            stringBuilder.append(": ");
                            stringBuilder.append(f);
                            Log.v(str, stringBuilder.toString());
                        }
                        if (this.mAdded.contains(f)) {
                            throw new IllegalStateException("Already added!");
                        }
                        this.mAdded.add(f);
                    }
                } else {
                    this.mAdded = null;
                }
                if (fms.mBackStack != null) {
                    this.mBackStack = new ArrayList(fms.mBackStack.length);
                    for (int i2 = 0; i2 < fms.mBackStack.length; i2++) {
                        BackStackRecord bse = fms.mBackStack[i2].instantiate(this);
                        if (DEBUG) {
                            String str3 = TAG;
                            StringBuilder stringBuilder3 = new StringBuilder();
                            stringBuilder3.append("restoreAllState: back stack #");
                            stringBuilder3.append(i2);
                            stringBuilder3.append(" (index ");
                            stringBuilder3.append(bse.mIndex);
                            stringBuilder3.append("): ");
                            stringBuilder3.append(bse);
                            Log.v(str3, stringBuilder3.toString());
                            bse.dump("  ", new PrintWriter(new LogWriter(TAG)), false);
                        }
                        this.mBackStack.add(bse);
                        if (bse.mIndex >= 0) {
                            setBackStackIndex(bse.mIndex, bse);
                        }
                    }
                } else {
                    this.mBackStack = null;
                }
            }
        }
    }

    public void attachController(FragmentHostCallback host, FragmentContainer container, Fragment parent) {
        if (this.mHost == null) {
            this.mHost = host;
            this.mContainer = container;
            this.mParent = parent;
            return;
        }
        throw new IllegalStateException("Already attached");
    }

    public void noteStateNotSaved() {
        this.mStateSaved = false;
    }

    public void dispatchCreate() {
        this.mStateSaved = false;
        moveToState(1, false);
    }

    public void dispatchActivityCreated() {
        this.mStateSaved = false;
        moveToState(2, false);
    }

    public void dispatchStart() {
        this.mStateSaved = false;
        moveToState(4, false);
    }

    public void dispatchResume() {
        this.mStateSaved = false;
        moveToState(5, false);
    }

    public void dispatchPause() {
        moveToState(4, false);
    }

    public void dispatchStop() {
        this.mStateSaved = true;
        moveToState(3, false);
    }

    public void dispatchReallyStop() {
        moveToState(2, false);
    }

    public void dispatchDestroyView() {
        moveToState(1, false);
    }

    public void dispatchDestroy() {
        this.mDestroyed = true;
        execPendingActions();
        moveToState(0, false);
        this.mHost = null;
        this.mContainer = null;
        this.mParent = null;
    }

    public void dispatchConfigurationChanged(Configuration newConfig) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null) {
                    f.performConfigurationChanged(newConfig);
                }
            }
        }
    }

    public void dispatchLowMemory() {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null) {
                    f.performLowMemory();
                }
            }
        }
    }

    public boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        boolean show = false;
        ArrayList<Fragment> newMenus = null;
        int i = 0;
        if (this.mAdded != null) {
            boolean show2 = false;
            for (int i2 = 0; i2 < this.mAdded.size(); i2++) {
                Fragment f = (Fragment) this.mAdded.get(i2);
                if (f != null && f.performCreateOptionsMenu(menu, inflater)) {
                    show2 = true;
                    if (newMenus == null) {
                        newMenus = new ArrayList();
                    }
                    newMenus.add(f);
                }
            }
            show = show2;
        }
        if (this.mCreatedMenus != null) {
            while (true) {
                int i3 = i;
                if (i3 >= this.mCreatedMenus.size()) {
                    break;
                }
                Fragment f2 = (Fragment) this.mCreatedMenus.get(i3);
                if (newMenus == null || !newMenus.contains(f2)) {
                    f2.onDestroyOptionsMenu();
                }
                i = i3 + 1;
            }
        }
        this.mCreatedMenus = newMenus;
        return show;
    }

    public boolean dispatchPrepareOptionsMenu(Menu menu) {
        boolean show = false;
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performPrepareOptionsMenu(menu)) {
                    show = true;
                }
            }
        }
        return show;
    }

    public boolean dispatchOptionsItemSelected(MenuItem item) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performOptionsItemSelected(item)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean dispatchContextItemSelected(MenuItem item) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performContextItemSelected(item)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void dispatchOptionsMenuClosed(Menu menu) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null) {
                    f.performOptionsMenuClosed(menu);
                }
            }
        }
    }

    public static int reverseTransit(int transit) {
        if (transit == 4097) {
            return 8194;
        }
        if (transit == 4099) {
            return 4099;
        }
        if (transit != 8194) {
            return 0;
        }
        return 4097;
    }

    public static int transitToStyleIndex(int transit, boolean enter) {
        if (transit == 4097) {
            return enter ? 1 : 2;
        } else if (transit == 4099) {
            return enter ? 5 : 6;
        } else if (transit != 8194) {
            return -1;
        } else {
            return enter ? 3 : 4;
        }
    }

    public View onCreateView(View parent, String name, Context context, AttributeSet attrs) {
        Context context2 = context;
        AttributeSet attributeSet = attrs;
        Fragment fragment = null;
        if (!"fragment".equals(name)) {
            return null;
        }
        String fname = attributeSet.getAttributeValue(null, "class");
        TypedArray a = context2.obtainStyledAttributes(attributeSet, FragmentTag.Fragment);
        int i = 0;
        if (fname == null) {
            fname = a.getString(0);
        }
        String fname2 = fname;
        int id = a.getResourceId(1, -1);
        String tag = a.getString(2);
        a.recycle();
        if (!Fragment.isSupportFragmentClass(this.mHost.getContext(), fname2)) {
            return null;
        }
        if (parent != null) {
            i = parent.getId();
        }
        int containerId = i;
        StringBuilder stringBuilder;
        if (containerId == -1 && id == -1 && tag == null) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(attrs.getPositionDescription());
            stringBuilder.append(": Must specify unique android:id, android:tag, or have a parent with an id for ");
            stringBuilder.append(fname2);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
        StringBuilder stringBuilder2;
        Fragment fragment2;
        Fragment fragment3;
        if (id != -1) {
            fragment = findFragmentById(id);
        }
        if (fragment == null && tag != null) {
            fragment = findFragmentByTag(tag);
        }
        if (fragment == null && containerId != -1) {
            fragment = findFragmentById(containerId);
        }
        if (DEBUG) {
            fname = TAG;
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("onCreateView: id=0x");
            stringBuilder2.append(Integer.toHexString(id));
            stringBuilder2.append(" fname=");
            stringBuilder2.append(fname2);
            stringBuilder2.append(" existing=");
            stringBuilder2.append(fragment);
            Log.v(fname, stringBuilder2.toString());
        }
        if (fragment == null) {
            Fragment fragment4 = Fragment.instantiate(context2, fname2);
            fragment4.mFromLayout = true;
            fragment4.mFragmentId = id != 0 ? id : containerId;
            fragment4.mContainerId = containerId;
            fragment4.mTag = tag;
            fragment4.mInLayout = true;
            fragment4.mFragmentManager = this;
            fragment4.onInflate(this.mHost.getContext(), attributeSet, fragment4.mSavedFragmentState);
            addFragment(fragment4, true);
            fragment2 = fragment4;
        } else if (fragment.mInLayout) {
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append(attrs.getPositionDescription());
            stringBuilder2.append(": Duplicate id 0x");
            stringBuilder2.append(Integer.toHexString(id));
            stringBuilder2.append(", tag ");
            stringBuilder2.append(tag);
            stringBuilder2.append(", or parent id 0x");
            stringBuilder2.append(Integer.toHexString(containerId));
            stringBuilder2.append(" with another fragment for ");
            stringBuilder2.append(fname2);
            throw new IllegalArgumentException(stringBuilder2.toString());
        } else {
            fragment.mInLayout = true;
            if (!fragment.mRetaining) {
                fragment.onInflate(this.mHost.getContext(), attributeSet, fragment.mSavedFragmentState);
            }
            fragment2 = fragment;
        }
        if (this.mCurState >= 1 || !fragment2.mFromLayout) {
            fragment3 = fragment2;
            moveToState(fragment3);
        } else {
            fragment3 = fragment2;
            moveToState(fragment2, 1, 0, 0, null);
        }
        if (fragment3.mView != null) {
            if (id != 0) {
                fragment3.mView.setId(id);
            }
            if (fragment3.mView.getTag() == null) {
                fragment3.mView.setTag(tag);
            }
            return fragment3.mView;
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append("Fragment ");
        stringBuilder.append(fname2);
        stringBuilder.append(" did not create a view.");
        throw new IllegalStateException(stringBuilder.toString());
    }

    LayoutInflaterFactory getLayoutInflaterFactory() {
        return this;
    }
}
