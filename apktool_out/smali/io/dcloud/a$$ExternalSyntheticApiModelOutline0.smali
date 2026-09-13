.class public final synthetic Lio/dcloud/a$$ExternalSyntheticApiModelOutline0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"


# direct methods
.method public static bridge synthetic m(Landroid/media/PlaybackParams;)F
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/media/PlaybackParams;->getSpeed()F

    move-result p0

    return p0
.end method

.method public static bridge synthetic m()I
    .locals 1

    .line 0
    sget v0, Landroid/system/OsConstants;->EOPNOTSUPP:I

    return v0
.end method

.method public static bridge synthetic m(Landroid/app/AppOpsManager;Ljava/lang/String;ILjava/lang/String;)I
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2, p3}, Landroid/app/AppOpsManager;->unsafeCheckOpNoThrow(Ljava/lang/String;ILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ApplicationInfo;)I
    .locals 0

    .line 0
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->minSdkVersion:I

    return p0
.end method

.method public static bridge synthetic m(Landroid/graphics/ColorSpace;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/graphics/ColorSpace;->hashCode()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/os/SharedMemory;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/os/SharedMemory;->getSize()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/system/ErrnoException;)I
    .locals 0

    .line 0
    iget p0, p0, Landroid/system/ErrnoException;->errno:I

    return p0
.end method

.method public static bridge synthetic m(Landroid/view/Window;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/view/Window;->getStatusBarColor()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/webkit/WebChromeClient$FileChooserParams;)I
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/webkit/WebChromeClient$FileChooserParams;->getMode()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ljava/io/FileDescriptor;JI)J
    .locals 0

    .line 0
    invoke-static {p0, p1, p2, p3}, Landroid/system/Os;->lseek(Ljava/io/FileDescriptor;JI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static bridge synthetic m(Ljava/time/Duration;)J
    .locals 2

    .line 0
    invoke-virtual {p0}, Ljava/time/Duration;->toMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static bridge synthetic m(Landroid/bluetooth/le/ScanResult;)Landroid/bluetooth/BluetoothDevice;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/bluetooth/le/ScanResult;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/bluetooth/BluetoothDevice;Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;I)Landroid/bluetooth/BluetoothGatt;
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;I)Landroid/bluetooth/BluetoothGatt;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/bluetooth/BluetoothAdapter;)Landroid/bluetooth/le/BluetoothLeScanner;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothLeScanner()Landroid/bluetooth/le/BluetoothLeScanner;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/bluetooth/le/ScanFilter$Builder;Landroid/os/ParcelUuid;)Landroid/bluetooth/le/ScanFilter$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/bluetooth/le/ScanFilter$Builder;->setServiceUuid(Landroid/os/ParcelUuid;)Landroid/bluetooth/le/ScanFilter$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/bluetooth/le/ScanFilter$Builder;)Landroid/bluetooth/le/ScanFilter;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/bluetooth/le/ScanFilter$Builder;->build()Landroid/bluetooth/le/ScanFilter;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/bluetooth/le/ScanSettings$Builder;J)Landroid/bluetooth/le/ScanSettings$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/bluetooth/le/ScanSettings$Builder;->setReportDelay(J)Landroid/bluetooth/le/ScanSettings$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/bluetooth/le/ScanSettings$Builder;)Landroid/bluetooth/le/ScanSettings;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/bluetooth/le/ScanSettings$Builder;->build()Landroid/bluetooth/le/ScanSettings;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2, p3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroidx/appcompat/app/AppCompatActivity;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroidx/appcompat/app/AppCompatActivity;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;
    .locals 0

    .line 0
    invoke-virtual/range {p0 .. p5}, Landroidx/appcompat/app/AppCompatActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(J)Landroid/content/pm/PackageManager$ResolveInfoFlags;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/content/pm/PackageManager$ResolveInfoFlags;->of(J)Landroid/content/pm/PackageManager$ResolveInfoFlags;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ShortcutInfo$Builder;Landroid/content/Intent;)Landroid/content/pm/ShortcutInfo$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/pm/ShortcutInfo$Builder;->setIntent(Landroid/content/Intent;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/facebook/drawee/view/DraweeView;)Landroid/content/res/ColorStateList;
    .locals 0

    .line 0
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getImageTintList()Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/util/Size;Landroid/os/CancellationSignal;)Landroid/graphics/Bitmap;
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2, p3}, Landroid/content/ContentResolver;->loadThumbnail(Landroid/net/Uri;Landroid/util/Size;Landroid/os/CancellationSignal;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/ColorSpace;
    .locals 0

    .line 0
    iget-object p0, p0, Landroid/graphics/BitmapFactory$Options;->outColorSpace:Landroid/graphics/ColorSpace;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/media/MediaPlayer;)Landroid/media/PlaybackParams;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getPlaybackParams()Landroid/media/PlaybackParams;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/media/PlaybackParams;F)Landroid/media/PlaybackParams;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/media/PlaybackParams;->setSpeed(F)Landroid/media/PlaybackParams;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/String;I)Landroid/os/SharedMemory;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/os/SharedMemory;->create(Ljava/lang/String;I)Landroid/os/SharedMemory;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/StaticLayout$Builder;->setEllipsizedWidth(I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/text/StaticLayout$Builder;Landroid/text/TextUtils$TruncateAt;)Landroid/text/StaticLayout$Builder;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/text/StaticLayout$Builder;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Landroid/util/Property;
    .locals 1

    .line 0
    sget-object v0, Landroid/view/View;->TRANSLATION_Z:Landroid/util/Property;

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/app/Activity;)Landroid/view/Display;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/view/WindowInsets;Landroid/graphics/Rect;)Landroid/view/WindowInsets;
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(Landroid/graphics/Rect;)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/webkit/SafeBrowsingResponse;
    .locals 0

    .line 0
    check-cast p0, Landroid/webkit/SafeBrowsingResponse;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/webkit/ServiceWorkerWebSettings;
    .locals 0

    .line 0
    check-cast p0, Landroid/webkit/ServiceWorkerWebSettings;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/webkit/WebMessagePort;
    .locals 0

    .line 0
    check-cast p0, Landroid/webkit/WebMessagePort;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/webkit/WebResourceError;
    .locals 0

    .line 0
    check-cast p0, Landroid/webkit/WebResourceError;

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/io/FileDescriptor;)Ljava/io/FileDescriptor;
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/system/Os;->dup(Ljava/io/FileDescriptor;)Ljava/io/FileDescriptor;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/InputStream;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Ljava/nio/file/Files;->newInputStream(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/OutputStream;
    .locals 0

    .line 0
    invoke-static {p0, p1}, Ljava/nio/file/Files;->newOutputStream(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/OutputStream;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Ljava/lang/String;
    .locals 1

    .line 0
    invoke-static {}, Landroid/app/Application;->getProcessName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/system/ErrnoException;)Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/system/ErrnoException;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/system/Os;->readlink(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Ljavax/net/ssl/SSLSocket;->getApplicationProtocol()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/os/SharedMemory;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/os/SharedMemory;->mapReadWrite()Ljava/nio/ByteBuffer;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/PackageManager;Landroid/content/Intent;Landroid/content/pm/PackageManager$ResolveInfoFlags;)Ljava/util/List;
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;Landroid/content/pm/PackageManager$ResolveInfoFlags;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/webkit/WebResourceResponse;)Ljava/util/Map;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/webkit/WebResourceResponse;->getResponseHeaders()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()V
    .locals 0

    .line 0
    invoke-static {}, Landroid/webkit/WebView;->enableSlowWholeDocumentDraw()V

    return-void
