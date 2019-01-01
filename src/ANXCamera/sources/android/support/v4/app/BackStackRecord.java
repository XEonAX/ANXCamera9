package android.support.v4.app;

import android.os.Build.VERSION;
import android.support.v4.app.FragmentManager.BackStackEntry;
import android.support.v4.app.FragmentTransitionCompat21.EpicenterView;
import android.support.v4.app.FragmentTransitionCompat21.ViewRetriever;
import android.support.v4.util.ArrayMap;
import android.support.v4.util.LogWriter;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver.OnPreDrawListener;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;

final class BackStackRecord extends FragmentTransaction implements BackStackEntry, Runnable {
    static final int OP_ADD = 1;
    static final int OP_ATTACH = 7;
    static final int OP_DETACH = 6;
    static final int OP_HIDE = 4;
    static final int OP_NULL = 0;
    static final int OP_REMOVE = 3;
    static final int OP_REPLACE = 2;
    static final int OP_SHOW = 5;
    static final boolean SUPPORTS_TRANSITIONS = (VERSION.SDK_INT >= 21);
    static final String TAG = "FragmentManager";
    boolean mAddToBackStack;
    boolean mAllowAddToBackStack = true;
    int mBreadCrumbShortTitleRes;
    CharSequence mBreadCrumbShortTitleText;
    int mBreadCrumbTitleRes;
    CharSequence mBreadCrumbTitleText;
    boolean mCommitted;
    int mEnterAnim;
    int mExitAnim;
    Op mHead;
    int mIndex = -1;
    final FragmentManagerImpl mManager;
    String mName;
    int mNumOp;
    int mPopEnterAnim;
    int mPopExitAnim;
    ArrayList<String> mSharedElementSourceNames;
    ArrayList<String> mSharedElementTargetNames;
    Op mTail;
    int mTransition;
    int mTransitionStyle;

    static final class Op {
        int cmd;
        int enterAnim;
        int exitAnim;
        Fragment fragment;
        Op next;
        int popEnterAnim;
        int popExitAnim;
        Op prev;
        ArrayList<Fragment> removed;

        Op() {
        }
    }

    public class TransitionState {
        public EpicenterView enteringEpicenterView = new EpicenterView();
        public ArrayList<View> hiddenFragmentViews = new ArrayList();
        public ArrayMap<String, String> nameOverrides = new ArrayMap();
        public View nonExistentView;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("BackStackEntry{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        if (this.mIndex >= 0) {
            sb.append(" #");
            sb.append(this.mIndex);
        }
        if (this.mName != null) {
            sb.append(" ");
            sb.append(this.mName);
        }
        sb.append("}");
        return sb.toString();
    }

    public void dump(String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
        dump(prefix, writer, true);
    }

    public void dump(String prefix, PrintWriter writer, boolean full) {
        if (full) {
            writer.print(prefix);
            writer.print("mName=");
            writer.print(this.mName);
            writer.print(" mIndex=");
            writer.print(this.mIndex);
            writer.print(" mCommitted=");
            writer.println(this.mCommitted);
            if (this.mTransition != 0) {
                writer.print(prefix);
                writer.print("mTransition=#");
                writer.print(Integer.toHexString(this.mTransition));
                writer.print(" mTransitionStyle=#");
                writer.println(Integer.toHexString(this.mTransitionStyle));
            }
            if (!(this.mEnterAnim == 0 && this.mExitAnim == 0)) {
                writer.print(prefix);
                writer.print("mEnterAnim=#");
                writer.print(Integer.toHexString(this.mEnterAnim));
                writer.print(" mExitAnim=#");
                writer.println(Integer.toHexString(this.mExitAnim));
            }
            if (!(this.mPopEnterAnim == 0 && this.mPopExitAnim == 0)) {
                writer.print(prefix);
                writer.print("mPopEnterAnim=#");
                writer.print(Integer.toHexString(this.mPopEnterAnim));
                writer.print(" mPopExitAnim=#");
                writer.println(Integer.toHexString(this.mPopExitAnim));
            }
            if (!(this.mBreadCrumbTitleRes == 0 && this.mBreadCrumbTitleText == null)) {
                writer.print(prefix);
                writer.print("mBreadCrumbTitleRes=#");
                writer.print(Integer.toHexString(this.mBreadCrumbTitleRes));
                writer.print(" mBreadCrumbTitleText=");
                writer.println(this.mBreadCrumbTitleText);
            }
            if (!(this.mBreadCrumbShortTitleRes == 0 && this.mBreadCrumbShortTitleText == null)) {
                writer.print(prefix);
                writer.print("mBreadCrumbShortTitleRes=#");
                writer.print(Integer.toHexString(this.mBreadCrumbShortTitleRes));
                writer.print(" mBreadCrumbShortTitleText=");
                writer.println(this.mBreadCrumbShortTitleText);
            }
        }
        if (this.mHead != null) {
            writer.print(prefix);
            writer.println("Operations:");
            String innerPrefix = new StringBuilder();
            innerPrefix.append(prefix);
            innerPrefix.append("    ");
            innerPrefix = innerPrefix.toString();
            String cmdStr = null;
            Op op = this.mHead;
            int num = 0;
            while (op != null) {
                switch (op.cmd) {
                    case 0:
                        cmdStr = "NULL";
                        break;
                    case 1:
                        cmdStr = "ADD";
                        break;
                    case 2:
                        cmdStr = "REPLACE";
                        break;
                    case 3:
                        cmdStr = "REMOVE";
                        break;
                    case 4:
                        cmdStr = "HIDE";
                        break;
                    case 5:
                        cmdStr = "SHOW";
                        break;
                    case 6:
                        cmdStr = "DETACH";
                        break;
                    case 7:
                        cmdStr = "ATTACH";
                        break;
                    default:
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("cmd=");
                        stringBuilder.append(op.cmd);
                        cmdStr = stringBuilder.toString();
                        break;
                }
                writer.print(prefix);
                writer.print("  Op #");
                writer.print(num);
                writer.print(": ");
                writer.print(cmdStr);
                writer.print(" ");
                writer.println(op.fragment);
                if (full) {
                    if (!(op.enterAnim == 0 && op.exitAnim == 0)) {
                        writer.print(prefix);
                        writer.print("enterAnim=#");
                        writer.print(Integer.toHexString(op.enterAnim));
                        writer.print(" exitAnim=#");
                        writer.println(Integer.toHexString(op.exitAnim));
                    }
                    if (!(op.popEnterAnim == 0 && op.popExitAnim == 0)) {
                        writer.print(prefix);
                        writer.print("popEnterAnim=#");
                        writer.print(Integer.toHexString(op.popEnterAnim));
                        writer.print(" popExitAnim=#");
                        writer.println(Integer.toHexString(op.popExitAnim));
                    }
                }
                if (op.removed != null && op.removed.size() > 0) {
                    for (int i = 0; i < op.removed.size(); i++) {
                        writer.print(innerPrefix);
                        if (op.removed.size() == 1) {
                            writer.print("Removed: ");
                        } else {
                            if (i == 0) {
                                writer.println("Removed:");
                            }
                            writer.print(innerPrefix);
                            writer.print("  #");
                            writer.print(i);
                            writer.print(": ");
                        }
                        writer.println(op.removed.get(i));
                    }
                }
                op = op.next;
                num++;
            }
        }
    }

