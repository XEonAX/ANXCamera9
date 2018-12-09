package android.support.test.runner.intent;

import android.app.Instrumentation.ActivityResult;
import android.content.Intent;

public interface IntentStubber {
    ActivityResult getActivityResultForIntent(Intent intent);
}
