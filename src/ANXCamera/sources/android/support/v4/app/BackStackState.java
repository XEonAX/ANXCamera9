package android.support.v4.app;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;

/* compiled from: BackStackRecord */
final class BackStackState implements Parcelable {
    public static final Creator<BackStackState> CREATOR = new Creator<BackStackState>() {
        public BackStackState createFromParcel(Parcel in) {
            return new BackStackState(in);
        }

        public BackStackState[] newArray(int size) {
            return new BackStackState[size];
        }
    };
    final int mBreadCrumbShortTitleRes;
    final CharSequence mBreadCrumbShortTitleText;
    final int mBreadCrumbTitleRes;
    final CharSequence mBreadCrumbTitleText;
    final int mIndex;
    final String mName;
    final int[] mOps;
    final ArrayList<String> mSharedElementSourceNames;
    final ArrayList<String> mSharedElementTargetNames;
    final int mTransition;
    final int mTransitionStyle;

    public BackStackState(BackStackRecord bse) {
        int numRemoved = 0;
        for (Op op = bse.mHead; op != null; op = op.next) {
            if (op.removed != null) {
                numRemoved += op.removed.size();
            }
        }
        this.mOps = new int[((bse.mNumOp * 7) + numRemoved)];
        if (bse.mAddToBackStack) {
            int pos = 0;
            for (Op op2 = bse.mHead; op2 != null; op2 = op2.next) {
                int pos2 = pos + 1;
                this.mOps[pos] = op2.cmd;
                int pos3 = pos2 + 1;
                this.mOps[pos2] = op2.fragment != null ? op2.fragment.mIndex : -1;
                pos2 = pos3 + 1;
                this.mOps[pos3] = op2.enterAnim;
                pos3 = pos2 + 1;
                this.mOps[pos2] = op2.exitAnim;
                pos2 = pos3 + 1;
                this.mOps[pos3] = op2.popEnterAnim;
                pos3 = pos2 + 1;
                this.mOps[pos2] = op2.popExitAnim;
                if (op2.removed != null) {
                    pos = op2.removed.size();
                    int pos4 = pos3 + 1;
                    this.mOps[pos3] = pos;
                    pos3 = 0;
                    while (pos3 < pos) {
                        int pos5 = pos4 + 1;
                        this.mOps[pos4] = ((Fragment) op2.removed.get(pos3)).mIndex;
                        pos3++;
                        pos4 = pos5;
                    }
                    pos = pos4;
                } else {
                    pos2 = pos3 + 1;
                    this.mOps[pos3] = 0;
                    pos = pos2;
                }
            }
            this.mTransition = bse.mTransition;
            this.mTransitionStyle = bse.mTransitionStyle;
            this.mName = bse.mName;
            this.mIndex = bse.mIndex;
            this.mBreadCrumbTitleRes = bse.mBreadCrumbTitleRes;
            this.mBreadCrumbTitleText = bse.mBreadCrumbTitleText;
            this.mBreadCrumbShortTitleRes = bse.mBreadCrumbShortTitleRes;
            this.mBreadCrumbShortTitleText = bse.mBreadCrumbShortTitleText;
            this.mSharedElementSourceNames = bse.mSharedElementSourceNames;
            this.mSharedElementTargetNames = bse.mSharedElementTargetNames;
            return;
        }
        throw new IllegalStateException("Not on back stack");
    }

    public BackStackState(Parcel in) {
        this.mOps = in.createIntArray();
        this.mTransition = in.readInt();
        this.mTransitionStyle = in.readInt();
        this.mName = in.readString();
        this.mIndex = in.readInt();
        this.mBreadCrumbTitleRes = in.readInt();
        this.mBreadCrumbTitleText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(in);
        this.mBreadCrumbShortTitleRes = in.readInt();
        this.mBreadCrumbShortTitleText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(in);
        this.mSharedElementSourceNames = in.createStringArrayList();
        this.mSharedElementTargetNames = in.createStringArrayList();
    }

    public BackStackRecord instantiate(FragmentManagerImpl fm) {
        BackStackRecord bse = new BackStackRecord(fm);
        int pos = 0;
        int num = 0;
        while (pos < this.mOps.length) {
            Op op = new Op();
            int pos2 = pos + 1;
            op.cmd = this.mOps[pos];
            if (FragmentManagerImpl.DEBUG) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Instantiate ");
                stringBuilder.append(bse);
                stringBuilder.append(" op #");
                stringBuilder.append(num);
                stringBuilder.append(" base fragment #");
                stringBuilder.append(this.mOps[pos2]);
                Log.v("FragmentManager", stringBuilder.toString());
            }
            int pos3 = pos2 + 1;
            pos = this.mOps[pos2];
            if (pos >= 0) {
                op.fragment = (Fragment) fm.mActive.get(pos);
            } else {
                op.fragment = null;
            }
            int pos4 = pos3 + 1;
            op.enterAnim = this.mOps[pos3];
            pos2 = pos4 + 1;
            op.exitAnim = this.mOps[pos4];
            pos4 = pos2 + 1;
            op.popEnterAnim = this.mOps[pos2];
            pos2 = pos4 + 1;
            op.popExitAnim = this.mOps[pos4];
            pos4 = pos2 + 1;
            pos3 = this.mOps[pos2];
            if (pos3 > 0) {
                op.removed = new ArrayList(pos3);
                pos2 = 0;
                while (pos2 < pos3) {
                    if (FragmentManagerImpl.DEBUG) {
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Instantiate ");
                        stringBuilder2.append(bse);
                        stringBuilder2.append(" set remove fragment #");
                        stringBuilder2.append(this.mOps[pos4]);
                        Log.v("FragmentManager", stringBuilder2.toString());
                    }
                    int pos5 = pos4 + 1;
                    op.removed.add((Fragment) fm.mActive.get(this.mOps[pos4]));
                    pos2++;
                    pos4 = pos5;
                }
            }
            bse.addOp(op);
            num++;
            pos = pos4;
        }
        bse.mTransition = this.mTransition;
        bse.mTransitionStyle = this.mTransitionStyle;
        bse.mName = this.mName;
        bse.mIndex = this.mIndex;
        bse.mAddToBackStack = true;
        bse.mBreadCrumbTitleRes = this.mBreadCrumbTitleRes;
        bse.mBreadCrumbTitleText = this.mBreadCrumbTitleText;
        bse.mBreadCrumbShortTitleRes = this.mBreadCrumbShortTitleRes;
        bse.mBreadCrumbShortTitleText = this.mBreadCrumbShortTitleText;
        bse.mSharedElementSourceNames = this.mSharedElementSourceNames;
        bse.mSharedElementTargetNames = this.mSharedElementTargetNames;
        bse.bumpBackStackNesting(1);
        return bse;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeIntArray(this.mOps);
        dest.writeInt(this.mTransition);
        dest.writeInt(this.mTransitionStyle);
        dest.writeString(this.mName);
        dest.writeInt(this.mIndex);
        dest.writeInt(this.mBreadCrumbTitleRes);
        TextUtils.writeToParcel(this.mBreadCrumbTitleText, dest, 0);
        dest.writeInt(this.mBreadCrumbShortTitleRes);
        TextUtils.writeToParcel(this.mBreadCrumbShortTitleText, dest, 0);
        dest.writeStringList(this.mSharedElementSourceNames);
        dest.writeStringList(this.mSharedElementTargetNames);
    }
}
