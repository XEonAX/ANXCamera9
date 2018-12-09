package com.google.android.apps.gsa.search.shared.service.proto.nano;

import com.google.protobuf.nano.Extension;

public abstract class LensServiceEvent {
    public static final Extension<ServiceEventProto, LensServiceEventData> lensServiceEventData = Extension.createMessageTyped(11, LensServiceEventData.class, 1221335106);

    private LensServiceEvent() {
    }
}
