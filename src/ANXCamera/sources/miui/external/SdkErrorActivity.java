package miui.external;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import miui.external.SdkConstants.SdkError;

public class SdkErrorActivity extends Activity implements SdkConstants {
    private OnClickListener mDismissListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            dialogInterface.dismiss();
            SdkErrorActivity.this.finish();
            System.exit(0);
        }
    };
    private String mLanguage;
    private OnClickListener mUpdateListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            dialogInterface.dismiss();
            final Dialog access$000 = SdkErrorActivity.this.createUpdateDialog();
            new SdkDialogFragment(access$000).show(SdkErrorActivity.this.getFragmentManager(), "SdkUpdatePromptDialog");
            new AsyncTask<Void, Void, Boolean>() {
                protected Boolean doInBackground(Void... voidArr) {
                    try {
                        Thread.sleep(5000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    return Boolean.valueOf(SdkErrorActivity.this.updateSdk());
                }

                protected void onPostExecute(Boolean bool) {
                    access$000.dismiss();
                    new SdkDialogFragment(bool.booleanValue() ? SdkErrorActivity.this.createUpdateSuccessfulDialog() : SdkErrorActivity.this.createUpdateFailedDialog()).show(SdkErrorActivity.this.getFragmentManager(), "SdkUpdateFinishDialog");
                }
            }.execute(new Void[0]);
        }
    };

    class SdkDialogFragment extends DialogFragment {
        private Dialog mDialog;

        public SdkDialogFragment(Dialog dialog) {
            this.mDialog = dialog;
        }

        public Dialog onCreateDialog(Bundle bundle) {
            return this.mDialog;
        }
    }

    protected void onCreate(Bundle bundle) {
        SdkError sdkError;
        Dialog createNoSdkDialog;
        setTheme(16973909);
        super.onCreate(bundle);
        this.mLanguage = Locale.getDefault().getLanguage();
        Intent intent = getIntent();
        if (intent != null) {
            sdkError = (SdkError) intent.getSerializableExtra(SdkError.INTENT_EXTRA_KEY);
        } else {
            sdkError = null;
        }
        if (sdkError == null) {
            sdkError = SdkError.GENERIC;
        }
        switch (sdkError) {
            case NO_SDK:
                createNoSdkDialog = createNoSdkDialog();
                break;
            case LOW_SDK_VERSION:
                createNoSdkDialog = createLowSdkVersionDialog();
                break;
            default:
                createNoSdkDialog = createGenericErrorDialog();
                break;
        }
        new SdkDialogFragment(createNoSdkDialog).show(getFragmentManager(), "SdkErrorPromptDialog");
    }

    private Dialog createSingleActionDialog(String str, String str2, OnClickListener onClickListener) {
        return new Builder(this).setTitle(str).setMessage(str2).setPositiveButton(17039370, onClickListener).setIcon(17301543).setCancelable(false).create();
    }

    private Dialog createDoubleActionDialog(String str, String str2, OnClickListener onClickListener, OnClickListener onClickListener2) {
        return new Builder(this).setTitle(str).setMessage(str2).setPositiveButton(17039370, onClickListener).setNegativeButton(17039360, onClickListener2).setIcon(17301543).setCancelable(false).create();
    }

    private Dialog createGenericErrorDialog() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str = "MIUI SDK发生错误";
            str2 = "请重新安装MIUI SDK再运行本程序。";
        } else {
            str = "MIUI SDK encounter errors";
            str2 = "Please re-install MIUI SDK and then re-run this application.";
        }
        return createSingleActionDialog(str, str2, this.mDismissListener);
    }

    private Dialog createNoSdkDialog() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str = "没有找到MIUI SDK";
            str2 = "请先安装MIUI SDK再运行本程序。";
        } else {
            str = "MIUI SDK not found";
            str2 = "Please install MIUI SDK and then re-run this application.";
        }
        return createSingleActionDialog(str, str2, this.mDismissListener);
    }

    private Dialog createLowSdkVersionDialog() {
        String str;
        String str2;
        if (supportUpdateSdk()) {
            if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
                str = "MIUI SDK版本过低";
                str2 = "请先升级MIUI SDK再运行本程序。是否现在升级？";
            } else {
                str = "MIUI SDK too old";
                str2 = "Please upgrade MIUI SDK and then re-run this application. Upgrade now?";
            }
            return createDoubleActionDialog(str, str2, this.mUpdateListener, this.mDismissListener);
        }
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str = "MIUI SDK版本过低";
            str2 = "请先升级MIUI SDK再运行本程序。";
        } else {
            str = "MIUI SDK too old";
            str2 = "Please upgrade MIUI SDK and then re-run this application.";
        }
        return createSingleActionDialog(str, str2, this.mDismissListener);
    }

    private Dialog createUpdateDialog() {
        CharSequence charSequence;
        CharSequence charSequence2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            charSequence = "MIUI SDK正在更新";
            charSequence2 = "请稍候...";
        } else {
            charSequence = "MIUI SDK updating";
            charSequence2 = "Please wait...";
        }
        return ProgressDialog.show(this, charSequence, charSequence2, true, false);
    }

    private Dialog createUpdateSuccessfulDialog() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str = "MIUI SDK更新完成";
            str2 = "请重新运行本程序。";
        } else {
            str = "MIUI SDK updated";
            str2 = "Please re-run this application.";
        }
        return createSingleActionDialog(str, str2, this.mDismissListener);
    }

    private Dialog createUpdateFailedDialog() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str = "MIUI SDK更新失败";
            str2 = "请稍后重试。";
        } else {
            str = "MIUI SDK update failed";
            str2 = "Please try it later.";
        }
        return createSingleActionDialog(str, str2, this.mDismissListener);
    }

    private boolean supportUpdateSdk() {
        try {
            return ((Boolean) SdkEntranceHelper.getSdkEntrance().getMethod("supportUpdate", new Class[]{Map.class}).invoke(null, new Object[]{null})).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean updateSdk() {
        try {
            HashMap hashMap = new HashMap();
            return ((Boolean) SdkEntranceHelper.getSdkEntrance().getMethod("update", new Class[]{Map.class}).invoke(null, new Object[]{hashMap})).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
