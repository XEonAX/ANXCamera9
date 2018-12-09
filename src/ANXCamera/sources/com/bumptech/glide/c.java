package com.bumptech.glide;

import android.app.Activity;
import android.content.ComponentCallbacks2;
import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.View;
import com.bumptech.glide.c.e;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.a.k;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.prefill.a;
import com.bumptech.glide.load.g;
import com.bumptech.glide.load.h;
import com.bumptech.glide.load.model.r;
import com.bumptech.glide.load.model.s;
import com.bumptech.glide.load.model.u;
import com.bumptech.glide.load.model.w;
import com.bumptech.glide.load.resource.bitmap.VideoDecoder;
import com.bumptech.glide.load.resource.bitmap.i;
import com.bumptech.glide.load.resource.bitmap.m;
import com.bumptech.glide.load.resource.bitmap.n;
import com.bumptech.glide.load.resource.bitmap.t;
import com.bumptech.glide.load.resource.bitmap.v;
import com.bumptech.glide.load.resource.bitmap.x;
import com.bumptech.glide.load.resource.gif.ByteBufferGifDecoder;
import com.bumptech.glide.manager.d;
import com.bumptech.glide.manager.l;
import com.bumptech.glide.request.f;
import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* compiled from: Glide */
public class c implements ComponentCallbacks2 {
    private static final String TAG = "Glide";
    private static final String a = "image_manager_disk_cache";
    private static volatile c c;
    private static volatile boolean g;
    private final d A;
    private final List<i> C = new ArrayList();
    private MemoryCategory D = MemoryCategory.NORMAL;
    private final Engine h;
    private final com.bumptech.glide.load.engine.bitmap_recycle.d i;
    private final j k;
    private final a l;
    private final e o;
    private final Registry q;
    private final b r;
    private final l v;

    @Nullable
    public static File a(@NonNull Context context) {
        return a(context, "image_manager_disk_cache");
    }

    @Nullable
    public static File a(@NonNull Context context, @NonNull String str) {
        File cacheDir = context.getCacheDir();
        if (cacheDir != null) {
            File file = new File(cacheDir, str);
            if (file.mkdirs() || (file.exists() && file.isDirectory())) {
                return file;
            }
            return null;
        }
        if (Log.isLoggable(TAG, 6)) {
            Log.e(TAG, "default disk cache dir is null");
        }
        return null;
    }

    @NonNull
    public static c b(@NonNull Context context) {
        if (c == null) {
            synchronized (c.class) {
                if (c == null) {
                    c(context);
                }
            }
        }
        return c;
    }

    private static void c(@NonNull Context context) {
        if (g) {
            throw new IllegalStateException("You cannot call Glide.get() in registerComponents(), use the provided Glide instance instead");
        }
        g = true;
        d(context);
        g = false;
    }

    @VisibleForTesting
    @Deprecated
    public static synchronized void init(c cVar) {
        synchronized (c.class) {
            if (c != null) {
                tearDown();
            }
            c = cVar;
        }
    }

    @VisibleForTesting
    public static synchronized void init(@NonNull Context context, @NonNull d dVar) {
        synchronized (c.class) {
            if (c != null) {
                tearDown();
            }
            a(context, dVar);
        }
    }

    @VisibleForTesting
    public static synchronized void tearDown() {
        synchronized (c.class) {
            if (c != null) {
                c.getContext().getApplicationContext().unregisterComponentCallbacks(c);
                c.h.shutdown();
            }
            c = null;
        }
    }

    private static void d(@NonNull Context context) {
        a(context, new d());
    }

