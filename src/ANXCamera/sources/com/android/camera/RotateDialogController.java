package com.android.camera;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.text.SpannableString;
import android.text.TextPaint;
import android.text.method.LinkMovementMethod;
import android.text.style.ClickableSpan;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.aeonax.camera.R;
import com.android.camera.ui.Rotatable;
import com.android.camera.ui.RotateLayout;

public class RotateDialogController implements Rotatable {
    private static final long ANIM_DURATION = 150;
    private static final String TAG = "RotateDialogController";
    private Activity mActivity;
    private View mDialogRootLayout;
    private Animation mFadeInAnim;
    private Animation mFadeOutAnim;
    private int mLayoutResourceID;
    private RotateLayout mRotateDialog;
    private TextView mRotateDialogButton1;
    private TextView mRotateDialogButton2;
    private View mRotateDialogButtonLayout;
    private ProgressBar mRotateDialogSpinner;
    private TextView mRotateDialogText;
    private TextView mRotateDialogTitle;
    private View mRotateDialogTitleLayout;

    public RotateDialogController(Activity activity, int i) {
        this.mActivity = activity;
        if (i == 0) {
            i = R.layout.rotate_dialog;
        }
        this.mLayoutResourceID = i;
    }

    private void inflateDialogLayout() {
        if (this.mDialogRootLayout == null) {
            View inflate = this.mActivity.getLayoutInflater().inflate(this.mLayoutResourceID, (ViewGroup) this.mActivity.getWindow().getDecorView());
            this.mDialogRootLayout = inflate.findViewById(R.id.rotate_dialog_root_layout);
            this.mRotateDialog = (RotateLayout) inflate.findViewById(R.id.rotate_dialog_layout);
            this.mRotateDialogTitleLayout = inflate.findViewById(R.id.rotate_dialog_title_layout);
            this.mRotateDialogButtonLayout = inflate.findViewById(R.id.rotate_dialog_button_layout);
            this.mRotateDialogTitle = (TextView) inflate.findViewById(R.id.rotate_dialog_title);
            this.mRotateDialogSpinner = (ProgressBar) inflate.findViewById(R.id.rotate_dialog_spinner);
            this.mRotateDialogText = (TextView) inflate.findViewById(R.id.rotate_dialog_text);
            this.mRotateDialogButton1 = (Button) inflate.findViewById(R.id.rotate_dialog_button1);
            this.mRotateDialogButton2 = (Button) inflate.findViewById(R.id.rotate_dialog_button2);
            this.mFadeInAnim = AnimationUtils.loadAnimation(this.mActivity, 17432576);
            this.mFadeOutAnim = AnimationUtils.loadAnimation(this.mActivity, 17432577);
            this.mFadeInAnim.setDuration(ANIM_DURATION);
            this.mFadeOutAnim.setDuration(ANIM_DURATION);
        }
    }

    public void setOrientation(int i, boolean z) {
        inflateDialogLayout();
        this.mRotateDialog.setOrientation(i, z);
    }

    public void resetRotateDialog() {
        inflateDialogLayout();
        this.mRotateDialogTitleLayout.setVisibility(8);
        this.mRotateDialogSpinner.setVisibility(8);
        this.mRotateDialogButton1.setVisibility(8);
        this.mRotateDialogButton2.setVisibility(8);
        this.mRotateDialogButtonLayout.setVisibility(8);
    }

    private void fadeOutDialog() {
        this.mDialogRootLayout.startAnimation(this.mFadeOutAnim);
        this.mDialogRootLayout.setVisibility(8);
    }

    private void fadeInDialog() {
        this.mDialogRootLayout.startAnimation(this.mFadeInAnim);
        this.mDialogRootLayout.setVisibility(0);
    }

    public void dismissDialog() {
        if (this.mDialogRootLayout != null && this.mDialogRootLayout.getVisibility() != 8) {
            fadeOutDialog();
        }
    }

