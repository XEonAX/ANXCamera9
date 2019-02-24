package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.app.NotificationCompatBase.Action;
import android.support.v4.app.NotificationCompatBase.Action.Factory;
import android.widget.RemoteViews;
import java.util.ArrayList;

class NotificationCompatApi20 {

    public static class Builder implements NotificationBuilderWithBuilderAccessor, NotificationBuilderWithActions {
        private android.app.Notification.Builder b;
        private Bundle mExtras;

        public Builder(Context context, Notification n, CharSequence contentTitle, CharSequence contentText, CharSequence contentInfo, RemoteViews tickerView, int number, PendingIntent contentIntent, PendingIntent fullScreenIntent, Bitmap largeIcon, int progressMax, int progress, boolean progressIndeterminate, boolean showWhen, boolean useChronometer, int priority, CharSequence subText, boolean localOnly, ArrayList<String> people, Bundle extras, String groupKey, boolean groupSummary, String sortKey) {
            Notification notification = n;
            ArrayList<String> arrayList = people;
            Bundle bundle = extras;
            boolean z = false;
            android.app.Notification.Builder deleteIntent = new android.app.Notification.Builder(context).setWhen(notification.when).setShowWhen(showWhen).setSmallIcon(notification.icon, notification.iconLevel).setContent(notification.contentView).setTicker(notification.tickerText, tickerView).setSound(notification.sound, notification.audioStreamType).setVibrate(notification.vibrate).setLights(notification.ledARGB, notification.ledOnMS, notification.ledOffMS).setOngoing((notification.flags & 2) != 0).setOnlyAlertOnce((notification.flags & 8) != 0).setAutoCancel((notification.flags & 16) != 0).setDefaults(notification.defaults).setContentTitle(contentTitle).setContentText(contentText).setSubText(subText).setContentInfo(contentInfo).setContentIntent(contentIntent).setDeleteIntent(notification.deleteIntent);
            if ((notification.flags & 128) != 0) {
                z = true;
            }
            this.b = deleteIntent.setFullScreenIntent(fullScreenIntent, z).setLargeIcon(largeIcon).setNumber(number).setUsesChronometer(useChronometer).setPriority(priority).setProgress(progressMax, progress, progressIndeterminate).setLocalOnly(localOnly).setGroup(groupKey).setGroupSummary(groupSummary).setSortKey(sortKey);
            this.mExtras = new Bundle();
            if (bundle != null) {
                this.mExtras.putAll(bundle);
            }
            if (arrayList != null && !people.isEmpty()) {
                this.mExtras.putStringArray(NotificationCompat.EXTRA_PEOPLE, (String[]) arrayList.toArray(new String[people.size()]));
            }
        }

        public void addAction(Action action) {
            NotificationCompatApi20.addAction(this.b, action);
        }

        public android.app.Notification.Builder getBuilder() {
            return this.b;
        }

        public Notification build() {
            this.b.setExtras(this.mExtras);
            return this.b.build();
        }
    }

    NotificationCompatApi20() {
    }

    public static void addAction(android.app.Notification.Builder b, Action action) {
        android.app.Notification.Action.Builder actionBuilder = new android.app.Notification.Action.Builder(action.getIcon(), action.getTitle(), action.getActionIntent());
        if (action.getRemoteInputs() != null) {
            for (RemoteInput remoteInput : RemoteInputCompatApi20.fromCompat(action.getRemoteInputs())) {
                actionBuilder.addRemoteInput(remoteInput);
            }
        }
        if (action.getExtras() != null) {
            actionBuilder.addExtras(action.getExtras());
        }
        b.addAction(actionBuilder.build());
    }

    public static Action getAction(Notification notif, int actionIndex, Factory actionFactory, RemoteInputCompatBase.RemoteInput.Factory remoteInputFactory) {
        return getActionCompatFromAction(notif.actions[actionIndex], actionFactory, remoteInputFactory);
    }

    private static Action getActionCompatFromAction(Notification.Action action, Factory actionFactory, RemoteInputCompatBase.RemoteInput.Factory remoteInputFactory) {
        return actionFactory.build(action.icon, action.title, action.actionIntent, action.getExtras(), RemoteInputCompatApi20.toCompat(action.getRemoteInputs(), remoteInputFactory));
    }

    private static Notification.Action getActionFromActionCompat(Action actionCompat) {
        android.app.Notification.Action.Builder actionBuilder = new android.app.Notification.Action.Builder(actionCompat.getIcon(), actionCompat.getTitle(), actionCompat.getActionIntent()).addExtras(actionCompat.getExtras());
        RemoteInputCompatBase.RemoteInput[] remoteInputCompats = actionCompat.getRemoteInputs();
        if (remoteInputCompats != null) {
            for (RemoteInput remoteInput : RemoteInputCompatApi20.fromCompat(remoteInputCompats)) {
                actionBuilder.addRemoteInput(remoteInput);
            }
        }
        return actionBuilder.build();
    }

    public static Action[] getActionsFromParcelableArrayList(ArrayList<Parcelable> parcelables, Factory actionFactory, RemoteInputCompatBase.RemoteInput.Factory remoteInputFactory) {
        if (parcelables == null) {
            return null;
        }
        Action[] actions = actionFactory.newArray(parcelables.size());
        for (int i = 0; i < actions.length; i++) {
            actions[i] = getActionCompatFromAction((Notification.Action) parcelables.get(i), actionFactory, remoteInputFactory);
        }
        return actions;
    }

    public static ArrayList<Parcelable> getParcelableArrayListForActions(Action[] actions) {
        if (actions == null) {
            return null;
        }
        ArrayList<Parcelable> parcelables = new ArrayList(actions.length);
        for (Action action : actions) {
            parcelables.add(getActionFromActionCompat(action));
        }
        return parcelables;
    }

    public static boolean getLocalOnly(Notification notif) {
        return (notif.flags & 256) != 0;
    }

    public static String getGroup(Notification notif) {
        return notif.getGroup();
    }

    public static boolean isGroupSummary(Notification notif) {
        return (notif.flags & 512) != 0;
    }

    public static String getSortKey(Notification notif) {
        return notif.getSortKey();
    }
}