    private static void a(@NonNull Context context, @NonNull d dVar) {
        context = context.getApplicationContext();
        a d = d();
        List emptyList = Collections.emptyList();
        if (d == null || d.da()) {
            emptyList = new e(context).db();
        }
        if (!(d == null || d.a().isEmpty())) {
            Set a = d.a();
            Iterator it = emptyList.iterator();
            while (it.hasNext()) {
                com.bumptech.glide.c.c cVar = (com.bumptech.glide.c.c) it.next();
                if (a.contains(cVar.getClass())) {
                    if (Log.isLoggable(TAG, 3)) {
                        String str = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("AppGlideModule excludes manifest GlideModule: ");
                        stringBuilder.append(cVar);
                        Log.d(str, stringBuilder.toString());
                    }
                    it.remove();
                }
            }
        }
        if (Log.isLoggable(TAG, 3)) {
            for (com.bumptech.glide.c.c cVar2 : emptyList) {
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Discovered GlideModule from manifest: ");
                stringBuilder2.append(cVar2.getClass());
                Log.d(str2, stringBuilder2.toString());
            }
        }
        dVar.a(d != null ? d.b() : null);
        for (com.bumptech.glide.c.c cVar22 : emptyList) {
            cVar22.b(context, dVar);
        }
        if (d != null) {
            d.b(context, dVar);
        }
        Object g = dVar.g(context);
        for (com.bumptech.glide.c.c a2 : emptyList) {
            a2.a(context, g, g.q);
        }
        if (d != null) {
            d.a(context, g, g.q);
        }
        context.registerComponentCallbacks(g);
        c = g;
    }