.end method

.method public static bridge synthetic m(Landroid/animation/StateListAnimator;[ILandroid/animation/Animator;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/app/AlertDialog;)V
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/app/AlertDialog;->create()V

    return-void
.end method

.method public static bridge synthetic m(Landroid/bluetooth/le/BluetoothLeScanner;Landroid/bluetooth/le/ScanCallback;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/bluetooth/le/BluetoothLeScanner;->stopScan(Landroid/bluetooth/le/ScanCallback;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/bluetooth/le/BluetoothLeScanner;Ljava/util/List;Landroid/bluetooth/le/ScanSettings;Landroid/bluetooth/le/ScanCallback;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2, p3}, Landroid/bluetooth/le/BluetoothLeScanner;->startScan(Ljava/util/List;Landroid/bluetooth/le/ScanSettings;Landroid/bluetooth/le/ScanCallback;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/Context;->revokeSelfPermissionOnKill(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/content/Context;Ljava/util/Collection;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/content/Context;->revokeSelfPermissionsOnKill(Ljava/util/Collection;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/ColorSpace;)V
    .locals 0

    .line 0
    iput-object p1, p0, Landroid/graphics/BitmapFactory$Options;->inPreferredColorSpace:Landroid/graphics/ColorSpace;

    return-void
.end method

.method public static bridge synthetic m(Landroid/graphics/Canvas;FFFFFFZLandroid/graphics/Paint;)V
    .locals 0

    .line 0
    invoke-virtual/range {p0 .. p8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/graphics/Outline;Landroid/graphics/Path;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/MediaMetadataRetriever;Landroid/media/MediaDataSource;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Landroid/media/MediaDataSource;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/media/MediaPlayer;Landroid/media/PlaybackParams;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->setPlaybackParams(Landroid/media/PlaybackParams;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/os/SharedMemory;)V
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/os/SharedMemory;->close()V

    return-void
.end method

.method public static bridge synthetic m(Landroid/view/View;Landroid/animation/StateListAnimator;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/view/View;Landroid/view/ViewOutlineProvider;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/view/View;Z)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/view/Window;I)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/Window;->setNavigationBarColor(I)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/webkit/PermissionRequest;[Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/webkit/WebResourceResponse;Ljava/util/Map;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/webkit/WebResourceResponse;->setResponseHeaders(Ljava/util/Map;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/hjq/permissions/PermissionFragment;[Ljava/lang/String;I)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1, p2}, Lcom/hjq/permissions/PermissionFragment;->requestPermissions([Ljava/lang/String;I)V

    return-void
.end method

.method public static bridge synthetic m(Lio/dcloud/common/core/ui/keyboard/DCEditText;Landroid/view/ActionMode$Callback;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Lio/dcloud/common/core/ui/keyboard/DCEditText;->setCustomInsertionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    return-void
.end method

.method public static bridge synthetic m(Ljava/io/FileDescriptor;)V
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/system/Os;->close(Ljava/io/FileDescriptor;)V

    return-void
.end method

.method public static bridge synthetic m(Ljava/io/FileDescriptor;JJ)V
    .locals 0

    .line 0
    invoke-static {p0, p1, p2, p3, p4}, Landroid/system/Os;->posix_fallocate(Ljava/io/FileDescriptor;JJ)V

    return-void
.end method

.method public static bridge synthetic m(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/os/SharedMemory;->unmap(Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public static bridge synthetic m(Ljavax/net/ssl/SSLParameters;[Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Ljavax/net/ssl/SSLParameters;->setApplicationProtocols([Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Ljavax/net/ssl/SSLSocket;Z)V
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroid/net/ssl/SSLSockets;->setUseSessionTickets(Ljavax/net/ssl/SSLSocket;Z)V

    return-void
.end method

.method public static bridge synthetic m()Z
    .locals 1

    .line 0
    invoke-static {}, Landroid/os/Process;->is64Bit()Z

    move-result v0

    return v0
.end method

.method public static bridge synthetic m(Landroid/app/AlarmManager;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/app/AlarmManager;->canScheduleExactAlarms()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/app/NotificationManager;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/app/NotificationManager;->isNotificationPolicyAccessGranted()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/bluetooth/BluetoothGatt;I)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/bluetooth/BluetoothGatt;->requestMtu(I)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/Context;)Z
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/provider/Settings$System;->canWrite(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/content/pm/PackageManager;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/graphics/ColorSpace;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/graphics/ColorSpace;->isWideGamut()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/os/Handler;Ljava/lang/Runnable;)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/os/Handler;->hasCallbacks(Ljava/lang/Runnable;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/os/PowerManager;Ljava/lang/String;)Z
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/view/WindowInsets;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/view/WindowInsets;->hasStableInsets()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ljavax/net/ssl/SSLSocket;)Z
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/net/ssl/SSLSockets;->isSupportedSocket(Ljavax/net/ssl/SSLSocket;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m()[Ljava/lang/String;
    .locals 1

    .line 0
    sget-object v0, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/content/pm/ApplicationInfo;)[Ljava/lang/String;
    .locals 0

    .line 0
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->splitSourceDirs:[Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/webkit/PermissionRequest;)[Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/webkit/WebChromeClient$FileChooserParams;)[Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1()I
    .locals 1

    .line 0
    sget v0, Landroid/system/OsConstants;->ENOSYS:I

    return v0
.end method

.method public static bridge synthetic m$1(Landroid/system/ErrnoException;)Ljava/lang/String;
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/system/ErrnoException;->getMessage()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/view/Window;I)V
    .locals 0

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    return-void
.end method

.method public static bridge synthetic m$1()Z
    .locals 1

    .line 0
    invoke-static {}, Landroid/os/Environment;->isExternalStorageLegacy()Z

    move-result v0

    return v0
.end method

.method public static bridge synthetic m$1(Landroid/content/Context;)Z
    .locals 0

    .line 0
    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$1(Landroid/view/WindowInsets;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/view/WindowInsets;->hasInsets()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$2()I
    .locals 1

    .line 0
    sget v0, Landroid/system/OsConstants;->EINVAL:I

    return v0
.end method

.method public static bridge synthetic m$2(Landroid/view/WindowInsets;)Z
    .locals 0

    .line 0
    invoke-virtual {p0}, Landroid/view/WindowInsets;->hasSystemWindowInsets()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m$3()I
    .locals 1

    .line 0
    sget v0, Landroid/system/OsConstants;->SEEK_SET:I

    return v0
.end method

.method public static bridge synthetic m$4()I
    .locals 1

    .line 0
    sget v0, Landroid/system/OsConstants;->SEEK_CUR:I

    return v0
.end method
