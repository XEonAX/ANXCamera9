package com.arcsoft.avatar.c;

import android.opengl.GLES30;
import com.arcsoft.avatar.d.f;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/* compiled from: FrameQueue */
public class d {
    private static final String a = d.class.getSimpleName();
    private c eh = null;
    private c ei = null;
    private List<c> ej = new ArrayList();
    private Queue<c> ek = new LinkedList();
    private boolean el;

    public void A() {
        if (this.eh != null) {
            this.ek.offer(this.eh);
            this.eh = null;
        }
    }

    public void B() {
        if (this.ei != null) {
            this.ej.add(this.ei);
            this.ei = null;
        }
    }

    public boolean C() {
        return this.el;
    }

    public void a(int i, int i2, int i3, boolean z) {
        unInit();
        for (int i4 = 0; i4 < i; i4++) {
            c cVar = new c();
            cVar.ef = true;
            cVar.mIsInited = true;
            cVar.eg = i4;
            cVar.ee = new com.arcsoft.avatar.a.d();
            cVar.ee.a(i2, i3, z);
            this.ej.add(cVar);
        }
        this.el = true;
    }

    public void a(c cVar) {
        try {
            if (0 != cVar.a) {
                String str = a;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("deleteSync delete_a_sync : ");
                stringBuilder.append(cVar.a);
                f.d(str, stringBuilder.toString());
                GLES30.glDeleteSync(cVar.a);
            }
        } catch (Exception e) {
            e.printStackTrace();
            String str2 = a;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("deleteSync meet error : ");
            stringBuilder2.append(e.getMessage());
            f.e(str2, stringBuilder2.toString());
        } catch (Throwable th) {
            cVar.a = 0;
        }
        cVar.a = 0;
    }

    public int queueSize() {
        return this.ek.size();
    }

    public void unInit() {
        if (!(this.eh == null || this.eh.ee == null)) {
            this.eh.ee.unInit();
            a(this.eh);
            this.eh.ee = null;
            this.eh = null;
        }
        if (!(this.ei == null || this.ei.ee == null)) {
            this.ei.ee.unInit();
            a(this.ei);
            this.ei.ee = null;
            this.ei = null;
        }
        if (!this.ej.isEmpty()) {
            for (c cVar : this.ej) {
                if (cVar.ee != null) {
                    cVar.ee.unInit();
                    a(cVar);
                    cVar.ee = null;
                }
            }
        }
        this.ej.clear();
        while (!this.ek.isEmpty()) {
            c cVar2 = (c) this.ek.poll();
            if (!(cVar2 == null || cVar2.ee == null)) {
                cVar2.ee.unInit();
                a(cVar2);
                cVar2.ee = null;
            }
        }
        this.ek.clear();
        this.el = false;
    }

    public c y() {
        if (this.eh != null) {
            return this.eh;
        }
        if (!this.ej.isEmpty()) {
            this.eh = (c) this.ej.remove(0);
        } else if (this.ek.isEmpty()) {
            return null;
        } else {
            this.eh = (c) this.ek.poll();
        }
        return this.eh;
    }

    public c z() {
        if (this.ei != null) {
            return this.ei;
        }
        if (this.ek.isEmpty()) {
            return null;
        }
        this.ei = (c) this.ek.poll();
        return this.ei;
    }
}