    public BackStackRecord(FragmentManagerImpl manager) {
        this.mManager = manager;
    }

    public int getId() {
        return this.mIndex;
    }

    public int getBreadCrumbTitleRes() {
        return this.mBreadCrumbTitleRes;
    }

    public int getBreadCrumbShortTitleRes() {
        return this.mBreadCrumbShortTitleRes;
    }

    public CharSequence getBreadCrumbTitle() {
        if (this.mBreadCrumbTitleRes != 0) {
            return this.mManager.mHost.getContext().getText(this.mBreadCrumbTitleRes);
        }
        return this.mBreadCrumbTitleText;
    }

    public CharSequence getBreadCrumbShortTitle() {
        if (this.mBreadCrumbShortTitleRes != 0) {
            return this.mManager.mHost.getContext().getText(this.mBreadCrumbShortTitleRes);
        }
        return this.mBreadCrumbShortTitleText;
    }

    void addOp(Op op) {
        if (this.mHead == null) {
            this.mTail = op;
            this.mHead = op;
        } else {
            op.prev = this.mTail;
            this.mTail.next = op;
            this.mTail = op;
        }
        op.enterAnim = this.mEnterAnim;
        op.exitAnim = this.mExitAnim;
        op.popEnterAnim = this.mPopEnterAnim;
        op.popExitAnim = this.mPopExitAnim;
        this.mNumOp++;
    }

    public FragmentTransaction add(Fragment fragment, String tag) {
        doAddOp(0, fragment, tag, 1);
        return this;
    }

    public FragmentTransaction add(int containerViewId, Fragment fragment) {
        doAddOp(containerViewId, fragment, null, 1);
        return this;
    }

    public FragmentTransaction add(int containerViewId, Fragment fragment, String tag) {
        doAddOp(containerViewId, fragment, tag, 1);
        return this;
    }

    private void doAddOp(int containerViewId, Fragment fragment, String tag, int opcmd) {
        StringBuilder stringBuilder;
        fragment.mFragmentManager = this.mManager;
        if (tag != null) {
            if (fragment.mTag == null || tag.equals(fragment.mTag)) {
                fragment.mTag = tag;
            } else {
                stringBuilder = new StringBuilder();
                stringBuilder.append("Can't change tag of fragment ");
                stringBuilder.append(fragment);
                stringBuilder.append(": was ");
                stringBuilder.append(fragment.mTag);
                stringBuilder.append(" now ");
                stringBuilder.append(tag);
                throw new IllegalStateException(stringBuilder.toString());
            }
        }
        if (containerViewId != 0) {
            if (fragment.mFragmentId == 0 || fragment.mFragmentId == containerViewId) {
                fragment.mFragmentId = containerViewId;
                fragment.mContainerId = containerViewId;
            } else {
                stringBuilder = new StringBuilder();
                stringBuilder.append("Can't change container ID of fragment ");
                stringBuilder.append(fragment);
                stringBuilder.append(": was ");
                stringBuilder.append(fragment.mFragmentId);
                stringBuilder.append(" now ");
                stringBuilder.append(containerViewId);
                throw new IllegalStateException(stringBuilder.toString());
            }
        }
        Op op = new Op();
        op.cmd = opcmd;
        op.fragment = fragment;
        addOp(op);
    }

    public FragmentTransaction replace(int containerViewId, Fragment fragment) {
        return replace(containerViewId, fragment, null);
    }

    public FragmentTransaction replace(int containerViewId, Fragment fragment, String tag) {
        if (containerViewId != 0) {
            doAddOp(containerViewId, fragment, tag, 2);
            return this;
        }
        throw new IllegalArgumentException("Must use non-zero containerViewId");
    }