    public void showAlertDialog(String str, String str2, String str3, final Runnable runnable, String str4, final Runnable runnable2) {
        resetRotateDialog();
        if (str != null) {
            this.mRotateDialogTitle.setText(str);
            this.mRotateDialogTitleLayout.setVisibility(0);
        }
        this.mRotateDialogText.setText(str2);
        if (str3 != null) {
            this.mRotateDialogButton1.setText(str3);
            this.mRotateDialogButton1.setContentDescription(str3);
            this.mRotateDialogButton1.setVisibility(0);
            this.mRotateDialogButton1.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    if (runnable != null) {
                        runnable.run();
                    }
                    RotateDialogController.this.dismissDialog();
                }
            });
            this.mRotateDialogButtonLayout.setVisibility(0);
        }
        if (str4 != null) {
            this.mRotateDialogButton2.setText(str4);
            this.mRotateDialogButton2.setContentDescription(str4);
            this.mRotateDialogButton2.setVisibility(0);
            this.mRotateDialogButton2.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    if (runnable2 != null) {
                        runnable2.run();
                    }
                    RotateDialogController.this.dismissDialog();
                }
            });
            this.mRotateDialogButtonLayout.setVisibility(0);
        }
        fadeInDialog();
    }

    public static AlertDialog showSystemAlertDialog(Context context, String str, String str2, String str3, final Runnable runnable, String str4, final Runnable runnable2) {
        Builder builder = new Builder(context);
        builder.setTitle(str);
        builder.setMessage(str2);
        builder.setCancelable(false);
        if (str3 != null) {
            builder.setPositiveButton(str3, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    if (runnable != null) {
                        runnable.run();
                    }
                }
            });
        }
        if (str4 != null) {
            builder.setNegativeButton(str4, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    if (runnable2 != null) {
                        runnable2.run();
                    }
                }
            });
        }
        AlertDialog create = builder.create();
        create.show();
        return create;
    }

    public static AlertDialog showSystemChoiceDialog(final Context context, String str, String str2, String str3, String str4, final Runnable runnable, final Runnable runnable2) {
        OnKeyListener anonymousClass5 = new OnKeyListener() {
            public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
                return i == 25 || i == 24;
            }
        };
        Builder builder = new Builder(context);
        View inflate = LayoutInflater.from(context).inflate(R.layout.v6_choice_alertdialog, null);
        ((TextView) inflate.findViewById(R.id.alert_declaration)).setText(str2);
        Object string = context.getResources().getString(R.string.view_privacy_policy);
        CharSequence spannableString = new SpannableString(string);
        spannableString.setSpan(new ClickableSpan() {
            public void onClick(View view) {
                ActivityLauncher.launchPrivacyPolicyWebpage(context);
            }

            public void updateDrawState(TextPaint textPaint) {
                super.updateDrawState(textPaint);
                textPaint.setColor(context.getResources().getColor(17170432));
            }
        }, 0, string.length(), 33);
        TextView textView = (TextView) inflate.findViewById(R.id.view_privacy_policy);
        textView.setClickable(true);
        textView.setText(spannableString);
        textView.setMovementMethod(LinkMovementMethod.getInstance());
        final CheckBox checkBox = (CheckBox) inflate.findViewById(R.id.alert_declaration_checkbox);
        checkBox.setText(str3);
        builder.setOnKeyListener(anonymousClass5);
        builder.setTitle(str);
        builder.setCancelable(false);
        builder.setView(inflate);
        if (str4 != null) {
            builder.setPositiveButton(str4, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    if (checkBox.isChecked()) {
                        if (runnable != null) {
                            runnable.run();
                        }
                    } else if (runnable2 != null) {
                        runnable2.run();
                    }
                }
            });
        }
        AlertDialog create = builder.create();
        create.show();
        return create;
    }

    public void showWaitingDialog(String str) {
        resetRotateDialog();
        this.mRotateDialogText.setText(str);
        this.mRotateDialogSpinner.setVisibility(0);
        fadeInDialog();
    }
}
