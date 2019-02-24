package com.google.android.apps.gsa.search.shared.service.proto.nano;

import com.google.protobuf.nano.Extension;

public abstract class LensServiceClientEvent {
    public static final Extension<ClientEventProto, LensServiceClientEventData> lensServiceClientEventData = Extension.createMessageTyped(11, LensServiceClientEventData.class, 1221335114);

    private LensServiceClientEvent() {
    }
}