    public FragmentTransaction remove(Fragment fragment) {
        Op op = new Op();
        op.cmd = 3;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public FragmentTransaction hide(Fragment fragment) {
        Op op = new Op();
        op.cmd = 4;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public FragmentTransaction show(Fragment fragment) {
        Op op = new Op();
        op.cmd = 5;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public FragmentTransaction detach(Fragment fragment) {
        Op op = new Op();
        op.cmd = 6;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public FragmentTransaction attach(Fragment fragment) {
        Op op = new Op();
        op.cmd = 7;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public FragmentTransaction setCustomAnimations(int enter, int exit) {
        return setCustomAnimations(enter, exit, 0, 0);
    }

    public FragmentTransaction setCustomAnimations(int enter, int exit, int popEnter, int popExit) {
        this.mEnterAnim = enter;
        this.mExitAnim = exit;
        this.mPopEnterAnim = popEnter;
        this.mPopExitAnim = popExit;
        return this;
    }

    public FragmentTransaction setTransition(int transition) {
        this.mTransition = transition;
        return this;
    }

    public FragmentTransaction addSharedElement(View sharedElement, String name) {
        if (SUPPORTS_TRANSITIONS) {
            String transitionName = FragmentTransitionCompat21.getTransitionName(sharedElement);
            if (transitionName != null) {
                if (this.mSharedElementSourceNames == null) {
                    this.mSharedElementSourceNames = new ArrayList();
                    this.mSharedElementTargetNames = new ArrayList();
                }
                this.mSharedElementSourceNames.add(transitionName);
                this.mSharedElementTargetNames.add(name);
            } else {
                throw new IllegalArgumentException("Unique transitionNames are required for all sharedElements");
            }
        }
        return this;
    }

    public FragmentTransaction setTransitionStyle(int styleRes) {
        this.mTransitionStyle = styleRes;
        return this;
    }

    public FragmentTransaction addToBackStack(String name) {
        if (this.mAllowAddToBackStack) {
            this.mAddToBackStack = true;
            this.mName = name;
            return this;
        }
        throw new IllegalStateException("This FragmentTransaction is not allowed to be added to the back stack.");
    }

    public boolean isAddToBackStackAllowed() {
        return this.mAllowAddToBackStack;
    }

    public FragmentTransaction disallowAddToBackStack() {
        if (this.mAddToBackStack) {
            throw new IllegalStateException("This transaction is already being added to the back stack");
        }
        this.mAllowAddToBackStack = false;
        return this;
    }

    public FragmentTransaction setBreadCrumbTitle(int res) {
        this.mBreadCrumbTitleRes = res;
        this.mBreadCrumbTitleText = null;
        return this;
    }

    public FragmentTransaction setBreadCrumbTitle(CharSequence text) {
        this.mBreadCrumbTitleRes = 0;
        this.mBreadCrumbTitleText = text;
        return this;
    }

    public FragmentTransaction setBreadCrumbShortTitle(int res) {
        this.mBreadCrumbShortTitleRes = res;
        this.mBreadCrumbShortTitleText = null;
        return this;
    }

    public FragmentTransaction setBreadCrumbShortTitle(CharSequence text) {
        this.mBreadCrumbShortTitleRes = 0;
        this.mBreadCrumbShortTitleText = text;
        return this;
    }

    void bumpBackStackNesting(int amt) {
        if (this.mAddToBackStack) {
            if (FragmentManagerImpl.DEBUG) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Bump nesting in ");
                stringBuilder.append(this);
                stringBuilder.append(" by ");
                stringBuilder.append(amt);
                Log.v(str, stringBuilder.toString());
            }
            for (Op op = this.mHead; op != null; op = op.next) {
                if (op.fragment != null) {
                    Fragment fragment = op.fragment;
                    fragment.mBackStackNesting += amt;
                    if (FragmentManagerImpl.DEBUG) {
                        String str2 = TAG;
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Bump nesting of ");
                        stringBuilder2.append(op.fragment);
                        stringBuilder2.append(" to ");
                        stringBuilder2.append(op.fragment.mBackStackNesting);
                        Log.v(str2, stringBuilder2.toString());
                    }
                }
                if (op.removed != null) {
                    for (int i = op.removed.size() - 1; i >= 0; i--) {
                        Fragment r = (Fragment) op.removed.get(i);
                        r.mBackStackNesting += amt;
                        if (FragmentManagerImpl.DEBUG) {
                            String str3 = TAG;
                            StringBuilder stringBuilder3 = new StringBuilder();
                            stringBuilder3.append("Bump nesting of ");
                            stringBuilder3.append(r);
                            stringBuilder3.append(" to ");
                            stringBuilder3.append(r.mBackStackNesting);
                            Log.v(str3, stringBuilder3.toString());
                        }
                    }
                }
            }
        }
    }

    public int commit() {
        return commitInternal(false);
    }

    public int commitAllowingStateLoss() {
        return commitInternal(true);
    }

    int commitInternal(boolean allowStateLoss) {
        if (this.mCommitted) {
            throw new IllegalStateException("commit already called");
        }
        if (FragmentManagerImpl.DEBUG) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Commit: ");
            stringBuilder.append(this);
            Log.v(str, stringBuilder.toString());
            dump("  ", null, new PrintWriter(new LogWriter(TAG)), null);
        }
        this.mCommitted = true;
        if (this.mAddToBackStack) {
            this.mIndex = this.mManager.allocBackStackIndex(this);
        } else {
            this.mIndex = -1;
        }
        this.mManager.enqueueAction(this, allowStateLoss);
        return this.mIndex;
    }

    public void run() {
        String str;
        if (FragmentManagerImpl.DEBUG) {
            str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Run: ");
            stringBuilder.append(this);
            Log.v(str, stringBuilder.toString());
        }
        if (!this.mAddToBackStack || this.mIndex >= 0) {
            bumpBackStackNesting(1);
            TransitionState state = null;
            boolean z = false;
            if (SUPPORTS_TRANSITIONS) {
                SparseArray<Fragment> firstOutFragments = new SparseArray();
                SparseArray<Fragment> lastInFragments = new SparseArray();
                calculateFragments(firstOutFragments, lastInFragments);
                state = beginTransition(firstOutFragments, lastInFragments, false);
            }
            int transitionStyle = state != null ? 0 : this.mTransitionStyle;
            int transition = state != null ? 0 : this.mTransition;
            Op op = this.mHead;
            while (op != null) {
                int enterAnim = state != null ? z : op.enterAnim;
                int exitAnim = state != null ? z : op.exitAnim;
                Fragment f;
                StringBuilder stringBuilder2;
                switch (op.cmd) {
                    case 1:
                        Fragment f2 = op.fragment;
                        f2.mNextAnim = enterAnim;
                        this.mManager.addFragment(f2, z);
                        break;
                    case 2:
                        Fragment f3;
                        f = op.fragment;
                        int containerId = f.mContainerId;
                        if (this.mManager.mAdded != null) {
                            f3 = f;
                            for (f = z; f < this.mManager.mAdded.size(); f++) {
                                Fragment old = (Fragment) this.mManager.mAdded.get(f);
                                if (FragmentManagerImpl.DEBUG) {
                                    String str2 = TAG;
                                    stringBuilder2 = new StringBuilder();
                                    stringBuilder2.append("OP_REPLACE: adding=");
                                    stringBuilder2.append(f3);
                                    stringBuilder2.append(" old=");
                                    stringBuilder2.append(old);
                                    Log.v(str2, stringBuilder2.toString());
                                }
                                if (old.mContainerId == containerId) {
                                    if (old == f3) {
                                        f3 = null;
                                        op.fragment = null;
                                    } else {
                                        if (op.removed == null) {
                                            op.removed = new ArrayList();
                                        }
                                        op.removed.add(old);
                                        old.mNextAnim = exitAnim;
                                        if (this.mAddToBackStack) {
                                            old.mBackStackNesting++;
                                            if (FragmentManagerImpl.DEBUG) {
                                                str = TAG;
                                                stringBuilder2 = new StringBuilder();
                                                stringBuilder2.append("Bump nesting of ");
                                                stringBuilder2.append(old);
                                                stringBuilder2.append(" to ");
                                                stringBuilder2.append(old.mBackStackNesting);
                                                Log.v(str, stringBuilder2.toString());
                                            }
                                        }
                                        this.mManager.removeFragment(old, transition, transitionStyle);
                                    }
                                }
                            }
                        } else {
                            f3 = f;
                        }
                        if (f3 == null) {
                            z = false;
                            break;
                        }
                        f3.mNextAnim = enterAnim;
                        z = false;
                        this.mManager.addFragment(f3, false);
                        break;
                    case 3:
                        f = op.fragment;
                        f.mNextAnim = exitAnim;
                        this.mManager.removeFragment(f, transition, transitionStyle);
                        break;
                    case 4:
                        f = op.fragment;
                        f.mNextAnim = exitAnim;
                        this.mManager.hideFragment(f, transition, transitionStyle);
                        break;
                    case 5:
                        f = op.fragment;
                        f.mNextAnim = enterAnim;
                        this.mManager.showFragment(f, transition, transitionStyle);
                        break;
                    case 6:
                        f = op.fragment;
                        f.mNextAnim = exitAnim;
                        this.mManager.detachFragment(f, transition, transitionStyle);
                        break;
                    case 7:
                        f = op.fragment;
                        f.mNextAnim = enterAnim;
                        this.mManager.attachFragment(f, transition, transitionStyle);
                        break;
                    default:
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Unknown cmd: ");
                        stringBuilder2.append(op.cmd);
                        throw new IllegalArgumentException(stringBuilder2.toString());
                }
                op = op.next;
            }
            this.mManager.moveToState(this.mManager.mCurState, transition, transitionStyle, true);
            if (this.mAddToBackStack) {
                this.mManager.addBackStackState(this);
                return;
            }
            return;
        }
        throw new IllegalStateException("addToBackStack() called after commit()");
    }

    private static void setFirstOut(SparseArray<Fragment> fragments, Fragment fragment) {
        if (fragment != null) {
            int containerId = fragment.mContainerId;
            if (containerId != 0 && !fragment.isHidden() && fragment.isAdded() && fragment.getView() != null && fragments.get(containerId) == null) {
                fragments.put(containerId, fragment);
            }
        }
    }

    private void setLastIn(SparseArray<Fragment> fragments, Fragment fragment) {
        if (fragment != null) {
            int containerId = fragment.mContainerId;
            if (containerId != 0) {
                fragments.put(containerId, fragment);
            }
        }
    }

    private void calculateFragments(SparseArray<Fragment> firstOutFragments, SparseArray<Fragment> lastInFragments) {
        if (this.mManager.mContainer.onHasView()) {
            for (Op op = this.mHead; op != null; op = op.next) {
                switch (op.cmd) {
                    case 1:
                        setLastIn(lastInFragments, op.fragment);
                        break;
                    case 2:
                        Fragment f = op.fragment;
                        if (this.mManager.mAdded != null) {
                            for (int i = 0; i < this.mManager.mAdded.size(); i++) {
                                Fragment old = (Fragment) this.mManager.mAdded.get(i);
                                if (f == null || old.mContainerId == f.mContainerId) {
                                    if (old == f) {
                                        f = null;
                                    } else {
                                        setFirstOut(firstOutFragments, old);
                                    }
                                }
                            }
                        }
                        setLastIn(lastInFragments, f);
                        break;
                    case 3:
                        setFirstOut(firstOutFragments, op.fragment);
                        break;
                    case 4:
                        setFirstOut(firstOutFragments, op.fragment);
                        break;
                    case 5:
                        setLastIn(lastInFragments, op.fragment);
                        break;
                    case 6:
                        setFirstOut(firstOutFragments, op.fragment);
                        break;
                    case 7:
                        setLastIn(lastInFragments, op.fragment);
                        break;
                    default:
                        break;
                }
            }
        }
    }

    public void calculateBackFragments(SparseArray<Fragment> firstOutFragments, SparseArray<Fragment> lastInFragments) {
        if (this.mManager.mContainer.onHasView()) {
            for (Op op = this.mHead; op != null; op = op.next) {
                switch (op.cmd) {
                    case 1:
                        setFirstOut(firstOutFragments, op.fragment);
                        break;
                    case 2:
                        if (op.removed != null) {
                            for (int i = op.removed.size() - 1; i >= 0; i--) {
                                setLastIn(lastInFragments, (Fragment) op.removed.get(i));
                            }
                        }
                        setFirstOut(firstOutFragments, op.fragment);
                        break;
                    case 3:
                        setLastIn(lastInFragments, op.fragment);
                        break;
                    case 4:
                        setLastIn(lastInFragments, op.fragment);
                        break;
                    case 5:
                        setFirstOut(firstOutFragments, op.fragment);
                        break;
                    case 6:
                        setLastIn(lastInFragments, op.fragment);
                        break;
                    case 7:
                        setFirstOut(firstOutFragments, op.fragment);
                        break;
                    default:
                        break;
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x0067  */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x0065  */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x006d  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x006b  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0073  */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x0126  */
    /* JADX WARNING: Removed duplicated region for block: B:54:0x0138  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public TransitionState popFromBackStack(boolean doStateMove, TransitionState state, SparseArray<Fragment> firstOutFragments, SparseArray<Fragment> lastInFragments) {
        SparseArray<Fragment> sparseArray;
        SparseArray<Fragment> sparseArray2;
        int transitionStyle;
        int transition;
        Op op;
        TransitionState state2 = state;
        if (FragmentManagerImpl.DEBUG) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("popFromBackStack: ");
            stringBuilder.append(this);
            Log.v(str, stringBuilder.toString());
            dump("  ", null, new PrintWriter(new LogWriter(TAG)), null);
        }
        if (SUPPORTS_TRANSITIONS) {
            if (state2 != null) {
                sparseArray = firstOutFragments;
                sparseArray2 = lastInFragments;
                if (!doStateMove) {
                    setNameOverrides(state2, this.mSharedElementTargetNames, this.mSharedElementSourceNames);
                }
            } else if (!(firstOutFragments.size() == 0 && lastInFragments.size() == 0)) {
                state2 = beginTransition(firstOutFragments, lastInFragments, true);
            }
            bumpBackStackNesting(-1);
            transitionStyle = state2 == null ? 0 : this.mTransitionStyle;
            transition = state2 == null ? 0 : this.mTransition;
            op = this.mTail;
            while (op != null) {
                int popEnterAnim = state2 != null ? 0 : op.popEnterAnim;
                int popExitAnim = state2 != null ? 0 : op.popExitAnim;
                Fragment f;
                switch (op.cmd) {
                    case 1:
                        Fragment f2 = op.fragment;
                        f2.mNextAnim = popExitAnim;
                        this.mManager.removeFragment(f2, FragmentManagerImpl.reverseTransit(transition), transitionStyle);
                        break;
                    case 2:
                        f = op.fragment;
                        if (f != null) {
                            f.mNextAnim = popExitAnim;
                            this.mManager.removeFragment(f, FragmentManagerImpl.reverseTransit(transition), transitionStyle);
                        }
                        if (op.removed == null) {
                            break;
                        }
                        for (int i = 0; i < op.removed.size(); i++) {
                            Fragment old = (Fragment) op.removed.get(i);
                            old.mNextAnim = popEnterAnim;
                            this.mManager.addFragment(old, false);
                        }
                        break;
                    case 3:
                        f = op.fragment;
                        f.mNextAnim = popEnterAnim;
                        this.mManager.addFragment(f, false);
                        break;
                    case 4:
                        f = op.fragment;
                        f.mNextAnim = popEnterAnim;
                        this.mManager.showFragment(f, FragmentManagerImpl.reverseTransit(transition), transitionStyle);
                        break;
                    case 5:
                        f = op.fragment;
                        f.mNextAnim = popExitAnim;
                        this.mManager.hideFragment(f, FragmentManagerImpl.reverseTransit(transition), transitionStyle);
                        break;
                    case 6:
                        f = op.fragment;
                        f.mNextAnim = popEnterAnim;
                        this.mManager.attachFragment(f, FragmentManagerImpl.reverseTransit(transition), transitionStyle);
                        break;
                    case 7:
                        f = op.fragment;
                        f.mNextAnim = popEnterAnim;
                        this.mManager.detachFragment(f, FragmentManagerImpl.reverseTransit(transition), transitionStyle);
                        break;
                    default:
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Unknown cmd: ");
                        stringBuilder2.append(op.cmd);
                        throw new IllegalArgumentException(stringBuilder2.toString());
                }
                op = op.prev;
            }
            if (doStateMove) {
                this.mManager.moveToState(this.mManager.mCurState, FragmentManagerImpl.reverseTransit(transition), transitionStyle, true);
                state2 = null;
            }
            if (this.mIndex >= 0) {
                this.mManager.freeBackStackIndex(this.mIndex);
                this.mIndex = -1;
            }
            return state2;
        }
        sparseArray = firstOutFragments;
        sparseArray2 = lastInFragments;
        bumpBackStackNesting(-1);
        if (state2 == null) {
        }
        if (state2 == null) {
        }
        op = this.mTail;
        while (op != null) {
        }
        if (doStateMove) {
        }
        if (this.mIndex >= 0) {
        }
        return state2;
    }

    public String getName() {
        return this.mName;
    }

    public int getTransition() {
        return this.mTransition;
    }

    public int getTransitionStyle() {
        return this.mTransitionStyle;
    }

    public boolean isEmpty() {
        return this.mNumOp == 0;
    }

    private TransitionState beginTransition(SparseArray<Fragment> firstOutFragments, SparseArray<Fragment> lastInFragments, boolean isBack) {
        int i;
        TransitionState state = new TransitionState();
        state.nonExistentView = new View(this.mManager.mHost.getContext());
        int i2 = 0;
        boolean anyTransitionStarted = false;
        int i3 = 0;
        while (true) {
            i = i3;
            if (i >= firstOutFragments.size()) {
                break;
            }
            if (configureTransitions(firstOutFragments.keyAt(i), state, isBack, firstOutFragments, lastInFragments)) {
                anyTransitionStarted = true;
            }
            i3 = i + 1;
        }
        while (i2 < lastInFragments.size()) {
            i = lastInFragments.keyAt(i2);
            if (firstOutFragments.get(i) == null && configureTransitions(i, state, isBack, firstOutFragments, lastInFragments)) {
                anyTransitionStarted = true;
            }
            i2++;
        }
        if (anyTransitionStarted) {
            return state;
        }
        return null;
    }

    private static Object getEnterTransition(Fragment inFragment, boolean isBack) {
        if (inFragment == null) {
            return null;
        }
        return FragmentTransitionCompat21.cloneTransition(isBack ? inFragment.getReenterTransition() : inFragment.getEnterTransition());
    }

    private static Object getExitTransition(Fragment outFragment, boolean isBack) {
        if (outFragment == null) {
            return null;
        }
        return FragmentTransitionCompat21.cloneTransition(isBack ? outFragment.getReturnTransition() : outFragment.getExitTransition());
    }

    private static Object getSharedElementTransition(Fragment inFragment, Fragment outFragment, boolean isBack) {
        if (inFragment == null || outFragment == null) {
            return null;
        }
        return FragmentTransitionCompat21.wrapSharedElementTransition(isBack ? outFragment.getSharedElementReturnTransition() : inFragment.getSharedElementEnterTransition());
    }

    private static Object captureExitingViews(Object exitTransition, Fragment outFragment, ArrayList<View> exitingViews, ArrayMap<String, View> namedViews, View nonExistentView) {
        if (exitTransition != null) {
            return FragmentTransitionCompat21.captureExitingViews(exitTransition, outFragment.getView(), exitingViews, namedViews, nonExistentView);
        }
        return exitTransition;
    }

    private ArrayMap<String, View> remapSharedElements(TransitionState state, Fragment outFragment, boolean isBack) {
        ArrayMap namedViews = new ArrayMap();
        if (this.mSharedElementSourceNames != null) {
            FragmentTransitionCompat21.findNamedViews(namedViews, outFragment.getView());
            if (isBack) {
                namedViews.retainAll(this.mSharedElementTargetNames);
            } else {
                namedViews = remapNames(this.mSharedElementSourceNames, this.mSharedElementTargetNames, namedViews);
            }
        }
        if (isBack) {
            if (outFragment.mEnterTransitionCallback != null) {
                outFragment.mEnterTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, namedViews);
            }
            setBackNameOverrides(state, namedViews, false);
        } else {
            if (outFragment.mExitTransitionCallback != null) {
                outFragment.mExitTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, namedViews);
            }
            setNameOverrides(state, namedViews, false);
        }
        return namedViews;
    }

    private boolean configureTransitions(int containerId, TransitionState state, boolean isBack, SparseArray<Fragment> firstOutFragments, SparseArray<Fragment> lastInFragments) {
        int i = containerId;
        TransitionState transitionState = state;
        boolean z = isBack;
        View sceneRoot = (ViewGroup) this.mManager.mContainer.onFindViewById(i);
        if (sceneRoot == null) {
            return false;
        }
        Object sharedElementTransition;
        ArrayMap<String, View> namedViews;
        Object exitTransition;
        Object enterTransition;
        Fragment outFragment;
        final Fragment inFragment = (Fragment) lastInFragments.get(i);
        Fragment outFragment2 = (Fragment) firstOutFragments.get(i);
        Object enterTransition2 = getEnterTransition(inFragment, z);
        Object sharedElementTransition2 = getSharedElementTransition(inFragment, outFragment2, z);
        Object exitTransition2 = getExitTransition(outFragment2, z);
        ArrayList<View> sharedElementTargets = new ArrayList();
        if (sharedElementTransition2 != null) {
            ArrayMap<String, View> namedViews2 = remapSharedElements(transitionState, outFragment2, z);
            if (namedViews2.isEmpty()) {
                sharedElementTransition = null;
                namedViews = null;
                exitTransition = exitTransition2;
                enterTransition = enterTransition2;
                outFragment = outFragment2;
            } else {
                Object exitTransition3;
                SharedElementCallback callback = z ? outFragment2.mEnterTransitionCallback : inFragment.mEnterTransitionCallback;
                if (callback != null) {
                    exitTransition3 = exitTransition2;
                    callback.onSharedElementStart(new ArrayList(namedViews2.keySet()), new ArrayList(namedViews2.values()), null);
                } else {
                    exitTransition3 = exitTransition2;
                }
                ArrayMap<String, View> namedViews3 = namedViews2;
                exitTransition = exitTransition3;
                enterTransition = enterTransition2;
                outFragment = outFragment2;
                prepareSharedElementTransition(transitionState, sceneRoot, sharedElementTransition2, inFragment, outFragment2, z, sharedElementTargets);
                sharedElementTransition = sharedElementTransition2;
                namedViews = namedViews3;
            }
        } else {
            exitTransition = exitTransition2;
            enterTransition = enterTransition2;
            outFragment = outFragment2;
            namedViews = null;
            sharedElementTransition = sharedElementTransition2;
        }
        if (enterTransition == null && sharedElementTransition == null && exitTransition == null) {
            return false;
        }
        Object transition;
        boolean z2;
        boolean transition2;
        ArrayList<View> exitingViews = new ArrayList();
        Fragment outFragment3 = outFragment;
        exitTransition2 = captureExitingViews(exitTransition, outFragment3, exitingViews, namedViews, transitionState.nonExistentView);
        if (this.mSharedElementTargetNames != null && namedViews != null) {
            View epicenterView = (View) namedViews.get(this.mSharedElementTargetNames.get(0));
            if (epicenterView != null) {
                if (exitTransition2 != null) {
                    FragmentTransitionCompat21.setEpicenter(exitTransition2, epicenterView);
                }
                if (sharedElementTransition != null) {
                    FragmentTransitionCompat21.setEpicenter(sharedElementTransition, epicenterView);
                }
            }
        }
        Fragment inFragment2 = inFragment;
        AnonymousClass1 viewRetriever = new ViewRetriever() {
            public View getView() {
                return inFragment.getView();
            }
        };
        ArrayList<View> enteringViews = new ArrayList();
        ArrayMap<String, View> renamedViews = new ArrayMap();
        boolean allowOverlap = true;
        if (inFragment2 != null) {
            allowOverlap = z ? inFragment2.getAllowReturnTransitionOverlap() : inFragment2.getAllowEnterTransitionOverlap();
        }
        exitTransition = FragmentTransitionCompat21.mergeTransitions(enterTransition, exitTransition2, sharedElementTransition, allowOverlap);
        Object enterTransition3;
        if (exitTransition != null) {
            transition = exitTransition;
            z2 = false;
            View sceneRoot2 = sceneRoot;
            FragmentTransitionCompat21.addTransitionTargets(enterTransition, sharedElementTransition, sceneRoot, viewRetriever, transitionState.nonExistentView, transitionState.enteringEpicenterView, transitionState.nameOverrides, enteringViews, namedViews, renamedViews, sharedElementTargets);
            enterTransition3 = enterTransition;
            allowOverlap = sceneRoot2;
            int i2 = containerId;
            excludeHiddenFragmentsAfterEnter(allowOverlap, transitionState, i2, transition);
            transition2 = true;
            FragmentTransitionCompat21.excludeTarget(transition, transitionState.nonExistentView, true);
            excludeHiddenFragments(transitionState, i2, transition);
            FragmentTransitionCompat21.beginDelayedTransition(allowOverlap, transition);
            FragmentTransitionCompat21.cleanupTransitions(allowOverlap, transitionState.nonExistentView, enterTransition3, enteringViews, exitTransition2, exitingViews, sharedElementTransition, sharedElementTargets, transition, transitionState.hiddenFragmentViews, renamedViews);
        } else {
            boolean z3 = allowOverlap;
            enterTransition3 = enterTransition;
            transition = exitTransition;
            Fragment fragment = inFragment2;
            outFragment3 = containerId;
            transition2 = true;
            z2 = false;
        }
        if (transition == null) {
            transition2 = z2;
        }
        return transition2;
    }

    private void prepareSharedElementTransition(TransitionState state, View sceneRoot, Object sharedElementTransition, Fragment inFragment, Fragment outFragment, boolean isBack, ArrayList<View> sharedElementTargets) {
        final View view = sceneRoot;
        final Object obj = sharedElementTransition;
        final ArrayList<View> arrayList = sharedElementTargets;
        final TransitionState transitionState = state;
        final boolean z = isBack;
        final Fragment fragment = inFragment;
        final Fragment fragment2 = outFragment;
        sceneRoot.getViewTreeObserver().addOnPreDrawListener(new OnPreDrawListener() {
            public boolean onPreDraw() {
                view.getViewTreeObserver().removeOnPreDrawListener(this);
                if (obj != null) {
                    FragmentTransitionCompat21.removeTargets(obj, arrayList);
                    arrayList.clear();
                    ArrayMap<String, View> namedViews = BackStackRecord.this.mapSharedElementsIn(transitionState, z, fragment);
                    FragmentTransitionCompat21.setSharedElementTargets(obj, transitionState.nonExistentView, namedViews, arrayList);
                    BackStackRecord.this.setEpicenterIn(namedViews, transitionState);
                    BackStackRecord.this.callSharedElementEnd(transitionState, fragment, fragment2, z, namedViews);
                }
                return true;
            }
        });
    }

    private void callSharedElementEnd(TransitionState state, Fragment inFragment, Fragment outFragment, boolean isBack, ArrayMap<String, View> namedViews) {
        SharedElementCallback sharedElementCallback = isBack ? outFragment.mEnterTransitionCallback : inFragment.mEnterTransitionCallback;
        if (sharedElementCallback != null) {
            sharedElementCallback.onSharedElementEnd(new ArrayList(namedViews.keySet()), new ArrayList(namedViews.values()), null);
        }
    }

    private void setEpicenterIn(ArrayMap<String, View> namedViews, TransitionState state) {
        if (this.mSharedElementTargetNames != null && !namedViews.isEmpty()) {
            View epicenter = (View) namedViews.get(this.mSharedElementTargetNames.get(0));
            if (epicenter != null) {
                state.enteringEpicenterView.epicenter = epicenter;
            }
        }
    }

    private ArrayMap<String, View> mapSharedElementsIn(TransitionState state, boolean isBack, Fragment inFragment) {
        ArrayMap namedViews = mapEnteringSharedElements(state, inFragment, isBack);
        if (isBack) {
            if (inFragment.mExitTransitionCallback != null) {
                inFragment.mExitTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, namedViews);
            }
            setBackNameOverrides(state, namedViews, true);
        } else {
            if (inFragment.mEnterTransitionCallback != null) {
                inFragment.mEnterTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, namedViews);
            }
            setNameOverrides(state, namedViews, true);
        }
        return namedViews;
    }

    private static ArrayMap<String, View> remapNames(ArrayList<String> inMap, ArrayList<String> toGoInMap, ArrayMap<String, View> namedViews) {
        if (namedViews.isEmpty()) {
            return namedViews;
        }
        ArrayMap<String, View> remappedViews = new ArrayMap();
        int numKeys = inMap.size();
        for (int i = 0; i < numKeys; i++) {
            View view = (View) namedViews.get(inMap.get(i));
            if (view != null) {
                remappedViews.put(toGoInMap.get(i), view);
            }
        }
        return remappedViews;
    }

    private ArrayMap<String, View> mapEnteringSharedElements(TransitionState state, Fragment inFragment, boolean isBack) {
        ArrayMap<String, View> namedViews = new ArrayMap();
        View root = inFragment.getView();
        if (root == null || this.mSharedElementSourceNames == null) {
            return namedViews;
        }
        FragmentTransitionCompat21.findNamedViews(namedViews, root);
        if (isBack) {
            return remapNames(this.mSharedElementSourceNames, this.mSharedElementTargetNames, namedViews);
        }
        namedViews.retainAll(this.mSharedElementTargetNames);
        return namedViews;
    }

    private void excludeHiddenFragmentsAfterEnter(View sceneRoot, TransitionState state, int containerId, Object transition) {
        final View view = sceneRoot;
        final TransitionState transitionState = state;
        final int i = containerId;
        final Object obj = transition;
        sceneRoot.getViewTreeObserver().addOnPreDrawListener(new OnPreDrawListener() {
            public boolean onPreDraw() {
                view.getViewTreeObserver().removeOnPreDrawListener(this);
                BackStackRecord.this.excludeHiddenFragments(transitionState, i, obj);
                return true;
            }
        });
    }

    private void excludeHiddenFragments(TransitionState state, int containerId, Object transition) {
        if (this.mManager.mAdded != null) {
            for (int i = 0; i < this.mManager.mAdded.size(); i++) {
                Fragment fragment = (Fragment) this.mManager.mAdded.get(i);
                if (!(fragment.mView == null || fragment.mContainer == null || fragment.mContainerId != containerId)) {
                    if (!fragment.mHidden) {
                        FragmentTransitionCompat21.excludeTarget(transition, fragment.mView, false);
                        state.hiddenFragmentViews.remove(fragment.mView);
                    } else if (!state.hiddenFragmentViews.contains(fragment.mView)) {
                        FragmentTransitionCompat21.excludeTarget(transition, fragment.mView, true);
                        state.hiddenFragmentViews.add(fragment.mView);
                    }
                }
            }
        }
    }

    private static void setNameOverride(ArrayMap<String, String> overrides, String source, String target) {
        if (!(source == null || target == null)) {
            for (int index = 0; index < overrides.size(); index++) {
                if (source.equals(overrides.valueAt(index))) {
                    overrides.setValueAt(index, target);
                    return;
                }
            }
            overrides.put(source, target);
        }
    }

    private static void setNameOverrides(TransitionState state, ArrayList<String> sourceNames, ArrayList<String> targetNames) {
        if (sourceNames != null) {
            for (int i = 0; i < sourceNames.size(); i++) {
                setNameOverride(state.nameOverrides, (String) sourceNames.get(i), (String) targetNames.get(i));
            }
        }
    }

    private void setBackNameOverrides(TransitionState state, ArrayMap<String, View> namedViews, boolean isEnd) {
        int i = 0;
        int count = this.mSharedElementTargetNames == null ? 0 : this.mSharedElementTargetNames.size();
        while (i < count) {
            String source = (String) this.mSharedElementSourceNames.get(i);
            View view = (View) namedViews.get((String) this.mSharedElementTargetNames.get(i));
            if (view != null) {
                String target = FragmentTransitionCompat21.getTransitionName(view);
                if (isEnd) {
                    setNameOverride(state.nameOverrides, source, target);
                } else {
                    setNameOverride(state.nameOverrides, target, source);
                }
            }
            i++;
        }
    }

    private void setNameOverrides(TransitionState state, ArrayMap<String, View> namedViews, boolean isEnd) {
        int count = namedViews.size();
        for (int i = 0; i < count; i++) {
            String source = (String) namedViews.keyAt(i);
            String target = FragmentTransitionCompat21.getTransitionName((View) namedViews.valueAt(i));
            if (isEnd) {
                setNameOverride(state.nameOverrides, source, target);
            } else {
                setNameOverride(state.nameOverrides, target, source);
            }
        }
    }
}
