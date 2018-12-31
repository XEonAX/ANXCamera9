package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class GlideException extends Exception {
    private static final StackTraceElement[] ga = new StackTraceElement[0];
    private static final long serialVersionUID = 1;
    private final List<Throwable> causes;
    private Class<?> dataClass;
    private DataSource dataSource;
    private String detailMessage;
    private c key;

    private static final class a implements Appendable {
        private static final String INDENT = "  ";
        private static final String gb = "";
        private final Appendable gc;
        private boolean gd = true;

        a(Appendable appendable) {
            this.gc = appendable;
        }

        public Appendable append(char c) throws IOException {
            boolean z = false;
            if (this.gd) {
                this.gd = false;
                this.gc.append(INDENT);
            }
            if (c == 10) {
                z = true;
            }
            this.gd = z;
            this.gc.append(c);
            return this;
        }

        public Appendable append(@Nullable CharSequence charSequence) throws IOException {
            charSequence = a(charSequence);
            return append(charSequence, 0, charSequence.length());
        }

        public Appendable append(@Nullable CharSequence charSequence, int i, int i2) throws IOException {
            charSequence = a(charSequence);
            boolean z = false;
            if (this.gd) {
                this.gd = false;
                this.gc.append(INDENT);
            }
            if (charSequence.length() > 0 && charSequence.charAt(i2 - 1) == 10) {
                z = true;
            }
            this.gd = z;
            this.gc.append(charSequence, i, i2);
            return this;
        }

        @NonNull
        private CharSequence a(@Nullable CharSequence charSequence) {
            if (charSequence == null) {
                return "";
            }
            return charSequence;
        }
    }

    public GlideException(String str) {
        this(str, Collections.emptyList());
    }

    public GlideException(String str, Throwable th) {
        this(str, Collections.singletonList(th));
    }

    public GlideException(String str, List<Throwable> list) {
        this.detailMessage = str;
        setStackTrace(ga);
        this.causes = list;
    }

    void a(c cVar, DataSource dataSource) {
        a(cVar, dataSource, null);
    }

    void a(c cVar, DataSource dataSource, Class<?> cls) {
        this.key = cVar;
        this.dataSource = dataSource;
        this.dataClass = cls;
    }

    public Throwable fillInStackTrace() {
        return this;
    }

    public List<Throwable> ba() {
        return this.causes;
    }

    public List<Throwable> bb() {
        List arrayList = new ArrayList();
        a((Throwable) this, arrayList);
        return arrayList;
    }

    public void j(String str) {
        List bb = bb();
        int size = bb.size();
        int i = 0;
        while (i < size) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Root cause (");
            int i2 = i + 1;
            stringBuilder.append(i2);
            stringBuilder.append(" of ");
            stringBuilder.append(size);
            stringBuilder.append(")");
            Log.i(str, stringBuilder.toString(), (Throwable) bb.get(i));
            i = i2;
        }
    }

    private void a(Throwable th, List<Throwable> list) {
        if (th instanceof GlideException) {
            for (Throwable a : ((GlideException) th).ba()) {
                a(a, (List) list);
            }
            return;
        }
        list.add(th);
    }

    public void printStackTrace() {
        printStackTrace(System.err);
    }

    public void printStackTrace(PrintStream printStream) {
        a(printStream);
    }

    public void printStackTrace(PrintWriter printWriter) {
        a(printWriter);
    }

    private void a(Appendable appendable) {
        a((Throwable) this, appendable);
        a(ba(), new a(appendable));
    }

    public String getMessage() {
        StringBuilder stringBuilder;
        String stringBuilder2;
        StringBuilder stringBuilder3 = new StringBuilder(71);
        stringBuilder3.append(this.detailMessage);
        if (this.dataClass != null) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(", ");
            stringBuilder.append(this.dataClass);
            stringBuilder2 = stringBuilder.toString();
        } else {
            stringBuilder2 = "";
        }
        stringBuilder3.append(stringBuilder2);
        if (this.dataSource != null) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(", ");
            stringBuilder.append(this.dataSource);
            stringBuilder2 = stringBuilder.toString();
        } else {
            stringBuilder2 = "";
        }
        stringBuilder3.append(stringBuilder2);
        if (this.key != null) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(", ");
            stringBuilder.append(this.key);
            stringBuilder2 = stringBuilder.toString();
        } else {
            stringBuilder2 = "";
        }
        stringBuilder3.append(stringBuilder2);
        List<Throwable> bb = bb();
        if (bb.isEmpty()) {
            return stringBuilder3.toString();
        }
        if (bb.size() == 1) {
            stringBuilder3.append("\nThere was 1 cause:");
        } else {
            stringBuilder3.append("\nThere were ");
            stringBuilder3.append(bb.size());
            stringBuilder3.append(" causes:");
        }
        for (Throwable th : bb) {
            stringBuilder3.append(10);
            stringBuilder3.append(th.getClass().getName());
            stringBuilder3.append('(');
            stringBuilder3.append(th.getMessage());
            stringBuilder3.append(')');
        }
        stringBuilder3.append("\n call GlideException#logRootCauses(String) for more detail");
        return stringBuilder3.toString();
    }

    private static void a(Throwable th, Appendable appendable) {
        try {
            appendable.append(th.getClass().toString()).append(": ").append(th.getMessage()).append(10);
        } catch (IOException e) {
            throw new RuntimeException(th);
        }
    }

    private static void a(List<Throwable> list, Appendable appendable) {
        try {
            b(list, appendable);
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    private static void b(List<Throwable> list, Appendable appendable) throws IOException {
        int size = list.size();
        int i = 0;
        while (i < size) {
            int i2 = i + 1;
            appendable.append("Cause (").append(String.valueOf(i2)).append(" of ").append(String.valueOf(size)).append("): ");
            Throwable th = (Throwable) list.get(i);
            if (th instanceof GlideException) {
                ((GlideException) th).a(appendable);
            } else {
                a(th, appendable);
            }
            i = i2;
        }
    }
}
