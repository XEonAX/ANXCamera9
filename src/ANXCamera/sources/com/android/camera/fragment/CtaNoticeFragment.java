package com.android.camera.fragment;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.FragmentManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.ui.UrlSpan;
import com.android.camera.ui.UrlSpan.UrlSpanOnClickListener;
import java.util.Locale;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public class CtaNoticeFragment extends DialogFragment {
    public static final String TAG = "CtaNoticeFragment";

    public static class CTA {
        private static boolean sCanConnectToNetworkTemp = true;

        public static boolean canConnectNetwork() {
            if (sCanConnectToNetworkTemp) {
                return true;
            }
            return ((DataItemGlobal) DataRepository.provider().dataGlobal()).getCTACanCollect();
        }

        public static void setCanConnectNetwork(boolean z) {
            if (z) {
                ((DataItemGlobal) DataRepository.provider().dataGlobal()).setCTACanCollect(true);
            } else {
                sCanConnectToNetworkTemp = true;
            }
        }
    }

    static class Licence {
        private static String URL_MIUI_PRIVACY_POLICY = "http://www.miui.com/res/doc/privacy.html";
        private static String URL_MIUI_USER_AGREEMENT = "http://www.miui.com/res/doc/eula.html";

        Licence() {
        }

        public static Intent getUserAgreementIntent() {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getUrlByLocale(URL_MIUI_USER_AGREEMENT)));
            return intent;
        }

        public static Intent getPrivacyIntent() {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getUrlByLocale(URL_MIUI_PRIVACY_POLICY)));
            return intent;
        }

        private static String getUrlByLocale(String str) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append("?lang=");
            stringBuilder.append(Locale.getDefault().getLanguage().equals("zh") ? "zh_CN" : "en_US");
            return stringBuilder.toString();
        }
    }

    public static boolean checkCta(FragmentManager fragmentManager) {
        if (CTA.canConnectNetwork()) {
            return true;
        }
        new CtaNoticeFragment().show(fragmentManager, TAG);
        return false;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setCancelable(false);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        return new Builder(getActivity()).setTitle(R.string.user_notice_title).setMessage(buildUserNotice(getActivity(), R.string.user_notice_identify_summary_format)).setPositiveButton(R.string.user_agree, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                CTA.setCanConnectNetwork(((AlertDialog) CtaNoticeFragment.this.getDialog()).isChecked());
            }
        }).setNegativeButton(17039360, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        }).setCheckBox(true, getActivity().getString(R.string.do_not_remind_me)).create();
    }

    public void onStart() {
        super.onStart();
        ((AlertDialog) getDialog()).getMessageView().setMovementMethod(LinkMovementMethod.getInstance());
    }

    private static SpannableStringBuilder buildUserNotice(final Context context, int i) {
        Resources resources = context.getResources();
        String string = resources.getString(R.string.user_agreement2);
        String string2 = resources.getString(R.string.user_agreement4);
        String string3 = resources.getString(i, new Object[]{string, string2});
        UrlSpanOnClickListener anonymousClass3 = new UrlSpanOnClickListener() {
            public void onClick() {
                context.startActivity(Licence.getUserAgreementIntent());
            }
        };
        UrlSpanOnClickListener anonymousClass4 = new UrlSpanOnClickListener() {
            public void onClick() {
                context.startActivity(Licence.getPrivacyIntent());
            }
        };
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(string3);
        int indexOf = string3.indexOf(string);
        spannableStringBuilder.setSpan(new UrlSpan(anonymousClass3), indexOf, string.length() + indexOf, 33);
        i = string3.indexOf(string2);
        spannableStringBuilder.setSpan(new UrlSpan(anonymousClass4), i, string2.length() + i, 33);
        return spannableStringBuilder;
    }
}