    @Nullable
    private static a d() {
        try {
            return (a) Class.forName("com.bumptech.glide.GeneratedAppGlideModuleImpl").getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
        } catch (ClassNotFoundException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Failed to find GeneratedAppGlideModule. You should include an annotationProcessor compile dependency on com.github.bumptech.glide:compiler in your application and a @GlideModule annotated AppGlideModule implementation or LibraryGlideModules will be silently ignored");
            }
        } catch (Exception e2) {
            a(e2);
        } catch (Exception e22) {
            a(e22);
        } catch (Exception e222) {
            a(e222);
        } catch (Exception e2222) {
            a(e2222);
        }
        return null;
    }

    private static void a(Exception exception) {
        throw new IllegalStateException("GeneratedAppGlideModuleImpl is implemented incorrectly. If you've manually implemented this class, remove your implementation. The Annotation processor will generate a correct implementation.", exception);
    }

    c(@NonNull Context context, @NonNull Engine engine, @NonNull j jVar, @NonNull com.bumptech.glide.load.engine.bitmap_recycle.d dVar, @NonNull b bVar, @NonNull l lVar, @NonNull d dVar2, int i, @NonNull f fVar, @NonNull Map<Class<?>, j<?, ?>> map) {
        Context context2 = context;
        j jVar2 = jVar;
        com.bumptech.glide.load.engine.bitmap_recycle.d dVar3 = dVar;
        b bVar2 = bVar;
        this.h = engine;
        this.i = dVar3;
        this.r = bVar2;
        this.k = jVar2;
        this.v = lVar;
        this.A = dVar2;
        this.l = new a(jVar2, dVar3, (DecodeFormat) fVar.at().a(n.kE));
        Resources resources = context.getResources();
        this.q = new Registry();
        this.q.a(new m());
        n nVar = new n(this.q.q(), resources.getDisplayMetrics(), dVar3, bVar2);
        g byteBufferGifDecoder = new ByteBufferGifDecoder(context2, this.q.q(), dVar3, bVar2);
        g c = VideoDecoder.c(dVar);
        g iVar = new i(nVar);
        g vVar = new v(nVar, bVar2);
        g eVar = new com.bumptech.glide.load.resource.b.e(context2);
        com.bumptech.glide.load.model.n cVar = new com.bumptech.glide.load.model.r.c(resources);
        r.d dVar4 = new r.d(resources);
        r.b bVar3 = new r.b(resources);
        r.a aVar = new r.a(resources);
        h eVar2 = new com.bumptech.glide.load.resource.bitmap.e(bVar2);
        com.bumptech.glide.load.resource.d.a aVar2 = new com.bumptech.glide.load.resource.d.a();
        com.bumptech.glide.load.resource.d.d dVar5 = new com.bumptech.glide.load.resource.d.d();
        com.bumptech.glide.load.model.n nVar2 = bVar3;
        nVar2 = dVar4;
        com.bumptech.glide.load.model.n nVar3 = aVar;
        Context context3 = context;
        ContentResolver contentResolver = context.getContentResolver();
        com.bumptech.glide.load.resource.d.e eVar3 = aVar2;
        com.bumptech.glide.load.resource.d.e eVar4 = dVar5;
        this.q.b(ByteBuffer.class, new com.bumptech.glide.load.model.c()).b(InputStream.class, new s(bVar2)).a(Registry.as, ByteBuffer.class, Bitmap.class, iVar).a(Registry.as, InputStream.class, Bitmap.class, vVar).a(Registry.as, ParcelFileDescriptor.class, Bitmap.class, c).a(Registry.as, AssetFileDescriptor.class, Bitmap.class, VideoDecoder.b(dVar)).a(Bitmap.class, Bitmap.class, u.a.ce()).a(Registry.as, Bitmap.class, Bitmap.class, new x()).b(Bitmap.class, eVar2).a(Registry.at, ByteBuffer.class, BitmapDrawable.class, new com.bumptech.glide.load.resource.bitmap.a(resources, iVar)).a(Registry.at, InputStream.class, BitmapDrawable.class, new com.bumptech.glide.load.resource.bitmap.a(resources, vVar)).a(Registry.at, ParcelFileDescriptor.class, BitmapDrawable.class, new com.bumptech.glide.load.resource.bitmap.a(resources, c)).b(BitmapDrawable.class, new com.bumptech.glide.load.resource.bitmap.b(dVar3, eVar2)).a(Registry.ar, InputStream.class, com.bumptech.glide.load.resource.gif.b.class, new com.bumptech.glide.load.resource.gif.h(this.q.q(), byteBufferGifDecoder, bVar2)).a(Registry.ar, ByteBuffer.class, com.bumptech.glide.load.resource.gif.b.class, byteBufferGifDecoder).b(com.bumptech.glide.load.resource.gif.b.class, new com.bumptech.glide.load.resource.gif.c()).a(com.bumptech.glide.b.a.class, com.bumptech.glide.b.a.class, u.a.ce()).a(Registry.as, com.bumptech.glide.b.a.class, Bitmap.class, new com.bumptech.glide.load.resource.gif.f(dVar3)).a(Uri.class, Drawable.class, eVar).a(Uri.class, Bitmap.class, new t(eVar, dVar3)).a(new com.bumptech.glide.load.resource.a.a.a()).a(File.class, ByteBuffer.class, new com.bumptech.glide.load.model.d.b()).a(File.class, InputStream.class, new com.bumptech.glide.load.model.f.e()).a(File.class, File.class, new com.bumptech.glide.load.resource.c.a()).a(File.class, ParcelFileDescriptor.class, new com.bumptech.glide.load.model.f.b()).a(File.class, File.class, u.a.ce()).a(new k.a(bVar2)).a(Integer.TYPE, InputStream.class, cVar).a(Integer.TYPE, ParcelFileDescriptor.class, nVar2).a(Integer.class, InputStream.class, cVar).a(Integer.class, ParcelFileDescriptor.class, nVar2).a(Integer.class, Uri.class, nVar2).a(Integer.TYPE, AssetFileDescriptor.class, nVar3).a(Integer.class, AssetFileDescriptor.class, nVar3).a(Integer.TYPE, Uri.class, nVar2).a(String.class, InputStream.class, new com.bumptech.glide.load.model.e.c()).a(Uri.class, InputStream.class, new com.bumptech.glide.load.model.e.c()).a(String.class, InputStream.class, new com.bumptech.glide.load.model.t.c()).a(String.class, ParcelFileDescriptor.class, new com.bumptech.glide.load.model.t.b()).a(String.class, AssetFileDescriptor.class, new com.bumptech.glide.load.model.t.a()).a(Uri.class, InputStream.class, new com.bumptech.glide.load.model.a.c.a()).a(Uri.class, InputStream.class, new com.bumptech.glide.load.model.a.c(context.getAssets())).a(Uri.class, ParcelFileDescriptor.class, new com.bumptech.glide.load.model.a.b(context.getAssets())).a(Uri.class, InputStream.class, new com.bumptech.glide.load.model.a.d.a(context3)).a(Uri.class, InputStream.class, new com.bumptech.glide.load.model.a.e.a(context3)).a(Uri.class, InputStream.class, new com.bumptech.glide.load.model.v.d(contentResolver)).a(Uri.class, ParcelFileDescriptor.class, new com.bumptech.glide.load.model.v.b(contentResolver)).a(Uri.class, AssetFileDescriptor.class, new com.bumptech.glide.load.model.v.a(contentResolver)).a(Uri.class, InputStream.class, new w.a()).a(URL.class, InputStream.class, new com.bumptech.glide.load.model.a.f.a()).a(Uri.class, File.class, new com.bumptech.glide.load.model.k.a(context3)).a(com.bumptech.glide.load.model.g.class, InputStream.class, new com.bumptech.glide.load.model.a.b.a()).a(byte[].class, ByteBuffer.class, new com.bumptech.glide.load.model.b.a()).a(byte[].class, InputStream.class, new com.bumptech.glide.load.model.b.d()).a(Uri.class, Uri.class, u.a.ce()).a(Drawable.class, Drawable.class, u.a.ce()).a(Drawable.class, Drawable.class, new com.bumptech.glide.load.resource.b.f()).a(Bitmap.class, BitmapDrawable.class, new com.bumptech.glide.load.resource.d.b(resources)).a(Bitmap.class, byte[].class, eVar3).a(Drawable.class, byte[].class, new com.bumptech.glide.load.resource.d.c(dVar3, eVar3, eVar4)).a(com.bumptech.glide.load.resource.gif.b.class, byte[].class, eVar4);
        this.o = new e(context3, bVar2, this.q, new com.bumptech.glide.request.target.i(), fVar, map, engine, i);
    }

    @NonNull
    public com.bumptech.glide.load.engine.bitmap_recycle.d e() {
        return this.i;
    }

    @NonNull
    public b f() {
        return this.r;
    }

    @NonNull
    public Context getContext() {
        return this.o.getBaseContext();
    }

    d g() {
        return this.A;
    }

    @NonNull
    e h() {
        return this.o;
    }

    public void a(@NonNull com.bumptech.glide.load.engine.prefill.c.a... aVarArr) {
        this.l.b(aVarArr);
    }

    public void i() {
        com.bumptech.glide.util.k.eF();
        this.k.i();
        this.i.i();
        this.r.i();
    }

    public void trimMemory(int i) {
        com.bumptech.glide.util.k.eF();
        this.k.trimMemory(i);
        this.i.trimMemory(i);
        this.r.trimMemory(i);
    }

    public void j() {
        com.bumptech.glide.util.k.eG();
        this.h.j();
    }

    @NonNull
    public l k() {
        return this.v;
    }

    @NonNull
    public MemoryCategory a(@NonNull MemoryCategory memoryCategory) {
        com.bumptech.glide.util.k.eF();
        this.k.b(memoryCategory.p());
        this.i.b(memoryCategory.p());
        MemoryCategory memoryCategory2 = this.D;
        this.D = memoryCategory;
        return memoryCategory2;
    }

    @NonNull
    private static l e(@Nullable Context context) {
        com.bumptech.glide.util.i.a((Object) context, "You cannot start a load on a not yet attached View or a Fragment where getActivity() returns null (which usually occurs when getActivity() is called before the Fragment is attached or after the Fragment is destroyed).");
        return b(context).k();
    }

    @NonNull
    public static i f(@NonNull Context context) {
        return e(context).j(context);
    }

    @NonNull
    public static i a(@NonNull Activity activity) {
        return e(activity).c(activity);
    }

    @NonNull
    public static i a(@NonNull FragmentActivity fragmentActivity) {
        return e(fragmentActivity).b(fragmentActivity);
    }

    @NonNull
    public static i a(@NonNull Fragment fragment) {
        return e(fragment.getActivity()).b(fragment);
    }

    @Deprecated
    @NonNull
    public static i a(@NonNull android.app.Fragment fragment) {
        return e(fragment.getActivity()).d(fragment);
    }

    @NonNull
    public static i a(@NonNull View view) {
        return e(view.getContext()).c(view);
    }

    @NonNull
    public Registry l() {
        return this.q;
    }

    boolean a(@NonNull com.bumptech.glide.request.target.n<?> nVar) {
        synchronized (this.C) {
            for (i f : this.C) {
                if (f.f((com.bumptech.glide.request.target.n) nVar)) {
                    return true;
                }
            }
            return false;
        }
    }

    void a(i iVar) {
        synchronized (this.C) {
            if (this.C.contains(iVar)) {
                throw new IllegalStateException("Cannot register already registered manager");
            }
            this.C.add(iVar);
        }
    }

    void b(i iVar) {
        synchronized (this.C) {
            if (this.C.contains(iVar)) {
                this.C.remove(iVar);
            } else {
                throw new IllegalStateException("Cannot unregister not yet registered manager");
            }
        }
    }

    public void onTrimMemory(int i) {
        trimMemory(i);
    }

    public void onConfigurationChanged(Configuration configuration) {
    }

    public void onLowMemory() {
        i();
    }
}
