package org.jcodec.containers.mp4.boxes;

import org.jcodec.containers.mp4.IBoxFactory;

public class UdtaBox extends NodeBox {
    private static final String FOURCC = "udta";

    public static UdtaBox createUdtaBox() {
        return new UdtaBox(Header.createHeader(fourcc(), 0));
    }

    public void setFactory(final IBoxFactory iBoxFactory) {
        this.factory = new IBoxFactory() {
            public Box newBox(Header header) {
                if (!header.getFourcc().equals(MetaBox.fourcc())) {
                    return iBoxFactory.newBox(header);
                }
                Box udtaMetaBox = new UdtaMetaBox(header);
                udtaMetaBox.setFactory(iBoxFactory);
                return udtaMetaBox;
            }
        };
    }

    public UdtaBox(Header header) {
        super(header);
    }

    public MetaBox meta() {
        return (MetaBox) NodeBox.findFirst(this, MetaBox.class, MetaBox.fourcc());
    }

    public static String fourcc() {
        return FOURCC;
    }
}
